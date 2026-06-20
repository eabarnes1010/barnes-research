---
layout: page
title: Emulators Beyond Forecasting
description: Treating fast, differentiable emulators as laboratories for the likelihood of rare events and uncovering hidden physics
img: assets/img/research/rewind_sandy.png # add an image in assets/img/ and reference it here for a thumbnail
importance: 1
category: research
---

<div style="display: flex; gap: 0.75rem; flex-wrap: wrap; justify-content: center; align-items: flex-start;">
  <div style="flex: 1 1 200px;">
    {% include figure.liquid loading="eager" path="assets/img/research/rewind_1.gif" class="img-fluid rounded z-depth-1" avoid_scaling=true alt="Rewound climate trajectory 1" %}
  </div>
  <div style="flex: 1 1 200px;">
    {% include figure.liquid loading="eager" path="assets/img/research/rewind_2.gif" class="img-fluid rounded z-depth-1" avoid_scaling=true alt="Rewound climate trajectory 2" %}
  </div>
  <div style="flex: 1 1 200px;">
    {% include figure.liquid loading="eager" path="assets/img/research/rewind_3.gif" class="img-fluid rounded z-depth-1" avoid_scaling=true alt="Rewound climate trajectory 3" %}
  </div>
</div>

<p class="caption" style="color: var(--global-text-color-light);">Using cbottle-video we steer the trajectories of tropical cyclones in AI emulators to simulate a range of possibilities for use in planning and scenario design. Figure by Dr. Jerry Lin.</p>

A fast emulator is more than a forecast machine. Because it runs cheaply and can be differentiated, it lets us run experiments that conventional models are too slow or too rigid to allow. We use emulators as instruments: to ask what-if, to estimate how often rare events should occur, and to interrogate what a model has actually learned.

Some examples include:

- Rewinding weather trajectories to run the system backwards
- Estimating the likelihood of rare and unprecedented events from large emulator ensembles
- Reinforcement learning as a diagnostic — using an emulator as an environment to uncover what a model knows and where it breaks
