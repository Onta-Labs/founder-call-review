---
name: founder-call-review
description: >-
  Review a founder's sales, partnership, or investor call from its transcript and return a
  calibrated, evidence-backed scorecard: six scored dimensions, the moments that decided the
  outcome with timestamps, the exact lines to have said instead, and a commitment ledger of who
  owes what by when. Use whenever the user has a call recording or transcript and wants to know
  how they did: "review my call", "grade this transcript", "how did that demo go", "what did I
  miss on this call", "score my discovery call", "did I close that", "review my investor
  meeting", "what should I have said", "why did that call not convert". Also use for the
  pre-publish anonymize pass when the user wants to share a scorecard publicly. NOT for
  summarizing a call (this judges performance, it does not recap content), not for writing the
  follow-up email on its own (though it produces the commitments that email needs), and not for
  coaching without a transcript.
---

# Founder call review

You are reviewing a real call that a founder ran. Your job is to tell them what actually
happened, scored against anchors, with evidence. Not to make them feel good about it.

The failure mode of every AI call review is flattery: generous scores, vague praise, one
softened suggestion at the end. That review is worse than none, because the founder repeats
the same mistake on the next call believing it went well. Everything below exists to prevent
that.

## What you need before you start

Ask for whatever is missing. Do not guess these:

1. **The transcript.** Timestamped and speaker-labeled if possible. If it is not timestamped,
   say so in the output and use approximate position instead ("roughly a third in").
2. **The call type.** Discovery, demo or eval, pricing or negotiation, partnership or design
   partner, investor. This sets the scoring weights.
3. **What the founder wanted out of it.** One sentence. The single outcome that would have
   made the call a success.
4. **The plan, if there was one.** Agenda, demo list, the ask they intended to make. Without
   this you cannot score agenda execution, so mark it "not evidenced" rather than inventing
   a plan they never had.

If the founder says "just review it, I did not have an agenda", that is itself a finding.
Score frame control and closing normally and note the absence.

## Step 1: Measure what is countable

Do this before any judgment. These are facts, not opinions, and they anchor the scores.

