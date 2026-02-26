"""
Adversarial PGD attack on CSTR tracking control system.

Translates Fig2a.m to Python, trains a neural network approximation of the
sliding-mode controller, then applies ART's ProjectedGradientDescent to
generate adversarial temperature measurements y_adv.

System: CSTR (Continuous Stirred Tank Reactor)
  x1 = conversion (x in MATLAB)
  x2 = temperature (y in MATLAB)
  Controller: signum sliding-mode, S = sign(x2 - r2)

Attack framing:
  classifier input  : [x2_measured, r2_ref]  (shape: [N, 2])
  classifier output : S class ∈ {-1→0, 0→1, 1→2}  (3 classes)
  pgd.generate(y)   : y = measurement array (N, 2), returns y_adv perturbed
"""

import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from art.attacks.evasion import ProjectedGradientDescent
from art.estimators.classification import PyTorchClassifier

# ── Parameters from Fig2a.m ───────────────────────────────────────────────────
alpha  = 1.0
betta  = 100.0
gamma  = 20.0
B      = 1.0
Da     = 0.072
n      = 45_000
tmax   = 45.0
dt     = tmax / n

# ── Reference signals ─────────────────────────────────────────────────────────
def r1_ref(t: float) -> float:
    if t <= 15:   return 0.4472
    elif t < 30:  return 0.7646
    else:         return 0.4472

def r2_ref(t: float) -> float:
    if t <= 15:   return 2.752
    elif t < 30:  return 4.7052
    else:         return 2.752

# ── Simulate Fig2a.m (Euler integration) ─────────────────────────────────────
def simulate():
    x  = np.zeros(n)
    y  = np.zeros(n)
    t  = np.zeros(n)
    r1 = np.zeros(n)
    r2 = np.zeros(n)

    r1[0] = 0.0
    r2[0] = 0.0

    for i in range(n - 1):
        t[i + 1]  = t[i] + dt
        r1[i + 1] = r1_ref(t[i + 1])
        r2[i + 1] = r2_ref(t[i + 1])

        rxn = Da * (1.0 - x[i]) * np.exp(y[i] / (1.0 + y[i] / gamma))

        e2 = y[i] - r2[i]
        S  = 1.0 if e2 > 0 else (-1.0 if e2 < 0 else 0.0)

        x[i + 1] = x[i] + dt * (-alpha * x[i] + rxn)
        y[i + 1] = y[i] + dt * (-betta * S + r2[i + 1] - r2[i])

    return t, x, y, r1, r2

print("Running Fig2a.m simulation...")
t_traj, x_traj, y_traj, r1_traj, r2_traj = simulate()

# ── Build training dataset ────────────────────────────────────────────────────
# Input:  [x2_measurement, r2_reference]
# Label:  sign class of (x2 - r2)  mapped to {-1→0, 0→1, 1→2}
e2_train = y_traj[:-1] - r2_traj[:-1]
labels   = np.where(e2_train > 0, 2, np.where(e2_train < 0, 0, 1)).astype(np.int64)

X_train = np.stack([y_traj[:-1], r2_traj[:-1]], axis=1).astype(np.float32)

# ── Neural network controller approximation ───────────────────────────────────
class ControllerNet(nn.Module):
    def __init__(self):
        super().__init__()
        self.net = nn.Sequential(
            nn.Linear(2, 64), nn.Tanh(),
            nn.Linear(64, 64), nn.Tanh(),
            nn.Linear(64, 3),
        )

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        return self.net(x)

model     = ControllerNet()
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=1e-3)

dataset = torch.utils.data.TensorDataset(
    torch.tensor(X_train),
    torch.tensor(labels),
)
loader = torch.utils.data.DataLoader(dataset, batch_size=1024, shuffle=True)

print("Training controller approximation...")
for epoch in range(10):
    total_loss = 0.0
    for xb, yb in loader:
        optimizer.zero_grad()
        loss = criterion(model(xb), yb)
        loss.backward()
        optimizer.step()
        total_loss += loss.item()
    print(f"  epoch {epoch + 1:2d}  loss={total_loss / len(loader):.4f}")

# ── ART classifier wrapper ────────────────────────────────────────────────────
classifier = PyTorchClassifier(
    model=model,
    loss=criterion,
    optimizer=optimizer,
    input_shape=(2,),
    nb_classes=3,
    clip_values=(0.0, 6.0),   # x2 (temperature) physical bounds
)

# ── PGD attack ────────────────────────────────────────────────────────────────
ε    = 0.1    # max perturbation magnitude on temperature measurement
α    = 0.01   # PGD step size
Npgd = 40     # number of PGD iterations

pgd   = ProjectedGradientDescent(classifier, eps=ε, eps_step=α, max_iter=Npgd)

y = X_train[:2000]           # measurement window to attack, shape (N, 2)
y_adv = pgd.generate(y)      # adversarially perturbed measurements

# ── Report ────────────────────────────────────────────────────────────────────
preds_clean = np.argmax(classifier.predict(y),     axis=1)
preds_adv   = np.argmax(classifier.predict(y_adv), axis=1)

flip_rate   = np.mean(preds_clean != preds_adv)
max_delta   = np.max(np.abs(y_adv - y))
mean_delta  = np.mean(np.abs(y_adv - y))

print(f"\nPGD results (ε={ε}, α={α}, Npgd={Npgd}):")
print(f"  Sign-class flip rate : {flip_rate * 100:.1f}%")
print(f"  Max  |δy|            : {max_delta:.4f}")
print(f"  Mean |δy|            : {mean_delta:.4f}")
print(f"\nSample comparison:")
print(f"  y[0]     = {y[0]}")
print(f"  y_adv[0] = {y_adv[0]}")
print(f"  Δ        = {y_adv[0] - y[0]}")
