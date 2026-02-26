Below is a **full, speaker-attributed transcript** (timestamps preserved). Cleaned for readability with speaker attribution based on context, topic ownership, and conversational flow.

**Speaker key**

- **Dr. Tymoshchuk** = advisor (on-site, teaching class concurrently)
- **Ablasse** = undergraduate researcher (attack/defense simulation track, online)
- **Jeffrey** = undergraduate researcher (MATLAB-to-Python performance study, on-site)
- **Joshua** = former CAHSI student (C++ translation support; referenced via email, not live)
- **[Unclear]** = cannot confidently attribute from text

---

# Full Transcript (Speaker-Annotated) — Meeting ID meeting-c9ec410d-4180-47c5-936f-df6a9c118ebc

**Date: 2/20/2026**

---

## Part 1: Meeting Setup & Structure

**[00:36] [Unclear]:** No.

**[01:22] [Unclear]:** Yeah.

**[01:27] Dr. Tymoshchuk:** Nice. I am very sorry. I am forced — it has to be parallelized among students, one in-office or offline, one online, something like that. Because actually I need to teach a class, and today is—

**[01:46] Dr. Tymoshchuk:** So you are correct about the address. I sent you the link for the journal. So what we can do is we can give the address and we can just write "Emerald, Volume 314." So that will cover for now — whether we get A or B.

**[02:14] Ablasse:** Okay, make sure.

**[02:16] Jeffrey:** Can you hear me? Yeah, yeah. Do I need to — is it — are they talking to two or just in the—

**[02:23] Ablasse:** They're talking to him. I think he tried to get out of the meeting.

**[02:28] Dr. Tymoshchuk:** Well, so how you organized this meeting — to have it efficient — maybe in which way — maybe you could one by one show — please open — we have one — open two files. One file: the plan. Second file: the journal. And so, let's see — on the current week — and show correspondent results related to current week. And in the journal, the plan for next week. Something like that. And ask related questions, please — follow related questions. Something like that, apparently. The most efficient, fast.

**[03:36] Jeffrey:** Yeah.

**[03:58] Jeffrey:** Can you — I mean can you still see us? Yeah.

---

## Part 2: Ablasse's Presentation — Block Diagram & Attack Method

**[04:08] Jeffrey:** Who presents first?

**[04:10] Ablasse:** True — free.

**[04:13] Jeffrey:** I think I'm about to say — this is open.

**[04:16] Ablasse:** The Ablasse? This is — great. Is it the — Ablasse — is — so—

**[04:25] Dr. Tymoshchuk:** So what do you show, Ablasse, firstly? Well okay, so—

**[04:31] Ablasse:** So what is the — this is not the full thing.

**[04:36] Dr. Tymoshchuk:** You mean these are your questions, or what is it?

**[04:43] Ablasse:** No, this is my draft of some — people.

**[04:46] Dr. Tymoshchuk:** Yeah, yeah.

**[04:56] Dr. Tymoshchuk:** Please remind me — title of your project.

**[05:05] Ablasse:** Discrete or — defending a tracking control — here, here, here. It's this — "An Analysis and Simulation of Defending Tracking Control Neural Networks—"

**[05:18] Dr. Tymoshchuk:** She — sheet — wait on—

**[05:32] Ablasse:** So it's this — great time.

**[05:35] Ablasse:** Trying — tracking — this controller with this time.

**[05:46] Dr. Tymoshchuk:** Okay, okay, so please continue.

**[05:56] Dr. Tymoshchuk:** Do you show code?

**[06:02] Ablasse:** So I wrote.

**[06:12] Dr. Tymoshchuk:** Excuse me, it's the derivative thing. Could you show—

**[06:19] Ablasse:** Mm-hmm.

**[06:21] Dr. Tymoshchuk:** Could you show this week — a part of the plan?

**[06:28] Ablasse:** Yeah.

**[06:34] Dr. Tymoshchuk:** Present and analyze it.

**[06:37] Ablasse:** I feel — if you—

**[06:40] Dr. Tymoshchuk:** It's twenty — well, is—

**[06:44] Ablasse:** Okay, so we should be here.

**[06:47] Ablasse:** Ah, the — diagram.

**[06:50] Dr. Tymoshchuk:** So Ablasse's diagram. Oh yeah.

**[06:55] Ablasse:** This isn't — so okay. This is the diagram of the system with—

**[06:59] Dr. Tymoshchuk:** Oh, it's animation. Nice. It's just that — it's — yeah, yeah, yeah, you're right. Our previous student attended a conference nearby in Louisiana. He said that people show such toys in online mode in real time, something — so very nice idea, yeah.

**[07:27] Ablasse:** I mean, I just — I don't know. Anyway, yeah, so this is just the—

