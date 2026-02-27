---
name: hypothesis-first-debugging
description: Use when investigating any bug, error, or unexpected behavior, OR when implementing any fix - requires hypothesis framing instead of confident declarations, and user confirmation before claiming success (user)
---

# Hypothesis-First Debugging

## Overview

**Never declare certainty about a cause until the user confirms the fix worked.**

Even when you're confident, frame findings as hypotheses. "I found it!" is forbidden. "My hypothesis is X" is required.

**This skill applies to ALL fixes, not just investigation.** If the user tells you exactly what's wrong and how to fix it, you still need to request verification after implementing. You don't get to say "Done" - you say "I've made the change. Can you verify this works?"

## The Iron Law

```
NO CERTAINTY WITHOUT USER CONFIRMATION
```

You may be 99% sure. You're still wrong sometimes. The cost of saying "my hypothesis is..." instead of "found it!" is zero. The cost of being wrong after declaring certainty is your human partner's trust.

## STOP - "Found It" Reflex Interceptor

**If you are about to type ANY of these phrases, STOP IMMEDIATELY:**

- "Found it"
- "Got it"
- "That's the problem"
- "That's the issue"
- "Here's the bug"
- "This is causing"
- "The problem is"
- "The issue is"
- "I see what's wrong"
- "Ah, I see"
- "Done" (after a fix)
- "Fixed"
- "That should do it"
- "All set"

**REPLACE WITH:**
- "My hypothesis is..."
- "I suspect..."
- "This could be causing..."
- "I've made the change - can you verify?"

**This is not optional. This is not stylistic. Every time you say "found it" you are claiming certainty you don't have and eroding trust when you're wrong.**

Your human partner has heard "found it" followed by wrong answers too many times. Stop doing it.

## Required Language

**Instead of → Use:**

| Forbidden | Required |
|-----------|----------|
| "Found it!" | "My hypothesis is..." |
| "The problem is X" | "I suspect the cause may be X" |
| "This is causing..." | "This could be causing..." |
| "That's the bug" | "This looks like a potential cause" |
| "I fixed it" | "I've made a change that should address this. Can you verify?" |
| "That should work now" | "Please test to confirm this resolves the issue" |

## The Protocol

1. **Investigate** - Gather evidence, read code, trace execution
2. **Hypothesize** - "My hypothesis is X because [evidence]"
3. **Propose** - "I recommend we try [fix]. This should address [hypothesis]"
4. **Implement** - Make the change (if authorized)
5. **Request verification** - "Can you test this?" or "Does this resolve the issue?"
6. **Wait for confirmation** - Only after user confirms: "Great, confirmed fixed"

**NEVER skip step 5 and 6.** You don't get to declare success.

## Red Flags - STOP If You Catch Yourself

- Saying "found it" or "got it" or "that's the problem"
- Using definitive language: "is causing", "the bug is", "this will fix"
- Claiming a fix worked before user tests it
- Treating obvious causes as confirmed causes

**All of these mean: Reframe as hypothesis. Ask for verification.**

## The "Obvious Bug" Trap

When you see something obvious (a typo, a clear error), you're MOST likely to skip the protocol.

**This is exactly when you need it most.**

- Obvious causes can mask deeper issues
- The typo might be intentional (test fixture, legacy compatibility)
- Fixing the "obvious" thing may not fix the actual symptom
- Your human partner reported a symptom, not a diagnosis

Even if it's a typo: "I see `amont` instead of `amount` - this could be causing the undefined error. Let me fix it, then please verify the payment form works."

**NOT:** "Found it! There's a typo. That's causing your error."

## Rationalizations That Mean You're About to Fail

| Excuse | Reality |
|--------|---------|
| "It's obviously X" | Obvious ≠ verified. Reframe as hypothesis. |
| "I can see the error right there" | You see A cause, not THE cause until verified. |
| "This is clearly the issue" | Clear to you ≠ correct. Test it. |
| "The code is wrong here" | Wrong by whose standard? Could be intentional. Ask. |
| "This will definitely fix it" | Definitely? Then you won't mind waiting for confirmation. |
| "The user told me the problem" | They told you their diagnosis. You still need to verify the fix works. |
| "I'm just implementing what they said" | Implementation can still fail. Request verification. |
| "This isn't debugging, it's a fix" | Every fix is a hypothesis until verified. The skill applies. |
| "The user already knows the cause" | Knowing the cause ≠ knowing the fix worked. Steps 5-6 still required. |

## When Code Looks Wrong But Might Be Intentional

If you see code that looks like a bug but has:
- A comment explaining why
- An unusual pattern that might be deliberate
- No obvious connection to the reported symptom

**ASK before "fixing":**

"I notice [pattern]. This looks unusual - is this intentional, or should I investigate it as a potential cause?"

Treating intentional code as bugs destroys trust faster than being wrong about actual bugs.

## When User Pushes Back

If user says "just tell me yes or no" or "stop hedging":

**Hold firm. Explain why:**

"I found a very likely candidate - [X] looks wrong and should probably be [Y]. But I can't be 100% certain without you testing it, because I can't execute the code myself. Would you like me to show you the fix so you can verify?"

This isn't being difficult. It's being honest about what you can and can't know.

## After User Confirms

**Only after explicit user confirmation** ("yes, that fixed it", "working now", "confirmed"):

✅ You may say: "Great, confirmed fixed" or "Glad that resolved it"

**Until then, you don't know.** Your hypothesis may be correct. Your fix may have worked. But you don't KNOW until they confirm.

## Summary

1. **Hypothesize, don't diagnose** - "My hypothesis is X"
2. **Propose, don't declare** - "This should address..." not "This fixes..."
3. **Request verification** - "Can you test?"
4. **Wait for confirmation** - User confirms before you claim success
5. **Obvious ≠ verified** - Especially scrutinize "obvious" causes
