---
layout: page
title: Science of AI
description: How do AI models learn from Earth system data? How can we make them more interpretable?
img: # add an image in assets/img/ and reference it here for a thumbnail
importance: 1
category: research
---

{% include figure.liquid loading="eager" path="assets/img/science_of_ai.png" class="img-fluid rounded z-depth-1" alt="Science of AI research figure" %}

<p class="caption" style="color: var(--global-text-color-light);">Figure caption — result + source</p>

Here the model is the object of study. We ask how networks trained on Earth system data actually learn: what they pick up first, what they ignore, how confident they are, and where they break. Understanding the model is a prerequisite for trusting it — and for knowing when a good score is hiding a shortcut.

In practice:

- Training dynamics — what a network learns over the course of training, treated as evidence in its own right
- Separating what a model doesn't know (epistemic) from what is genuinely unknowable (aleatoric), and letting it abstain when it should
- Probing emulator behavior: stability over long rollouts, out-of-distribution drift, and what latent representations encode