**[07:40] Ablasse:** Perturbations — with or like attacks. Or defense. It doesn't have the — and it doesn't have the Ablasse—

**[07:45] Dr. Tymoshchuk:** This is good, very nice toy for a presentation. But for a poster, it should be static. Yeah.

**[08:04] Ablasse:** Yeah. So I mean, I could — like, it's just — it's static now. So it's not — it's just something I thought makes it easier to see where everything is.

**[08:14] Dr. Tymoshchuk:** Yeah, yeah, yeah. Very nice. Yeah, well, one can see how this data, how these signals are — ah, move in which direction and so on. Nice, nice, very nice.

**[08:27] Ablasse:** But okay, so the — I haven't done the — like, I know what defense I'm gonna do. Or sorry, what method of attack I'm going to say.

**[08:39] Dr. Tymoshchuk:** Yeah.

**[08:42] Ablasse:** Yeah, projected gradient descent attack. Which apparently is the most — it's the most accurate first-order attack. I've seen — and I got this from — I could show you the research paper.

**[08:57] Ablasse:** This research paper: "Safety Filtering for Systems with Perception Models Subject to Adversarial Attacks." That's the research paper that it's from. Or that I found it on.

**[09:33] Ablasse:** And it goes — and to simulate it—

**[09:48] Ablasse:** But yeah, method — Allen below. Yeah, it's this equation. It goes into simulating an attack. And this is what he uses. It's called projected gradient descent.

**[10:02] Ablasse:** So I still have to put that in the equation, but I think for every $x(k)$, it's $x(k) + \Delta x(k)$, I think. And then you just define—

**[10:10] Dr. Tymoshchuk:** Could you show here in this paper — expression for control, or equation for control $U$?

**[10:25] Ablasse:** Where is it?

**[10:29] Dr. Tymoshchuk:** No, it should be below.

**[10:31] Ablasse:** Well, this is — oh, this is a state—

**[10:34] Dr. Tymoshchuk:** Yeah, it's state — let's go below.

**[10:50] Ablasse:** You have to tell me — I'm not gonna lie to you. Which is this paper? What do you show you?

**[10:57] Ablasse:** It's safety filtering. So it's just — I think it's like testing methods of enforcing constraints, basically, on—

**[11:06] Dr. Tymoshchuk:** You mean you found some additional paper in this — and — okay, so how can we use this paper? We can find out how people—

**[11:25] Ablasse:** People.

**[11:26] Dr. Tymoshchuk:** No — simulates — how people simulate these adversarial attacks.

**[11:35] Dr. Tymoshchuk:** Yeah, which data, which signals. Have you found out where it's described here?

**[11:48] Ablasse:** It's on the input, so—

**[11:51] Dr. Tymoshchuk:** And where is the input description?

**[11:58] Dr. Tymoshchuk:** Ablasse. So you can show or not this paper — please. Use this method in here — in your draft. You should have here this description equation and add this adversarial attack additional signal or input simulating this adversarial attack, using this idea of these guys from this paper, and show it.

**[12:31] Ablasse:** I have it here, but I don't — I haven't — this is the part, like, I'm still working on this. Just putting it inside of the tracking equation.

**[12:45] Dr. Tymoshchuk:** So how do they do it? Using some random pseudo-random numbers or some additional constant input, or — how? They use its own neural network?

**[12:58] Ablasse:** Yeah, it's its own neural network, and essentially it seeks to—

**[13:02] Dr. Tymoshchuk:** It's unclear. It should be some random signal or data.

**[13:09] Ablasse:** It's not random. They—

**[13:12] Dr. Tymoshchuk:** From what I understand — are they dynamic, this data, or permanent?

**[13:18] Ablasse:** Dynamic.

**[13:20] Dr. Tymoshchuk:** And which law — how these dynamics are changed — should be some equation, apparently.

**[13:36] Dr. Tymoshchuk:** Okay, Ablasse, please share this paper.

**[13:40] Ablasse:** Okay, I will send it to you. Do you want — or do you want me to show it now?

**[13:45] Dr. Tymoshchuk:** No, you can — it's apparently necessary to analyze it. It can be done later.

**[13:53] Ablasse:** I'll send you a little bit more. Yeah.

**[13:58] Dr. Tymoshchuk:** This is a very nice presentation. But I see that it's a bit different, apparently, from this first reference paper which I provided you with.

**[14:21] Ablasse:** We — yeah, we have here this beta.

**[14:29] Dr. Tymoshchuk:** Do you want me to explain where it came from, or—

**[14:36] Dr. Tymoshchuk:** And what is this $T$ here? We don't have this $T$. What means this $T$?

**[14:43] Ablasse:** That's the — block marked by $T$. Capital $T$ factor. It's $\tau$.

**[14:54] Ablasse:** It's just a — it's tau.

