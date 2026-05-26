---
name: humanizer
version: 2.5.1
description: Remove signs of AI-generated writing from text. Use when editing or reviewing text to make it sound more natural and human-written. Detects and fixes patterns including inflated symbolism, promotional language, superficial -ing analyses, vague attributions, em dash overuse, rule of three, AI vocabulary words, passive voice, negative parallelisms, and filler phrases.
license: MIT
compatibility: claude-code opencode
---

# Humanizer: remove AI writing patterns

When given text to humanize:

1. Identify AI patterns.
2. Rewrite problematic sections.
3. Preserve meaning.
4. Maintain the intended tone.
5. Add personality where appropriate.
6. Do a final anti-AI pass: ask what still sounds obviously AI generated, then revise again.

## Voice calibration

If the user provides a writing sample, analyze sentence length, vocabulary, paragraph starts, punctuation habits, recurring phrases, transitions, and tone. Match those patterns in the rewrite. If no sample is provided, write with a natural, varied, specific voice.

## Patterns to remove

- Significance inflation: "serves as", "testament", "pivotal", "underscores", "broader landscape", "lasting legacy".
- Notability padding: vague claims about coverage, social presence, or importance without concrete sources.
- Superficial -ing endings: "highlighting", "ensuring", "reflecting", "showcasing", "contributing to".
- Promotional language: "boasts", "vibrant", "rich", "renowned", "breathtaking", "must-visit", "stunning".
- Vague attribution: "experts argue", "industry reports", "observers have cited", "some critics say".
- Formulaic challenges sections: generic "despite challenges" and "future outlook" paragraphs.
- Overused AI words: additionally, align, crucial, delve, enduring, enhance, foster, garner, highlight, intricate, key, landscape, pivotal, showcase, tapestry, testament, underscore, valuable, vibrant.
- Copula avoidance: replace "serves as", "stands as", "features", "boasts", and "represents" with simpler "is", "are", or "has" when clearer.
- Negative parallelisms: avoid "not only...but also" and "it's not just X, it's Y" unless the contrast truly matters.
- Rule of three: do not force lists into threes.
- Synonym cycling: repeat the clearest noun instead of rotating through synonyms.
- False ranges: avoid "from X to Y" when X and Y are not a meaningful scale.
- Passive voice and subjectless fragments: name the actor when it improves clarity.
- Em dash overuse: prefer commas, periods, parentheses, or shorter sentences.
- Boldface overuse: remove mechanical bold labels and inline-header lists.
- Title Case headings: use sentence case unless style requires otherwise.
- Emojis and decorative markers: remove unless the user's voice uses them.
- Curly quotes: use straight quotes unless a publication style guide requires otherwise.
- Chatbot artifacts: remove "Great question", "Of course", "I hope this helps", "let me know", and similar assistant residue.
- Knowledge-cutoff disclaimers: replace with sourced facts or remove.
- Sycophantic tone: respond directly without excessive praise.
- Filler phrases: replace "in order to" with "to", "due to the fact that" with "because", "at this point in time" with "now".
- Excessive hedging: remove stacked qualifiers like "could potentially possibly".
- Generic positive conclusions: end with concrete facts or a sharp final thought.
- Common hyphen pairs: avoid over-hyphenating ordinary phrases.
- Persuasive authority tropes: remove "the real question is", "at its core", "what really matters", "fundamentally".
- Signposting: remove "let's dive in", "let's explore", "here's what you need to know".
- Fragmented headers: do not add a filler sentence that merely restates the heading.

## Output

Provide:

1. Draft rewrite.
2. A brief "what still sounds AI generated" audit.
3. Final rewrite.
4. A short summary of changes if useful.

Source: https://github.com/blader/humanizer
