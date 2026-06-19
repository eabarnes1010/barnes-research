# TODO

## For Claude

- [x] for prof barnes, have an "expand" or something that extends the full bio (found on the current website). Also, show all honors too (but could have an "expand" button)
- [x] remove "and X more authors" if they are group members. I want to show all group member authors. none should be hidden
- [x] Underline correct group member authors
- [x] link correctly to whiteboard animations as was done on current website — all 8 videos embedded on /scicomm/ (responsive grid) + channel link.
- [x] homepage should show ONLY "5 newest publications" — `--max 5` (replaced selected). NB: takes first 5 entries in papers.bib; keep file newest-first.
- [x] widen header width, the words are too close together
- [x] for publications, the year should be for published papers in that year, so need a "Submitted/Preprint" indicator for papers that have not yet been published.
- [x] pubs column is too narrow (too much scrolling), widen.
- [x] submitted/preprint badge should be gray (the red pops out too much)

- [x] "show all honors and awards" is too close to the next title below and should be indented with the bullets above.
- [x] submitted/preprint button should be aligned for all pubs. I would say with lighter gray background, under the red abbr (and smaller width than the red abbr)
- [x] let's discuss ways to make the front page boxes less generic (i like it, but got feedback it looked too generic)
- [x] submitted preprint should be thin black text with no button.
- [x] the gray years on the publications page (e.g. 2026) can barely be seen. make it darker
- [x] the search icon should not have the hot key on it. just the icon
- [x] news should be separated by year (like publications) — /news/ grouped by year; home shows 3 most recent
- [x] update footer to remove "Powered by Jekyll with al-folio theme. Hosted by GitHub Pages."
- [x] the footer should not be dark. it stands out too much.
- [x] find a good way to include assets/img/ai-earth-drawing.png — full-width white card under the hero, above the feature cards
- [x] scrape images for current group members off current website
- [x] fix link to my bio picture for the "group" page since i changed the name and broke the link
- [x] the expanded honors and awards should have their bullets align with the bullets above
- [x] fix publication card on home page
- [x] add linked in to Find me online: www.linkedin.com/in/elizabeth-barnes-2a40b6280
- [x] dark mode doesn't look right for the home page (the fading banner is really bright and i cannot see the text. the banner needs to change to a darker color)
- [x] news items on the home page should be closer together vertically (too spread out right now)
- [x] the publications tab in the header should be moved left. it should be to the right of the "research" tab
- [x] on the courses page, the course numbers and titles should be bold and red.
- [x] remove news on the front page entirely
- [x] for pubs "Pushing the Frontiers in Climate Modeling and Analysis with Machine Learning" doesn't hide the final authors under "X more authors". Why? — BY DESIGN: max_author_limit=3, but the "never hide a group member" rule shows ALL authors when any hidden author is current/former group; here Barnes (4th author) + Marie McGraw are past the cutoff, so all show.
- [x] there is a space between the final author and the period for each paper. is this intentional? — NO, bug: whitespace leaked from the more-authors/annotation blocks; fixed with liquid whitespace control.

## For Libby to do

- [ ] update research page
- [x] decide how the publication page should look (too many lines, take away red?)
- [x] add full bio for Libby
- [x] update homepage since way too much scrolling