**[14:58] Dr. Tymoshchuk:** But we don't have this tau in the—

**[15:08] Dr. Tymoshchuk:** We have — I provided you with reference one.

**[15:15] Ablasse:** I guess I just—

**[15:16] Dr. Tymoshchuk:** Reference one paper, where this your block diagram is presented.

**[15:25] Ablasse:** Yeah. I just added that, I guess. Thinking about the state — I guess this data—

**[15:39] Dr. Tymoshchuk:** Why do you have this black background here?

**[15:44] Ablasse:** It's the Toro [a tool/theme]. It's a research — like—

**[16:00] Dr. Tymoshchuk:** Could you provide a white background?

**[16:13] Ablasse:** Yeah.

---

## Part 3: Dr. Tymoshchuk's Directives for Ablasse (This Week & Next)

**[16:22] Dr. Tymoshchuk:** Okay, so — reminding. This week you should draw this diagram and describe it. That's all. No more rewarding and so on — spend time and so on. So necessary to have it drawn in any graphical editor. Insert it to your Word file and describe it. Describe in the same spirit, in the same form as it's done here in this basic paper one. That's all.

**[17:07] Ablasse:** Okay.

**[17:09] Dr. Tymoshchuk:** Okay, you don't need to be able to do that [the animation]. But you can use it much more later to present it later at a potential conference, something like that. So it's a derivative thing. Now it's necessary to have this diagram drawn in a graphical editor and insert it to your draft Word file and describe it. That's all. For this week.

**[17:40] Dr. Tymoshchuk:** And for next week, let's — well, so — this week. And for next week.

**[17:56] Dr. Tymoshchuk:** Oh, next week — midterm report. So for next week, write in your journal — copy-paste this statement — prepare it for me to see this midterm report. Prepare. Which means that you should have already — read in this Word file — all topics described here in your plan.

**[18:30] Ablasse:** It's four minutes.

**[18:32] Dr. Tymoshchuk:** That's all. Do you follow or not?

**[18:35] Ablasse:** Yeah, I follow.

**[18:49] Ablasse:** No, I guess — like, try and modify it to fit the project.

**[18:54] Dr. Tymoshchuk:** Paper yet?

**[19:01] Dr. Tymoshchuk:** Ablasse, do you have a plan? Help plan — research plan? And a list of assigned tasks? Until midterm — this report.

**[19:11] Dr. Tymoshchuk:** One, two, three, four, five. So all these elements — it's necessary to describe — to have in your Word draft.

**[19:29] Dr. Tymoshchuk:** Five. Present it and describe it. Simulate it, insert it, describe it.

**[19:41] Ablasse:** Next week's then? I don't know — two weeks from now?

**[19:44] Dr. Tymoshchuk:** What?

**[19:45] Ablasse:** Oh, here — this week—

**[19:48] Dr. Tymoshchuk:** This week. Currently we are this week. And next week is—

**[19:57] Ablasse:** Ah, excuse me. Yeah, yeah, I missed — quite—

**[20:06] Dr. Tymoshchuk:** Next week you should have what—

**[20:10] Ablasse:** Simulation, yeah.

**[20:11] Dr. Tymoshchuk:** Yeah, yeah. Implement and simulate this diagram and this equation. In what? In MATLAB. And—

**[20:25] Dr. Tymoshchuk:** Could you remind me what you chose? And C++.

**[20:32] Ablasse:** We were talking about that, actually.

**[20:37] Dr. Tymoshchuk:** Once again — insert to this Word file. Along with all previous results of previous weeks. All previous weeks. Because of — so we have yet one week for these simulations and description, and after that it should be with time already.

**[21:02] Dr. Tymoshchuk:** Yeah — report. Results available in your Word draft. So taking it into account — think about specific details which are not clear for you to do it. And ask. But not general. It's not a poem, it's not — you know — engineering. Ask specific questions, please.

**[21:36] Dr. Tymoshchuk:** So please think about it, and meantime maybe you could also in this—

---

## Part 4: Ablasse's Questions — PGD Attack & Block Diagram

**[21:47] Ablasse:** I guess — with the — okay, a question I do have is — with the projected gradient descent and putting it into the equation — I assume — you — you want — 'cause I'm supposed to have that in there. This week. And last week. Which — if that's the case, I can't really—

**[22:04] Ablasse:** The block diagram here — where — I'm still streaming. Yeah. The block diagram here doesn't have the — 'cause I'm supposed to have the defense component and I'm supposed to have the attack component in there.

**[22:22] Dr. Tymoshchuk:** Necessary to add, yes, related to these attacks.

**[22:35] Ablasse:** Okay.

**[22:36] Dr. Tymoshchuk:** Or some input, or in some place of this diagram, taking into account this information — in particular from this paper that you—

