# founder-call-review

An agent skill that reviews a founder's sales, partnership, or investor call from the
transcript and returns a calibrated scorecard instead of encouragement.

<img src="docs/sample-scorecard-dark.png#gh-dark-mode-only" alt="Sample scorecard: six dimensions scored, radar of the call shape, overall 5 out of 10">
<img src="docs/sample-scorecard-light.png#gh-light-mode-only" alt="Sample scorecard: six dimensions scored, radar of the call shape, overall 5 out of 10">

<sub>Sample output. Every score, quote, and timestamp above is fabricated.</sub>

## Why

Ask a model how your last call went and it will tell you that you did great. It hands out 8s,
praises your energy, and offers one gentle suggestion at the end.

That review is worse than no review, because you walk into the next call believing the last
one went well.

So this one is built to be hard to flatter with.

## What it gives you

- **Six dimensions scored against written anchors.** Agenda execution, frame control,
  discovery and listening, objection handling, closing, rapport. Anchors, not vibes, so a 4
  means the same thing on every call instead of meaning whatever the model felt that day.
- **The countable things first**, before any judgment: talk ratio, longest monologue, questions
  asked by each side, and the exact minute your ask landed. Facts nobody can argue with.
- **Weighted by call type, then capped.** A weakest-link cap stops a warm, pleasant,
  unproductive call from scoring a 7. If the call ended with no dated next step owned by a
  named person, it cannot score above 7 at all.
- **The call shape.** Six scores read together usually name the real lesson. High rapport, high
  discovery, low agenda, low frame is the Advisor Trap: they liked you, they coached you, and
  you spent the hour in their meeting instead of yours. Six shapes are built in.
- **Counterfactual lines.** Not "you should have redirected to the agenda." The literal
  sentence to have said, short enough to say out loud under pressure.
- **A commitment ledger**, and one line on who owes the next move. Most deals die there, not on
  the call.
- **An anonymize pass** for when you want to publish a scorecard, plus a renderer that turns
  one into the cards above.

## Install

Claude Code, Claude Desktop, or anything that reads the agent-skill format:

```bash
git clone https://github.com/Onta-Labs/founder-call-review.git ~/.claude/skills/founder-call-review
```

Or drop the folder into `.claude/skills/` inside a project. Then say "review my call" and
paste the transcript.

If your agent does not support skills, `SKILL.md` works fine as a plain prompt. Paste it, then
paste the transcript.

## Render a shareable card

```bash
assets/render.sh my-scorecard.json out/
```

Writes four PNGs at 2x: the full card and the radar alone, each in light and dark. See
`assets/example-scorecard.json` for the shape and `assets/render.sh` for the field docs. Needs
Chrome (set `CHROME=` if it is not in the default macOS location) and Python 3.

**Run the anonymize pass in `SKILL.md` before you render anything you intend to post.** The
person on the other end of that call did not agree to be graded in public.

## The scoring, in short

Weighted mean of the six dimensions by call type, then:

1. The overall cannot exceed the lowest deal-critical dimension plus 3.
2. No dated, owned next step caps the overall at 7.
3. More than two dimensions with no evidence means no overall score at all.

And the rule that does the most work: **no score without a timestamp.** If it cannot quote the
moment, it has to write "not evidenced" instead of guessing.

Full weight table and the 1-to-10 anchors are in [SKILL.md](SKILL.md).

## Make it yours

The six dimensions are a starting point, not gospel. If you sell in a way where, say,
multi-threading or technical proof matters more than rapport, edit the anchor table in
`SKILL.md` and change the weights. That is the whole point of shipping it as a text file.

## Who made this

Built at [Onta Labs](https://github.com/Onta-Labs) out of our own founder-led sales calls. Our
actual product is context graphs for AI agents ([onta-oss](https://github.com/Onta-Labs/onta-oss)),
so this is not what we sell. It is a tool we wanted, and it is more useful in your hands than
sitting in our repo.

MIT. Fork it, change it, no attribution needed.