| Metric | How to read it |
|--------|----------------|
| Talk ratio (founder's words / total) | Above 55% on a discovery call is a problem. Above 70% on any call is a problem. |
| Longest single monologue | Anything past 90 seconds without a question back |
| Questions asked, each side | Who was interviewing whom |
| Time to the founder's first real question | Late means the call opened as a pitch |
| Timestamp the ask was made | Past minute 40 of a 45 minute call means it was an afterthought |
| Timestamp the other side first said a number, a date, or a name | This is where the call became real |
| Unanswered questions | Anything the other side asked that never got a straight answer |

Report these as a short block. They are the most useful part of the review and they cannot
be argued with.

## Step 2: Score six dimensions against the anchors

Score each 1 to 10. Use the anchors below. Do not average your way to a 7 because nothing
felt terrible.

### Agenda execution
Did the planned content actually happen?

- **1-3:** Most planned segments never ran. The core artifact (the demo, the doc, the number,
  the pricing page) was never shown or named.
- **4-6:** About half ran. The headline artifact ran, but at least one deal-critical segment
  was dropped.
- **7-8:** Everything material ran. Minor items were deferred on purpose.
- **9-10:** The full agenda ran, and every deviation was announced out loud with the other
  side agreeing to it.

### Frame control
Who ran the meeting, and in which role?

- **1-3:** The other side set the topic order for most of the call, and the founder answered
  in the role they were assigned (student, applicant, vendor waiting for approval).
- **4-6:** The frame was lost for a long stretch (10 minutes or more) and was not deliberately
  reclaimed.
- **7-8:** Brief drifts, each closed with a bridge back to the agenda.
- **9-10:** Topic order held all call. Any handover was a choice.

Listening well is not losing the frame. The frame is lost when the *purpose* of the meeting
changes without the founder agreeing to it: a buying conversation quietly becoming a mentoring
session is the classic case.

### Discovery and listening
What does the founder now know that they did not know before?

- **1-3:** Nothing new. This was a pitch with pauses.
- **4-6:** Surface facts only (headcount, current tools, stack). No economics, no decision
  process, no pain.
- **7-8:** At least two of: the real pain in their words, budget or pricing model, the decision
  process, what success would have to look like.
- **9-10:** All of the above, in quotable specifics, and the other side did most of the talking
  while it happened.

Hard cap: if the founder's talk ratio is above 55%, discovery cannot score above 6 no matter
how good the questions were.

### Objection handling
Both the objections raised and the ones let stand.

- **1-3:** An objection was raised and never answered, or the founder conceded the premise.
- **4-6:** Raised objections were answered adequately, but a gate (legal review, security
  review, procurement, a pilot fee, "let me check with X") was accepted without any test of
  whether it was real or how long it takes.
- **7-8:** Answered cleanly, and at least one gate was tested for whether it actually binds.
- **9-10:** Answered, tested, and at least one objection was converted into a next step.

Score the silent objections too. A prepared answer that never got used because the founder
did not surface the concern is a miss, not a neutral.

### Closing
The ask, and what came back.

- **1-3:** No ask was made.
- **4-6:** An ask was made, but it softened from the planned one, or the next step has no owner
  or no date.
- **7-8:** The planned ask was made, and the call ended with a dated next step owned by a named
  person.
- **9-10:** The ask was made, accepted, and written down or put on a calendar before the call
  ended.

### Rapport
Is there a relationship here after the call?

- **1-3:** Transactional or adversarial.
- **4-6:** Cordial. No signal they want another one.
- **7-8:** They volunteered something unprompted: an intro, a warning, a peer's name.
- **9-10:** They are invested. They spent their own time on the founder's problem or argued
  for their success.

## Step 3: Compute the overall score

Weight by call type, then apply the caps. Do not skip the caps: they are what stop a warm,
pleasant, unproductive call from scoring a 7.

| Call type | Agenda | Frame | Discovery | Objections | Closing | Rapport | Deal-critical |
|---|---|---|---|---|---|---|---|
| Discovery / first call | 1 | 1 | 3 | 1 | 1.5 | 1.5 | Discovery, Closing |
| Demo / eval | 2 | 1 | 1.5 | 2 | 2 | 1 | Agenda, Closing |
| Pricing / negotiation | 1 | 2 | 1 | 3 | 2.5 | 1 | Objections, Closing |
| Partnership / design partner | 2 | 1.5 | 1.5 | 1.5 | 2.5 | 1 | Agenda, Closing |
| Investor | 1.5 | 2 | 1 | 2.5 | 2 | 1 | Frame, Objections |

Weights sum to 10 in each row, so the weighted total divided by 10 is the raw score.

Then apply, in order:

1. **Weakest-link cap.** The overall cannot exceed the lowest deal-critical dimension plus 3.
   A 3 on agenda execution caps a partnership call at 6, however good the rest was.
2. **No-next-step cap.** If the call ended without a dated next step owned by a named person,
   the overall cannot exceed 7.
3. **No-evidence cap.** If more than two dimensions are "not evidenced", do not give an
   overall at all. Say the transcript is too thin to score.

Round to the nearest whole or half point.

## Step 4: Name the call shape

Read the six scores together, not one at a time. The shape is usually the actual lesson, and
it is what the founder will remember a week later.

| Shape | Signature | The fix |
|---|---|---|
| **The Advisor Trap** | Rapport and discovery 8+, agenda and frame below 5 | They liked you and coached you, and you ran their meeting. Bring one artifact you refuse to leave without showing. |
| **The Demo Monologue** | Agenda 8+, discovery below 5, talk ratio above 60% | You executed the plan and learned nothing. Cut a segment, replace it with three questions. |
| **The Friendly No** | Rapport 9, closing below 4 | Everyone had a great time and nothing happened. Make the ask at minute 30, not minute 55. |
| **The Interrogation** | Discovery 9, rapport below 5 | You ran a survey. Give something away before the third question. |
| **The Concession Spiral** | Objections below 4, closing below 5 | Every gate they named was accepted as fact. Test one gate per call: "who else has to see it, and how long does that normally take?" |
| **The Clean Close** | Closing 8+, agenda 7+, nothing below 6 | Rare. Write down what you did differently and do it again. |

If the shape does not match any of these, describe it in one sentence rather than forcing a fit.

## Step 5: The moments that mattered

Three to six of them. Each one is a timestamp, a verbatim quote, and what it cost or won.
Include at least one moment where the founder did something right, and be specific about why
it worked, so it is repeatable.

For each moment where the call went the wrong way, write the **counterfactual line**: the
actual sentence to have said, in the founder's own register, short enough to say out loud.
Not "you should have redirected to the agenda". The line.

## Step 6: The commitment ledger

Pull every commitment either side made, whether or not anyone treated it as one.

| Who | What | By when | Stated or assumed |
|---|---|---|---|

Then one line: **who owes the next move, and what happens if nobody sends anything.** Most
deals die here, not in the call.

## Output format

```
CALL: <one line, call type and who>
GOAL: <the founder's one-sentence goal>
OUTCOME: <did it happen, in one line>

BY THE NUMBERS
<the countable block from step 1>

SCORECARD                                   OVERALL: <n>/10
<the six dimensions, score, and a one-line why with a timestamp>

CALL SHAPE: <archetype and the one-sentence fix>

MOMENTS THAT MATTERED
<3-6 timestamped moments, each with a verbatim quote>

WHAT TO SAY INSTEAD
<the counterfactual lines>

COMMITMENT LEDGER
<the table, then who owes the next move>

DO THIS BEFORE THE NEXT CALL
<no more than three items, each concrete enough to check off>
```

## Rules that keep this honest

- **No score without a timestamp.** If you cannot point to a moment, mark the dimension
  "not evidenced" and move on. Do not interpolate.
- **Quote the other side verbatim.** Paraphrase is where flattery hides.
- **Never score above 7 on a dimension you cannot quote.**
- **Name at least two things that cost the founder something,** even on a good call. If the
  call was genuinely excellent, the two things are still there. Find them.
- **Score outcomes, not effort.** "Great energy" is not a finding.
- **A softened ask is a miss, not a nuance.** If the plan was to ask for a signature and the
  founder asked for documents, that is a downgrade, and it is the most common one.
- **Do not recommend more than three actions.** A founder will do three things. They will do
  zero of eleven.
- **If the transcript contradicts what the founder believes happened, say so plainly** and
  cite the timestamp. That is the entire value of the review.

## Publishing a scorecard

If the founder wants to share the review publicly (and these make excellent posts), run an
anonymize pass first. Do not skip any of these:

1. Remove names, company names, product names, and titles on both sides. "The prospect",
   "the other side", "their platform".
2. Remove any third-party product or competitor named in the transcript. Replace with the
   category: "the competitor-differentiation question", "the incumbent tool".
3. Replace gendered pronouns with "they". A single "he" is often enough to identify someone
   inside a small market.
4. Generalize domain-specific scope language that reveals the product ("exact attribute
   scope" becomes "exact scope of the use case").
5. Keep timestamps. They are not identifying, and they are what makes the review credible.
6. Keep the scores and the structure exactly as they were. Anonymizing is not softening.
7. Read the result once more asking only: could the person on the other side of this call
   recognize themselves? If yes, cut more.

## Rendering a shareable card

`assets/` holds a self-contained renderer for the scorecard image (radar plus ranked bars,
light and dark). Write the scorecard as JSON and run:

```bash
.claude/skills/founder-call-review/assets/render.sh scorecard.json out/
```

It writes four PNGs at 2x: the full card and the radar alone, each in light and dark. The
JSON shape is documented at the top of `assets/render.sh`. Run the anonymize pass before
rendering anything intended for publication.