**[22:53] Ablasse:** Sure.

**[22:54] Dr. Tymoshchuk:** How — taking into account how other people do it.

**[23:13] Dr. Tymoshchuk:** Ablasse, this toy — you can currently put in a bit different place, so it's not still actual.

**[23:27] Dr. Tymoshchuk:** No, it's still not necessary this way. It can be actual later.

**[23:45] Ablasse:** The reason I made this one instead of one that looks — but this is the deployed version. Or, you know, deployed form of this. So I assumed it's essentially the same thing. It's just — this is more relevant, I guess.

**[24:04] Ablasse:** I mean, I could be wrong, but my question is — like, I mean, I think it's a little bit more than—

**[24:10] Jeffrey:** I think he was just saying he rearranged this one.

**[24:14] Dr. Tymoshchuk:** Guys. Diagram is derivative thing. The main are equations. Equations. Diagrams are built exactly on the basis of equations. They should exactly reflect. So the diagram is decoration. Decoration which you can draw, and insert in your report. But the main thing is equations.

**[24:48] Dr. Tymoshchuk:** We should be — which should be described and simulated. Equation is simulated in software — in MATLAB, in C++, in Python.

**[25:11] Dr. Tymoshchuk:** You don't need to find it. No, because — for you — you need to have this MATLAB code which I provided you with. And the problem is — you should translate this code from MATLAB to C++ in your case. That's all.

**[25:35] Dr. Tymoshchuk:** And force it to operate in the same way as in MATLAB environment.

**[25:49] Dr. Tymoshchuk:** Maybe I could connect you with our previous CAHSI student. By the way, he attended my office yesterday. Maybe he could explain — you — in your student wording — to speed up this process, to clarify it.

**[26:10] Ablasse:** Mm.

**[26:11] Dr. Tymoshchuk:** So let's try to use — email address — will both of you — let's try to do it.

**[27:51] Dr. Tymoshchuk:** Please check — both of you — if you received the email address of Joshua. And please contact him with my support, with any related questions. We continue work with him. So we hope he can — we can — devices, recommendations, and so on.

**[28:20] Ablasse:** I have my guy's email.

**[28:26] Dr. Tymoshchuk:** Okay, please continue, Ablasse.

**[28:34] Ablasse:** Because you said it's supposed to reflect — exactly.

**[28:40] Dr. Tymoshchuk:** Could you — your advice — ask specific, concrete questions?

**[28:47] Ablasse:** The specific concrete question being — it says the tracking equation. The tracking neural network. It says the tracking equation. Substituting $U(k)$ in (1) gives the tracking equation. Which is, you know, (10). And then (10) is this, which is what I obviously — I put $\tau$. I didn't — there is no tau. But outside of that, this was what I was describing with the graph. Is that wrong?

**[29:23] Dr. Tymoshchuk:** Ablasse.

**[29:25] Ablasse:** $T$ is $\beta$ in this case.

**[29:30] Dr. Tymoshchuk:** Yeah. Step. Step — the time step. That's all.

**[29:50] Dr. Tymoshchuk:** What is that? This diagonal, in this case — part — simpler case — means tau. Two values of tau, beta. In the even more specific case, these two tau can be the same — can have the same value.

**[30:13] Dr. Tymoshchuk:** Well, these two equations are described in the MATLAB code. You don't need to deal in these equations if you don't understand them. So you need only translate code from MATLAB to C++ — like Joshua did.

**[30:31] Dr. Tymoshchuk:** Contact him, and apparently he can push you using your student wording.

**[30:42] Dr. Tymoshchuk:** Yeah, apparently it's better for undergrad students to start from coding. Firstly from mapping code, repeating, then from modification, for coding, and then after that, it can be better — these equations understood, something like that. And the related diagrams. Begin from practice, apparently it's better.

**[31:13] Dr. Tymoshchuk:** Next specific question, please, Ablasse.

**[31:16] Ablasse:** That was most of my questions, came around that. So I don't have anything.

**[31:24] Ablasse:** I need to restart the meeting though, 'cause it's gonna end in—

**[31:30] Jeffrey:** Yeah, just send me the link again. I'll rejoin.

**[31:33] Ablasse:** Okay.

**[31:33] Dr. Tymoshchuk:** In this case, please — Jeffrey should — the same.

---

*[31:38–44:39] — Meeting break due to Zoom timeout. Session restarted.*

---

## Part 5: Jeffrey's Presentation — MATLAB vs Python Performance Benchmarking

**[44:39] [Unclear]:** Oh.

**[44:48] Jeffrey:** I will share my screen so you can see.

**[44:56] Jeffrey:** Can you see my screen now?

