---
layout: page
title: academic lineage
permalink: /group/lineage/
nav: false
description:
---

<!-- Academic lineage schematic — Barnes Research Group -->
<div class="lineage-root">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;0,6..72,600;1,6..72,400;1,6..72,500&family=IBM+Plex+Mono:wght@400;500;600&display=swap');

  .lineage-root{
    --ink:#15202e; --body:#3c4655; --muted:#737e8b; --line:#e4e7ec;
    --paper:#f6f7f9; --card:#ffffff;
    --serif:'Newsreader',Georgia,serif;
    --mono:'IBM Plex Mono',ui-monospace,Menlo,monospace;
    color:var(--body); background:
      radial-gradient(120% 60% at 12% 0%, #fdeef2 0%, rgba(253,238,242,0) 55%),
      var(--paper);
    font-family:var(--serif); line-height:1.5;
    padding:64px clamp(20px,5vw,72px) 80px; box-sizing:border-box;
    -webkit-font-smoothing:antialiased;
  }
  .lineage-root *{box-sizing:border-box;}

  /* ---------- header ---------- */
  .head{max-width:760px;margin:0 0 56px;}
  .head .eyebrow{font-family:var(--mono);font-size:11.5px;letter-spacing:.22em;
    text-transform:uppercase;color:var(--muted);margin:0 0 34px;}
  .head h1{font-family:var(--serif);font-weight:500;color:var(--ink);
    font-size:clamp(34px,5.4vw,56px);line-height:1.04;letter-spacing:-.01em;margin:0;}
  .head h1 em{font-style:italic;font-weight:400;
    background:linear-gradient(95deg,#e8608c,#cc0000 55%,#7a0f2a);
    -webkit-background-clip:text;background-clip:text;color:transparent;}
  .head p{font-size:clamp(15px,2vw,18px);color:var(--body);max-width:60ch;
    margin:20px 0 0;}
  .head .span{font-family:var(--mono);font-size:12px;letter-spacing:.04em;
    color:var(--muted);margin-top:18px;display:flex;gap:10px;align-items:center;flex-wrap:wrap;}
  .head .span b{color:var(--ink);font-weight:600;}
  .head .span .bar{flex:1;min-width:60px;height:2px;border-radius:2px;
    background:linear-gradient(90deg,#7a0f2a,#cc0000,#e8608c);opacity:.7;}
  .head .span .cont{flex:0 0 56px;height:2px;border-radius:2px 0 0 2px;
    background:linear-gradient(90deg,#e8608c,rgba(232,96,140,0));opacity:.8;}

  /* top fan (current group members) */
  .grouptop{position:absolute;left:0;top:0;right:0;z-index:1;}
  .fan-svg{position:absolute;left:0;top:0;overflow:visible;display:block;
    opacity:0;animation:fanin 0.9s ease .15s forwards;}
  @keyframes fanin{to{opacity:1;}}
  .fan-label{position:absolute;left:204px;top:78px;transform:translateY(-50%);}
  .fan-eye{font-family:var(--mono);font-size:11px;letter-spacing:.15em;text-transform:uppercase;color:#cc0000;}
  .fan-sub{font-family:var(--serif);font-style:italic;font-size:13.5px;line-height:1.5;color:#7e8893;margin-top:5px;}

  /* ---------- lineage (desktop absolute) ---------- */
  .lineage{position:relative;max-width:880px;height:3006px;margin-top:8px;}
  .spine{position:absolute;left:0;top:0;z-index:1;overflow:visible;}
  .flowpath{stroke-dasharray:2400;stroke-dashoffset:0;animation:draw 2.8s cubic-bezier(.65,0,.35,1) .9s backwards;}
  @keyframes draw{from{stroke-dashoffset:2400;}to{stroke-dashoffset:0;}}
  .flowtail{opacity:0;animation:fadein 1.4s ease 3.4s forwards;}
  @keyframes fadein{to{opacity:1;}}

  .portrait-wrap{position:absolute;left:0;top:0;width:150px;
    transform:translateY(-50%);z-index:3;display:flex;justify-content:center;}
  .portrait{width:120px;height:120px;border-radius:50%;overflow:hidden;
    background:#fff;box-shadow:0 0 0 4px #fff,0 0 0 5.5px var(--ring),
      0 10px 26px -10px rgba(20,32,46,.45);}
  .portrait img{width:100%;height:100%;object-fit:cover;display:block;
    filter:saturate(.96);}
  .portrait.ph{display:flex;flex-direction:column;align-items:center;justify-content:center;
    gap:4px;background:repeating-linear-gradient(135deg,#fbfcfd 0 7px,#f1f4f7 7px 14px);
    border:1.5px dashed var(--ring);box-shadow:0 0 0 4px #fff,0 10px 26px -12px rgba(20,32,46,.35);}
  .ph-ic{font-family:var(--mono);font-size:26px;line-height:1;color:var(--ring);font-weight:500;}
  .ph-tx{font-family:var(--mono);font-size:9.5px;letter-spacing:.12em;text-transform:uppercase;
    text-align:center;color:var(--muted);}

  .node{position:absolute;left:0;right:0;}
  .card{position:absolute;left:204px;top:0;right:0;transform:translateY(-50%);
    z-index:2;padding:20px 26px;background:var(--card);
    border:1px solid var(--line);border-radius:14px;
    box-shadow:0 1px 2px rgba(20,32,46,.05),0 16px 34px -20px rgba(20,32,46,.30);}
  .rel{font-family:var(--mono);font-size:10.5px;font-weight:500;letter-spacing:.16em;
    text-transform:uppercase;color:var(--ring);margin:0 0 7px;}
  .name{font-family:var(--serif);font-weight:600;color:var(--ink);
    font-size:clamp(20px,2.4vw,25px);line-height:1.12;letter-spacing:-.005em;margin:0;}
  .meta{font-family:var(--mono);font-size:12px;color:var(--muted);margin:7px 0 0;
    display:flex;align-items:center;gap:8px;flex-wrap:wrap;}
  .meta .yr{color:var(--ink);font-weight:500;}
  .meta .dot{opacity:.5;}
  .blurb{font-family:var(--serif);font-style:italic;font-size:15px;line-height:1.5;
    color:var(--body);margin:11px 0 0;max-width:54ch;}

  /* deep-roots band */
  .deepband{position:absolute;left:204px;right:0;transform:translateY(-50%);z-index:2;}
  .deep-eyebrow{font-family:var(--mono);font-size:10.5px;letter-spacing:.2em;text-transform:uppercase;color:#8a93a0;
    padding-bottom:9px;border-bottom:1px solid var(--line);margin-bottom:11px;}
  .deep-sub{font-family:var(--serif);font-style:italic;font-size:13.5px;line-height:1.55;color:#8a93a0;max-width:50ch;}

  /* tail nodes (no portraits — fading dots) */
  .tail-node{position:absolute;left:0;right:0;opacity:var(--op);}
  .tail-wrap{position:absolute;left:0;top:0;width:150px;transform:translateY(-50%);z-index:3;display:flex;justify-content:center;}
  .tail-dot{width:11px;height:11px;border-radius:50%;background:var(--paper);border:2px solid var(--ring);
    box-shadow:0 0 0 4px var(--paper);}
  .tail-dot.diamond{width:13px;height:13px;border-radius:2px;transform:rotate(45deg);background:var(--ring);
    box-shadow:0 0 0 4px var(--paper),0 6px 16px -6px rgba(122,15,42,.5);}
  .tcard{position:absolute;left:204px;top:0;right:0;transform:translateY(-50%);z-index:2;}
  .trel{font-family:var(--mono);font-size:9.5px;font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:#9aa2ae;margin:0 0 4px;}
  .term-rel{color:#9c4f5e;letter-spacing:.1em;}
  .tname{font-family:var(--serif);font-weight:500;color:#2f3947;font-size:16.5px;line-height:1.2;margin:0;}
  .term .tname{font-weight:600;color:var(--ink);font-size:18px;}
  .tmeta{font-family:var(--mono);font-size:11px;color:#9aa2ae;margin:4px 0 0;display:flex;align-items:center;gap:7px;flex-wrap:wrap;}
  .tmeta .tyr{color:#9c4f5e;font-weight:500;} .tmeta .dot{opacity:.5;}

  .wisp{position:absolute;left:204px;transform:translateY(-50%);font-family:var(--mono);font-size:10.5px;
    letter-spacing:.08em;color:#b7bdc6;font-style:normal;z-index:2;}

  /* tighten footer note */
  .lin-foot{max-width:880px;margin:44px 0 0;padding-top:20px;border-top:1px solid var(--line);
    font-family:var(--mono);font-size:11px;letter-spacing:.03em;color:var(--muted);line-height:1.7;}
  .lin-foot a{color:#cc0000;text-decoration:none;border-bottom:1px solid #f3cdd8;}

  /* ---------- mobile / narrow: stacked flow, straight gradient rail ---------- */
  @media (max-width:760px){
    .lineage-root{padding:44px 20px 56px;}
    .lineage{height:auto;position:relative;max-width:560px;}
    .lineage::before{content:"";position:absolute;left:31px;top:128px;bottom:120px;width:3px;
      border-radius:3px;background:linear-gradient(#e8608c,#cc0000 38%,#7a0f2a 70%,rgba(58,8,20,0));z-index:0;}
    .spine{display:none;}
    .node{position:relative;left:auto;right:auto;display:grid;
      grid-template-columns:64px 1fr;column-gap:16px;align-items:start;
      padding:0 0 30px;}
    .node[style]{top:auto !important;}
    .portrait-wrap{position:relative;top:auto !important;transform:none;width:64px;z-index:2;
      padding-top:2px;}
    .portrait{width:56px;height:56px;box-shadow:0 0 0 3px var(--paper),0 0 0 4.5px var(--ring),
      0 6px 14px -8px rgba(20,32,46,.5);}
    .portrait.ph{box-shadow:0 0 0 3px var(--paper);}
    .ph-ic{font-size:18px;} .ph-tx{font-size:7px;}
    .card{position:relative;left:auto;right:auto;top:auto;transform:none;padding:14px 16px;}
    .name{font-size:19px;} .blurb{font-size:14px;margin-top:8px;}
    .head{margin-bottom:38px;}
    .grouptop{position:relative;left:auto;right:auto;top:auto;display:grid;grid-template-columns:64px 1fr;column-gap:16px;align-items:center;padding:0 0 24px;z-index:2;}
    .fan-svg{position:relative;left:auto;top:auto;width:64px;height:auto;}
    .fan-label{position:relative;left:auto;top:auto;transform:none;}

    .deepband{position:relative;left:auto;right:auto;top:auto !important;transform:none;margin:6px 0 22px;padding-left:80px;}
    .tail-node{position:relative;left:auto;right:auto;top:auto !important;display:grid;grid-template-columns:64px 1fr;column-gap:16px;align-items:start;padding:0 0 20px;}
    .tail-wrap{position:relative;top:auto !important;transform:none;width:64px;z-index:2;padding-top:3px;justify-content:center;}
    .tcard{position:relative;left:auto;right:auto;top:auto;transform:none;}
    .wisp{position:relative;left:auto;top:auto !important;transform:none;padding-left:80px;}
  }
  @media (prefers-reduced-motion:reduce){
    .flowpath{animation:none;stroke-dashoffset:0;}
    .flowtail{animation:none;opacity:1;}
    .fan-svg{animation:none;opacity:1;}
  }
</style>

<header class="head">
  <p class="eyebrow">Barnes Research Group</p>
  <h1>Academic <em>Lineage</em></h1>
  <p>Eight generations of academic lineage dating back to 19th-century physiology and physics &mdash; with a less certain doctoral trail running four centuries further back, to Renaissance Padua.</p>
  <div class="span"><b>1559</b><span class="bar"></span><b>2012</b><span class="cont" aria-hidden="true"></span></div>
</header>

<div class="lineage">
  <div class="grouptop"><svg class="fan-svg" viewBox="0 0 150 186" width="150" height="186" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <defs><linearGradient id="flowfan" x1="0" y1="15" x2="0" y2="184" gradientUnits="userSpaceOnUse">
    <stop offset="0" stop-color="#e8608c" stop-opacity="0"/><stop offset="1" stop-color="#e8608c" stop-opacity="0.85"/>
  </linearGradient></defs>
  <path d="M 75 184 C 75 130, 17 98, 17 42" stroke="url(#flowfan)" stroke-width="2.2" stroke-linecap="round" stroke-dasharray="2 7" fill="none"/><path d="M 75 184 C 75 130, 46 80, 46 24" stroke="url(#flowfan)" stroke-width="2.2" stroke-linecap="round" stroke-dasharray="2 7" fill="none"/><path d="M 75 184 C 75 130, 75 71, 75 15" stroke="url(#flowfan)" stroke-width="2.2" stroke-linecap="round" stroke-dasharray="2 7" fill="none"/><path d="M 75 184 C 75 130, 104 80, 104 24" stroke="url(#flowfan)" stroke-width="2.2" stroke-linecap="round" stroke-dasharray="2 7" fill="none"/><path d="M 75 184 C 75 130, 133 98, 133 42" stroke="url(#flowfan)" stroke-width="2.2" stroke-linecap="round" stroke-dasharray="2 7" fill="none"/><circle cx="17" cy="42" r="3.4" fill="var(--paper)" stroke="#e8608c" stroke-opacity="0.55" stroke-width="1.8"/><circle cx="46" cy="24" r="3.4" fill="var(--paper)" stroke="#e8608c" stroke-opacity="0.55" stroke-width="1.8"/><circle cx="75" cy="15" r="3.4" fill="var(--paper)" stroke="#e8608c" stroke-opacity="0.55" stroke-width="1.8"/><circle cx="104" cy="24" r="3.4" fill="var(--paper)" stroke="#e8608c" stroke-opacity="0.55" stroke-width="1.8"/><circle cx="133" cy="42" r="3.4" fill="var(--paper)" stroke="#e8608c" stroke-opacity="0.55" stroke-width="1.8"/>
</svg><div class="fan-label"><div class="fan-eye">The Barnes Research Group</div><div class="fan-sub">current and past members</div></div></div>
  <svg class="spine" width="150" height="3006" viewBox="0 0 150 3006" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <defs>
    <linearGradient id="flow" x1="0" y1="150" x2="0" y2="1842" gradientUnits="userSpaceOnUse">
      <stop offset="0" stop-color="#e8608c"/>
      <stop offset="0.45" stop-color="#cc0000"/>
      <stop offset="1" stop-color="#7a0f2a"/>
    </linearGradient>
    <linearGradient id="flowtail" x1="0" y1="1842" x2="0" y2="2910" gradientUnits="userSpaceOnUse">
      <stop offset="0" stop-color="#7a0f2a" stop-opacity="0.95"/>
      <stop offset="0.7" stop-color="#3a0814" stop-opacity="0.55"/>
      <stop offset="1" stop-color="#3a0814" stop-opacity="0"/>
    </linearGradient>
  </defs>
  <path d="M 75 1842 C 91 1893, 91 1941, 75 1992 C 59 2054.67, 59 2117.33, 75 2180 C 91 2208, 91 2236, 75 2264 C 59 2292, 59 2320, 75 2348 C 91 2376, 91 2404, 75 2432 C 59 2460, 59 2488, 75 2516 C 91 2544, 91 2572, 75 2600 C 59 2628, 59 2656, 75 2684 C 91 2712, 91 2740, 75 2768 C 59 2796, 59 2824, 75 2852 C 91 2871.33, 91 2890.67, 75 2910" stroke="url(#flowtail)" stroke-width="2.7" stroke-linecap="round"
        stroke-dasharray="2 8" class="flowtail"/>
  <path d="M 75 242 C 115 310, 115 374, 75 442 C 35 510, 35 574, 75 642 C 115 710, 115 774, 75 842 C 35 910, 35 974, 75 1042 C 115 1110, 115 1174, 75 1242 C 35 1310, 35 1374, 75 1442 C 115 1510, 115 1574, 75 1642 C 35 1710, 35 1774, 75 1842" stroke="url(#flow)" stroke-width="3.5" stroke-linecap="round"
        class="flowpath"/>
</svg>
  <div class="node" style="top:242px" data-i="0"><div class="portrait-wrap"><div class="portrait" style="--ring:#e8608c"><img src="{{ '/assets/img/people/prof_pic.jpg' | relative_url }}" alt="Elizabeth A. Barnes" loading="lazy"></div></div><div class="card" style="--ring:#e8608c">
        <div class="rel">Depth 1x</div>
        <h3 class="name">Elizabeth A. Barnes</h3>
        <div class="meta"><span class="inst">University of Washington</span><span class="dot">&middot;</span><span class="yr">2012</span></div>
        <p class="blurb">Atmospheric scientist developing interpretable machine learning for climate variability, prediction, and the Earth system.</p>
      </div></div>
<div class="node" style="top:442px" data-i="1"><div class="portrait-wrap"><div class="portrait" style="--ring:#e14869"><img src="{{ '/assets/img/lineage/hartmann.jpg' | relative_url }}" alt="Dennis L. Hartmann" loading="lazy"></div></div><div class="card" style="--ring:#e14869">
        <div class="rel">Depth 2x</div>
        <h3 class="name">Dennis L. Hartmann</h3>
        <div class="meta"><span class="inst">Princeton University</span><span class="dot">&middot;</span><span class="yr">1975</span></div>
        <p class="blurb">Atmospheric scientist known for work on climate dynamics, radiative feedbacks, and atmospheric circulation.</p>
      </div></div>
<div class="node" style="top:642px" data-i="2"><div class="portrait-wrap"><div class="portrait" style="--ring:#da3046"><img src="{{ '/assets/img/lineage/oort.jpg' | relative_url }}" alt="Abraham H. Oort" loading="lazy"></div></div><div class="card" style="--ring:#da3046">
        <div class="rel">Depth 3x</div>
        <h3 class="name">Abraham H. Oort</h3>
        <div class="meta"><span class="inst">University of Utrecht</span><span class="dot">&middot;</span><span class="yr">1964</span></div>
        <p class="blurb">Dutch–American meteorologist known for foundational observational studies of the global atmospheric circulation and the physics of climate.</p>
      </div></div>
<div class="node" style="top:842px" data-i="3"><div class="portrait-wrap"><div class="portrait" style="--ring:#d31823"><img src="{{ '/assets/img/lineage/starr.jpg' | relative_url }}" alt="Victor P. Starr" loading="lazy"></div></div><div class="card" style="--ring:#d31823">
        <div class="rel">Depth 4x</div>
        <h3 class="name">Victor P. Starr</h3>
        <div class="meta"><span class="inst">University of Chicago</span><span class="dot">&middot;</span><span class="yr">1946</span></div>
        <p class="blurb">American meteorologist known for theories of the general circulation and the transport of atmospheric angular momentum and energy.</p>
      </div></div>
<div class="node" style="top:1042px" data-i="4"><div class="portrait-wrap"><div class="portrait" style="--ring:#cc0000"><img src="{{ '/assets/img/lineage/rossby.jpg' | relative_url }}" alt="Carl-Gustaf Rossby" loading="lazy"></div></div><div class="card" style="--ring:#cc0000">
        <div class="rel">Depth 5x</div>
        <h3 class="name">Carl-Gustaf Rossby</h3>
        <div class="meta"><span class="inst">University of Stockholm</span><span class="dot">&middot;</span><span class="yr">1925</span></div>
        <p class="blurb">Swedish–American meteorologist who explained atmospheric motion through fluid mechanics; the Rossby number bears his name.</p>
      </div></div>
<div class="node" style="top:1242px" data-i="5"><div class="portrait-wrap"><div class="portrait" style="--ring:#b7040b"><img src="{{ '/assets/img/lineage/bjerknes.jpg' | relative_url }}" alt="Vilhelm Bjerknes" loading="lazy"></div></div><div class="card" style="--ring:#b7040b">
        <div class="rel">Depth 6x</div>
        <h3 class="name">Vilhelm Bjerknes</h3>
        <div class="meta"><span class="inst">Karlsruhe Institute of Technology</span><span class="dot">&middot;</span><span class="yr">1890</span></div>
        <p class="blurb">Norwegian physicist and meteorologist who united fluid mechanics and thermodynamics into the primitive equations behind modern forecasting.</p>
      </div></div>
<div class="node" style="top:1442px" data-i="6"><div class="portrait-wrap"><div class="portrait" style="--ring:#a30815"><img src="{{ '/assets/img/lineage/hertz.jpg' | relative_url }}" alt="Heinrich Rudolph Hertz" loading="lazy"></div></div><div class="card" style="--ring:#a30815">
        <div class="rel">Depth 7x</div>
        <h3 class="name">Heinrich Rudolph Hertz</h3>
        <div class="meta"><span class="inst">Humboldt University of Berlin</span><span class="dot">&middot;</span><span class="yr">1880</span></div>
        <p class="blurb">German physicist who, building on Maxwell’s theory, experimentally proved the existence of electromagnetic waves; the unit of frequency bears his name.</p>
      </div></div>
<div class="node" style="top:1642px" data-i="7"><div class="portrait-wrap"><div class="portrait" style="--ring:#8e0b20"><img src="{{ '/assets/img/lineage/helmholtz.jpg' | relative_url }}" alt="Hermann von Helmholtz" loading="lazy"></div></div><div class="card" style="--ring:#8e0b20">
        <div class="rel">Depth 8x</div>
        <h3 class="name">Hermann von Helmholtz</h3>
        <div class="meta"><span class="inst">University of Berlin</span><span class="dot">&middot;</span><span class="yr">1842</span></div>
        <p class="blurb">German physician and physicist known for the optics of vision and color, the conservation of energy, electrodynamics, and thermodynamics.</p>
      </div></div>
<div class="node" style="top:1842px" data-i="8"><div class="portrait-wrap"><div class="portrait" style="--ring:#7a0f2a"><img src="{{ '/assets/img/lineage/muller.jpg' | relative_url }}" alt="Johannes Peter Müller" loading="lazy"></div></div><div class="card" style="--ring:#7a0f2a">
        <div class="rel">Depth 9x</div>
        <h3 class="name">Johannes Peter Müller</h3>
        <div class="meta"><span class="inst">University of Bonn</span><span class="dot">&middot;</span><span class="yr">1822</span></div>
        <p class="blurb">German physiologist, ichthyologist, and herpetologist, celebrated for his discoveries and his gift for synthesizing knowledge.</p>
      </div></div>
  <div class="deepband" style="top:2048px"><div class="deep-eyebrow">Further back &middot; Mathematics Genealogy Project</div><div class="deep-sub">Müller&rsquo;s line runs on past the well-attested record — through 18th-century Tübingen and Halle medicine, into 17th-century Jena, and back to the anatomists of Renaissance Padua. Edges below are reconstructed and contested.</div></div>
  <div class="tail-node" style="top:2180px;--op:0.92"><div class="tail-wrap"><span class="tail-dot" style="--ring:#6e0d24"></span></div><div class="tcard"><div class="trel">9×</div><div class="tname">August F. J. K. Mayer</div><div class="tmeta"><span class="tinst">University of Tübingen</span></div></div></div>
<div class="tail-node" style="top:2264px;--op:0.87"><div class="tail-wrap"><span class="tail-dot" style="--ring:#660c22"></span></div><div class="tcard"><div class="trel">10×</div><div class="tname">Wilhelm Gottfried Ploucquet</div><div class="tmeta"><span class="tinst">University of Tübingen</span></div></div></div>
<div class="tail-node" style="top:2348px;--op:0.82"><div class="tail-wrap"><span class="tail-dot" style="--ring:#5e0b1f"></span></div><div class="tcard"><div class="trel">11×</div><div class="tname">Ferdinand Christoph Oetinger</div><div class="tmeta"><span class="tinst">University of Halle</span><span class="dot">&middot;</span><span class="tyr">1739</span></div></div></div>
<div class="tail-node" style="top:2432px;--op:0.77"><div class="tail-wrap"><span class="tail-dot" style="--ring:#550a1d"></span></div><div class="tcard"><div class="trel">12×</div><div class="tname">Michael Alberti</div><div class="tmeta"><span class="tinst">University of Halle</span></div></div></div>
<div class="tail-node" style="top:2516px;--op:0.72"><div class="tail-wrap"><span class="tail-dot" style="--ring:#4d091b"></span></div><div class="tcard"><div class="trel">13×</div><div class="tname">Friedrich Hoffmann</div><div class="tmeta"><span class="tinst">University of Jena</span></div></div></div>
<div class="tail-node" style="top:2600px;--op:0.67"><div class="tail-wrap"><span class="tail-dot" style="--ring:#450819"></span></div><div class="tcard"><div class="trel">14×</div><div class="tname">Augustin Heinrich Fasch</div><div class="tmeta"><span class="tinst">University of Jena</span><span class="dot">&middot;</span><span class="tyr">1663</span></div></div></div>
<div class="tail-node" style="top:2684px;--op:0.62"><div class="tail-wrap"><span class="tail-dot" style="--ring:#3c0716"></span></div><div class="tcard"><div class="trel">15×</div><div class="tname">Werner Rolfinck</div><div class="tmeta"><span class="tinst">University of Jena</span><span class="dot">&middot;</span><span class="tyr">1625</span></div></div></div>
<div class="tail-node" style="top:2768px;--op:0.57"><div class="tail-wrap"><span class="tail-dot" style="--ring:#340714"></span></div><div class="tcard"><div class="trel">16×</div><div class="tname">Adriaan van den Spieghel</div><div class="tmeta"><span class="tinst">University of Padua</span><span class="dot">&middot;</span><span class="tyr">1603</span></div></div></div>
<div class="tail-node term" style="top:2852px;--op:0.96"><div class="tail-wrap"><span class="tail-dot diamond" style="--ring:#2c0612"></span></div><div class="tcard"><div class="trel term-rel">16× great-grandfather &middot; the trail&rsquo;s deepest firm node</div><div class="tname">Hieronymus Fabricius ab Aquapendente</div><div class="tmeta"><span class="tinst">University of Padua</span><span class="dot">&middot;</span><span class="tyr">1559</span></div></div></div>
  <div class="wisp" style="top:2910px">&hellip; and earlier; the record thins</div>
</div>

<p class="lin-foot">
  Doctoral lineage &mdash; each scientist advised the one above; years denote PhD completion.
  Below Müller, edges follow the
  <a href="https://www.mathgenealogy.org/" target="_blank" rel="noopener">Mathematics Genealogy Project</a>;
  pre-1800 links are reconstructed from dissertation and disputation records and are contested.
</p>
</div>
