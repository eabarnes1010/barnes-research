---
layout: page
title: news
permalink: /news/
nav: true
nav_order: 6
---

<!-- prettier-ignore-start -->

{% assign news_by_year = site.news | group_by_exp: "item", "item.date | date: '%Y'" | sort: "name" | reverse %}

<div class="news news-archive">
  {% if site.news != blank %}
    {% for group in news_by_year %}
      <h2 class="news-year">{{ group.name }}</h2>
      <table class="table table-sm table-borderless">
        {% assign items = group.items | sort: "date" | reverse %}
        {% for item in items %}
          <tr>
            <th scope="row" style="width: 20%">{{ item.date | date: '%b %d, %Y' }}</th>
            <td>
              {% if item.inline %}
                {{ item.content | remove: '<p>' | remove: '</p>' | emojify }}
              {% else %}
                <a class="news-title" href="{{ item.url | relative_url }}">{{ item.title }}</a>
              {% endif %}
            </td>
          </tr>
        {% endfor %}
      </table>
    {% endfor %}
  {% else %}
    <p>No news so far...</p>
  {% endif %}
</div>
<!-- prettier-ignore-end -->