**[44:59] Jeffrey:** So what I did is I was running through multiple iterations in MATLAB, and then plotting the result. And messing around with the learning rate parameter within reason, and — with the higher amount of iterations, you can find an average, and then you can also compare the average run times. And I found that, for some reason, MATLAB is faster than Python. And even the — probably shouldn't be.

**[45:33] Jeffrey:** And what we were just discussing is I'm gonna try to investigate and figure out why that is. And I think it's because of MATLAB's optimization for for-loops compared to Python. Python is not very efficient — it doesn't compile everything down very well for for-loops.

**[45:52] Jeffrey:** But what I was gonna ask you as well is I looked into a library.

**[45:59] Dr. Tymoshchuk:** You can do it later. So it appeared — it requires time to—

**[46:04] Jeffrey:** Yeah. So first step — you want me just to go through — justify — find concrete papers that back up why MATLAB is faster?

**[46:16] Dr. Tymoshchuk:** Mm.

**[46:18] Dr. Tymoshchuk:** But know how fast or not first. So it depends on your preferences. You can try to do first some different things according to this plan before midterm. But this is one of the potential results which you could obtain in the scope of your undergraduate project and show it in the corresponding exposure.

**[46:47] Jeffrey:** I was saying that I did see — it's called Numba, which is — they also work with NumPy. The way that the MATLAB code is done — from the reference — dynamically allocates the matrices in the for-loop. Which also means that MATLAB could also theoretically run faster if it was pre-allocated in the beginning, if it was all initialized. And then if I applied the pre-allocation and used NumPy-like matrices in Python, I think I can achieve at least comparable speed to MATLAB.

**[47:26] Dr. Tymoshchuk:** And this is — yeah, this is one side. This — as you said — running time. But here — could you show one time this graph which is obtained as a result of simulation in MATLAB environment?

**[47:54] Jeffrey:** Well, so this is artificial time. Not real time.

**[47:58] Dr. Tymoshchuk:** Yeah. To obtain real elapsed — we'll call it elapsed time — it's necessary to add here this `tic`/`toc` commands at the beginning of code. `tic` and at the end `toc`, something like that.

**[48:15] Jeffrey:** 20 iterations. I have taken it.

**[48:20] Dr. Tymoshchuk:** Ah yeah, in terms of iterations — yeah, it's correct. This is iteration. Yeah, we cannot see here. But you can, and it's necessary to also obtain the elapsed time using these `tic`/`toc` commands.

**[48:39] Jeffrey:** Down here.

**[48:41] Dr. Tymoshchuk:** Yeah. Can you show here workspace of MATLAB to see this time? Elapsed time.

**[48:53] Jeffrey:** I love MATLAB closing tabs.

**[49:01] Dr. Tymoshchuk:** You should have — workspace — like—

**[49:08] Jeffrey:** There it is.

**[49:10] Jeffrey:** Got it.

**[49:11] Jeffrey:** Yeah, yeah. So for the 20 iterations, this is the average run time. For all 20 — I took the average of that. That's it. 0.3 milliseconds.

**[49:25] Dr. Tymoshchuk:** Okay.

**[49:27] Jeffrey:** For all 20 iterations. I can run it as a single iteration, and I notice that that elapsed time changes.

**[49:35] Dr. Tymoshchuk:** It's not necessary. You mean iterations — you run many times this old code. Yes. So it's sufficient — as I said — sometimes to try it — to see how this $\beta_1$, $\beta_2$ — how this time is changed depending on the increasing/decreasing $\beta_1$, $\beta_2$. And sufficient.

**[50:06] Dr. Tymoshchuk:** Okay. Then this is very delicate thing related to one of the main drawbacks of discrete-time digital systems — related to very small range of change in this speed. If we increase this range, so in this case we lose convergence and correct solution.

**[50:27] Jeffrey:** Compare it to — I have a question. So if I do one iteration — so it still has a thousand time steps, but one iteration of this — the runtime is almost a hundred times slower. It's only 0.03 instead of 0.003. I don't understand why.

**[50:50] Dr. Tymoshchuk:** Three hundredths of second elapsed time. Okay, so it seems correct.

**[51:03] Jeffrey:** That's what I was thinking.

**[51:05] Dr. Tymoshchuk:** Guys, I recommend you — not to use these millions, thousands, one time — run. Find out details why it operates. Then you can repeat second time, and so on. So—

**[51:19] Jeffrey:** Yeah.

**[51:19] Dr. Tymoshchuk:** Next — three — to find out using one run, one iteration.

**[51:28] Jeffrey:** Oh, thank you. I didn't initialize at that time. There's the conversions.

**[51:36] Dr. Tymoshchuk:** Yeah, this three hundredths — apparently it's correct. Elapsed time. Next — clip. Yeah. Call this one — one — why not?

**[51:49] Jeffrey:** So the one run should be slower than the average of multiple?

**[51:56] [Unclear]:** That much slower?

