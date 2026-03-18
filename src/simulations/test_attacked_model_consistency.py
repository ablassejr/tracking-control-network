import pathlib
import unittest


ROOT = pathlib.Path(__file__).resolve().parents[2]
MATLAB_ATTACKED = ROOT / "src" / "simulations" / "matlab" / "cstr" / "attacked" / "cstr_state_tracking_attacked.m"


class AttackedModelConsistencyTests(unittest.TestCase):
    def test_matlab_attack_is_applied_only_to_x2(self) -> None:
        source = MATLAB_ATTACKED.read_text()

        self.assertNotIn(
            "f1(i)=x(i)+dt*(-alpha*x(i)+Da*(1-x(i))*exp(y(i)/(1+y(i)/gamma))) + epsilon;",
            source,
        )
        self.assertIn(
            "f2(i)=y(i)+dt*(-alpha*y(i)+B*Da*(1-x(i))*exp(y(i)/(1+y(i)/gamma)));",
            source,
        )
        self.assertIn("x(i+1)=f1(i);", source)
        self.assertIn("y(i+1)=y(i)+dt*(-betta*S(i)+r2(i+1)-r2(i)) + epsilon;", source)


if __name__ == "__main__":
    unittest.main()
