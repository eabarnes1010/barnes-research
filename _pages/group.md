---
layout: page
title: group
permalink: /group/
nav: true
nav_order: 3
description: Members of the Barnes Research Group.
---

{% comment %} Members are defined in _data/members.yml — one YAML block per person. {% endcomment %}

{% include figure.liquid loading="eager" path="assets/img/people/group_photo_SP26.jpg" class="img-fluid rounded z-depth-1" title="The Barnes Research Group" %}

<style>
  .group-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(150px, 1fr)); gap: 1.5rem; margin-top: 1rem; }
  .member { text-align: center; }
  .member .avatar, .member .initials {
    width: 110px; height: 110px; border-radius: 50%; margin: 0 auto 0.5rem;
    object-fit: cover; display: flex; align-items: center; justify-content: center;
  }
  .member .initials { background: var(--global-bg-color, #eee); border: 1px solid var(--global-divider-color, #ddd);
    font-size: 2rem; font-weight: 600; color: var(--global-text-color, #555); }
  .member .name { font-weight: 600; line-height: 1.2; }
  .member .role { font-size: 0.85rem; color: var(--global-text-color-light, #828282); }
  .member .links a { margin: 0 4px; font-size: 0.9rem; }
  .member.alum { font-size: 0.9rem; }
</style>

{% assign cohorts = "current,former" | split: "," %}
{% for cohort in cohorts %}
  {% assign people = site.data.members[cohort] %}
  {% if people and people.size > 0 %}

## {% if cohort == "current" %}Current members{% else %}Former members{% endif %}

<div class="group-grid">
{% for m in people %}
  <div class="member {% if cohort == 'former' %}alum{% endif %}">
    {% if m.image %}
      <img class="avatar" src="{{ '/assets/img/' | append: m.image | relative_url }}" alt="{{ m.name }}">
    {% else %}
      {% assign parts = m.name | remove: "(" | remove: ")" | split: " " %}
      {% assign ini = parts.first | slice: 0 | append: parts.last | slice: 0 | upcase %}
      <div class="initials">{{ ini }}</div>
    {% endif %}
    <div class="name">{{ m.name }}</div>
    <div class="role">{{ m.role }}{% if m.affiliation %} · {{ m.affiliation }}{% endif %}{% if m.years %}<br>{{ m.years }}{% endif %}</div>
    <div class="links">
      {% if m.email %}<a href="mailto:{{ m.email }}" title="Email"><i class="fa-solid fa-envelope"></i></a>{% endif %}
      {% if m.website %}<a href="{{ m.website }}" target="_blank" rel="noopener" title="Website"><i class="fa-solid fa-link"></i></a>{% endif %}
    </div>
  </div>
{% endfor %}
</div>

  {% endif %}
{% endfor %}

<p class="mt-4"><em>Interested in joining? See the <a href="/contact/">contact</a> page.</em></p>