**[51:58] Jeffrey:** I know.

**[52:00] Jeffrey:** Okay, let me rerun it again. One run. I run it. I'm gonna get this graph that has nothing on it because it's only one run. 0.02. Right. And then if I do ten iterations — and then run it the same. We get a graph. And it averages — you can even see it on the graph.

**[52:31] Dr. Tymoshchuk:** Would you launch — Help. Help `numruns`.

**[52:43] Dr. Tymoshchuk:** Help — yeah, `numruns`.

**[52:56] Dr. Tymoshchuk:** Can you write in the same way this number as you use it here in—

**[53:08] Jeffrey:** Ah, it's very — wait a minute. So what do you change here?

**[53:16] Jeffrey:** This — as you said — many runs. So this variable I adjust, and this will — it iterates the entire program that many times. And then I average the runtime across all of them, because I was trying to compare an average runtime compared to the average runtime in Python.

**[53:39] Dr. Tymoshchuk:** Yeah, I see.

**[53:42] Jeffrey:** And I did the same exact approach in Python.

**[53:45] Jeffrey:** If you do one run, I'm assuming it's the initialization — because I'm not clearing all of the memory cache in between every single iteration.

**[53:54] Dr. Tymoshchuk:** So okay, guys — too much words. You change here only number of time steps—

**[54:02] Jeffrey:** No, no, no. It's the number of — it's how many times the program as a whole—

**[54:07] Jeffrey:** Yes, the time steps are still a thousand.

**[54:14] Dr. Tymoshchuk:** Mm-hmm.

**[54:17] Dr. Tymoshchuk:** Okay. So K — where is K used here?

**[54:23] Jeffrey:** Okay. This K — let's see below. This is all normal. So this is everything.

**[54:32] Jeffrey:** No, no — where is this K? The K is down here. Where is it? It's — what — lock — it's — this is an array, or—

**[54:40] Jeffrey:** Not an array, such to mean your C.

**[54:45] Dr. Tymoshchuk:** Oh — it — exactly what it means. This means that this is locked.

---

## Part 6: Dr. Tymoshchuk's Directives for Jeffrey

**[54:51] Dr. Tymoshchuk:** So, Jeffrey. You can spend this toy and play later. I now recommend you — forget, remove it, forget — run one time. Obtain reliable result, describe it, and go ahead.

**[55:06] Dr. Tymoshchuk:** So nice little find-out — these details of these commands and so on — spend time — force — for do you need it. Run one time, describe, and go ahead according to this plan.

**[55:18] Dr. Tymoshchuk:** And later you can play with this — finding out, please — additional. Okay. So: parameters and so on. Run it one time and just compare to Python. One time — for one learning parameter. Second, for increase it, decrease it. And second — that's all. It's clear how it changed. It's sufficient now.

**[55:40] Jeffrey:** Okay. Sounds good.

**[55:57] Jeffrey:** If we were to compare those then — with—

**[56:04] Dr. Tymoshchuk:** Yeah, and the same necessary to do in Python.

**[56:08] Jeffrey:** Yes. Which I did in Python as well.

**[56:12] Dr. Tymoshchuk:** So play the same. The same class. Compare both results — in Python and in MATLAB. And find out reason. Reason. And maybe you could reach better classification — you mean — you could share maybe these results with Joshua.

**[56:38] Jeffrey:** Well, then if we're comparing one iteration, then Python is faster.

**[56:48] Dr. Tymoshchuk:** Statement — your statement may be good, but it's not confirmed. Read — and necessary to find out, confirm, justify, and so on, guys. It's engineering.

**[57:02] Jeffrey:** I can show you here. This is after one iteration — exactly — with this one iteration in MATLAB: 0.006. 0.02. So Python is faster if we're comparing single iterations.

**[57:22] Dr. Tymoshchuk:** It seems to be correct.

**[57:25] Jeffrey:** Yes. This is my screenshot from when I was doing my work in Python, which is on my other computer. So I will make sure I have it on here so I can show you next week.

**[57:34] Jeffrey:** But this is the elapsed time from that one iteration: 0.006. And then this is the elapsed time we just received from one iteration in MATLAB: 0.02.

**[57:47] Dr. Tymoshchuk:** And which is different in speed here?

**[57:53] Jeffrey:** So it's an order of magnitude faster. Almost.

**[58:04] Jeffrey:** Yeah, it's one of the things. And I think this is because when I wrote the Python code, I did it in NumPy with pre-allocated matrices. So it's saving a lot of time for the for-loop.

**[58:16] Dr. Tymoshchuk:** One — or the difference between — so it's Python?

**[58:22] Jeffrey:** Yes, this is Python.

**[58:24] Dr. Tymoshchuk:** So you can inform about it — Joshua.

