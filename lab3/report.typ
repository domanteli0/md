#set figure(
  supplement: [Fig.]
)

#show raw.where(block: true): it => box(
  fill: rgb("f0f0f0"),
  outset: 3pt,
  radius: 2pt,
  width: 100%,
  it
)

#align(center, text(18pt)[
  == *Laboratorinis darbas \#1*
])

#align(center, text(15pt)[
  Domantas Keturakis \
  #text(13pt)[
    Lapkritis 2024
  ]
  ]
 )

#show heading.where(depth: 1): it => [
  #set text(17pt)
  #block(smallcaps(it.body))
]

#show heading.where(depth: 2): it => [
  #set text(15pt)
  #it.body
]

Užudotis:
$x''(t) + 4x(t) = 4sin(4t) - 2 cos t, x(0) = 0, x'(0) = 1
$

#image("Screenshot 2024-10-13 at 23.08.42.png")

TODO: 
- [ ] Analiziškai ir naudodami kompiuterinę programę išspręskite Ko2i uodavini,
- [ ] palyginkite sprendinius, nubreokite sprendinio grafiką.
- [ ] Ištirkite sprendini, kai t → +∞.
- [ ] Nurodykite svyravimu periodį ir amplitudę.