**[58:26] Jeffrey:** Okay. Okay.

**[58:29] Dr. Tymoshchuk:** And then — so if we're comparing — to a bit — it's fine. So if we're comparing single iteration runs — because — without — exactly — clearly — will find iteration. Then you can go ahead, don't worry about it. Okay. You can make some — actually. Okay. So worry about one iteration first. Find definite.

**[58:56] Jeffrey:** It could also be technically — could be — at what point they start tracking the runtime of the program. Tracking it after memory gets allocated versus who starts tracking it before.

**[59:09] Ablasse:** I did think about that, and I made — I put them in the same spot. So that — like — I set them with the same initialization variables in the same spot. But I will look into that for — like — compiler purposes. That's a good point.

*[Note: Jeffrey said "I did think about that" — the attribution is Jeffrey responding about his own Python code, with Ablasse confirming a good point.]*

**[59:47] Jeffrey:** Yeah. So I have that. And then this is just the graph of it all being the same thing because it proves — they — that is another thing I found interesting when I did do multiple iterations — is that other than this one — I don't know what that's about — but Python—

**[60:00] Dr. Tymoshchuk:** It's clear — necessary to study one, two, three iterations, then we can generalize. But if you launch this a thousand million — so it's spending time, efforts, and so on. Okay.

**[60:18] Jeffrey:** So focus on one iteration, find all the differences, and then starting to do it.

**[60:27] Dr. Tymoshchuk:** It's gonna be sufficient on this step. After that, one can reliably go ahead.

---

## Part 7: Jeffrey's Plan for Next Week

**[60:35] Jeffrey:** And then for next week — in terms of research plan — it is implementation in Python.

**[60:49] Dr. Tymoshchuk:** Compare Python results from MATLAB. And send them — all these results — to this Word draft. Describe.

**[61:01] Jeffrey:** I will edit all of this in here and make this a lot of things.

**[61:05] Dr. Tymoshchuk:** Similarly as in the case of Ablasse. Okay.

**[61:08] Jeffrey:** So I'm just taking this, implementing this in Python and then comparing all the results. Yeah.

**[61:14] Dr. Tymoshchuk:** Okay. Sounds good.

**[61:16] Jeffrey:** And then I will do a lot more comparison and work and track everything related to the learning parameters. Like changing them up and down.

---

## Part 8: Jeffrey's Equation Discussion — Reference = 0

**[61:25] Dr. Tymoshchuk:** Could you show me one time this paper? Describing this equation.

**[61:32] Jeffrey:** Yes. Let me go—

**[62:06] Dr. Tymoshchuk:** We have here — this $R$ equal to zero, yeah. And the derivative of reference — zero.

**[62:19] Jeffrey:** In MATLAB currently I still have it with the same form as what you sent us, which has $R$ with values. So I need to go in and change this all to zero.

**[62:37] Dr. Tymoshchuk:** Wait a moment, please. Could you show these equations in the paper?

**[62:45] Jeffrey:** Ah, it's this — this example from paper. Which is this example from paper.

**[62:55] Dr. Tymoshchuk:** No, no, no — simulations. So — it's apparently this — for which is this? This — the — are these simulations or not?

**[63:06] Jeffrey:** Yes, that is what's produced by MATLAB.

**[63:14] Dr. Tymoshchuk:** Oh yeah. So that's why we have here the sinusoidal signal — sinusoidal. Could you show in this MATLAB — do we have sinusoidal? Sign — oh, sign. So that's why—

**[63:35] Dr. Tymoshchuk:** That's why you have such small range of stable operation. Because of — we have here time-variable — this additional input — sine and cosine. A different variation cost.

**[63:51] Dr. Tymoshchuk:** Yeah, but if you change this step a bit — you can have — you can lose this convergence and things like that.

**[64:00] Dr. Tymoshchuk:** And since this is optimal control — this just always be zero.

**[64:06] Jeffrey:** Yes.

**[64:08] Dr. Tymoshchuk:** Please. So it could be next step. You can make this reference equal to zero, and it's — this first-order difference equal to zero, and then you can reach more wide range of change in this learning rate parameters and have stable operation. So on next step — you can try to play with it.

**[64:40] Dr. Tymoshchuk:** Okay. For this purpose — please make a copy of this code, and you can modify, change, and play. And you can see — and better understand. This — beginning from these codes — these equations — and so then—

**[65:00] Jeffrey:** Then I would set also like these initial conditions to zero for reference as well?

**[65:04] Dr. Tymoshchuk:** Yeah — be careful to change initial conditions. You can change, but firstly only one — and see which results. Otherwise — take into account my experience — if we try to change many things, so we can lose understanding. It's kind of clear, and so on. So then — careful — change step by step.

**[65:30] Jeffrey:** In order for me to achieve optimal control, though, my reference needs to be zero. Yeah.

**[65:35] Dr. Tymoshchuk:** Okay, so I will go through and slowly change it all. Okay.

**[65:48] Jeffrey:** That answers my questions for this week, and I will just modify the references and everything to make them zero and then work with the learning parameter.

**[66:00] Dr. Tymoshchuk:** Like — very one at a time, right?

**[66:05] Jeffrey:** Okay. Yeah, I can do that. And then I will do the same thing in Python and compare all results.

**[66:09] Dr. Tymoshchuk:** Yeah, change — and you can already describe it. Fix note — to not forget — because of the — even for in the case of experience recession.

---

## Part 9: Attack Simulation Guidance for Ablasse

**[66:40] Dr. Tymoshchuk:** And similar things should be done by Ablasse — set also very similar. The only difference is that Ablasse — as for you, it's necessary to find out how we can add this — simulate — intrusions. These attacks.

**[67:11] Dr. Tymoshchuk:** So — as I understood, you did not find out — yet — if you say neural network — so neural network. Necessary to find out if — because for instance I've seen already in the past, in literature, that people try to simulate these intrusions using random data, random signals — time-constant, time-permanent, time-variable. Random signals with borrowed theory, deepened statistical lease—

**[67:51] Dr. Tymoshchuk:** But you don't need it. You need only trying to simulate this — random or not random — using some, on the level of high-school functions. Piecewise linear, piecewise constant, in the case of time-variable this additional input, something like that. Begin from simple things — it seems to lend—

**[68:30] Dr. Tymoshchuk:** Using high-school functions or random numbers. They are available in C, in Python, in MATLAB. And it can be sufficient — sufficient for the scope of this CAHSI undergraduate project.

**[68:51] Ablasse:** This type of attack is also—

**[68:58] Dr. Tymoshchuk:** Yeah. Yeah.

**[69:06] Dr. Tymoshchuk:** Yeah, try to simplify it — to have it on the level of, at maximum, random numbers, or even using high-school piecewise linear or nonlinear function, something like that.

**[69:28] Dr. Tymoshchuk:** So it apparently can be necessary to install some threshold — if such intrusion — simulation of intrusion — increase. This result — so we can switch off them, something like that, or—

**[69:47] Ablasse:** Mm-hmm.

**[69:48] Dr. Tymoshchuk:** Yeah. Make transfer to autonomous — autonomous mode of simulation. I mean: switch off this additional input. Otherwise — we can have this additional input. They're only necessary to find out where we can add this additional input.

**[70:13] Dr. Tymoshchuk:** To control, to state variable, to — as additional, for instance — additive noise to state variable, or to control variable. Noise — additive noise is simpler. Multiplicative is terrible. At least in the case of noise.

**[70:38] Dr. Tymoshchuk:** Or high-school function — add to control, or to state variable, or to some other place. So simplify it.

**[70:51] Dr. Tymoshchuk:** Try to add in the simulations — to see. Like Jeffrey tried to change this learning rate parameter and study how convergence changes. Like in this case — in your case — you can add some additional values to simulations and see how this convergence and correct operation is — in essence — convergence.

**[71:27] Dr. Tymoshchuk:** To correct steady states. In the Jeffrey case — convergence to zero. In your case — after this — zero in this — and in the — okay — to some constant value, for instance, equal to this reference. Very similar problems.

**[71:47] Dr. Tymoshchuk:** In the Jeffrey case: zero. In the Ablasse case: some constant value, for instance — convergence state where it should.

**[71:58] Dr. Tymoshchuk:** And don't go — according to my experience — don't go trying to go to complex things. Do it on a high-school level and trying to understand. Maybe generalization can be next step. No, it's not necessary.

---

## Part 10: Scheduling & Wrap-up

**[72:27] Ablasse:** That being — I'm going to be on a plane on the twenty-eighth.

**[72:35] Dr. Tymoshchuk:** Yeah.

**[72:37] Dr. Tymoshchuk:** Problem — please adjust it. So we have — you mean — in this time you cannot join us?

**[72:52] Ablasse:** No.

**[72:56] Dr. Tymoshchuk:** Okay, in this case, you should have double results after two weeks. Yeah.

**[73:02] Dr. Tymoshchuk:** And any related questions you can contact us — share with us — using email messages — but specific. Not related to, you know, these poems and so on, but specific engineering, simple contact questions. Contact us by email messages, and you can obtain the immediate response — is awarded — so no problem.

**[73:35] Dr. Tymoshchuk:** Okay, any other questions, comments, suggestions?

**[73:43] Dr. Tymoshchuk:** Thank you. Have a nice day and weekend. Thank you for visit — and — how we can call this mode — for connection — something — like — you have an idea.

**[73:59] [All]:** Thank you.
