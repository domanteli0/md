
#align(center, text(18pt)[
  == *Laboratorinis darbas \#1*
])

#align(center, text(15pt)[
  Domantas Keturakis \
  #text(13pt)[
    Spalis 2024
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

// #show heading: it => [
//   #set align(center)
//   #set text(12pt, weight: "regular")
//   #block(smallcaps(it.body))
// ]

= Užduotis \#1

// == Sprendimas

$
  y(e^x + 1) d x - e^x d y &= 0 \
  
  y(e^x + 1) d x &= e^x d y \
  
  (e^x + 1)/(e^x) d x &=  1/y d y ,#h(1em) y != 0 \

  // switch
  1/y d y &= (e^x + 1)/(e^x) d x \

  integral 1/y d y &= integral ( 1 + e^(-x) ) \dx \
  
  ln|y| &= x - e^(-x) + C \

  y &= e^(x - e^(-x) + C) \ 
  
  y &= C_e e^(x-e^(-x)) ,#h(1em) C_e = ±e^C \ 

$

$
  y = 0 : 0 eq.triple 0 - #text[tapatybė, todėl ]
  y = 0 - #text[ atskiras sprendinys]
$

`SymPy` pateiktas sprendimas:

$
  y(x) = (C_1 e^(x - e^(-x)))
$

Ativaizdu, kad čia tie patys sprendimai.

#pagebreak()
= Užduotis \#2

$ 
  eq.triple \

  x y′ &= 2y + x^2/y \
  
  y′ &= 2y/x + x/(y) \
  
  y′ &= 2y/x + (y/x)^(-1) \

  u′x + u &= 2u + u^(-1) && [ u &= y/x, #h(1em) u' = u'x + u ] \
  
  (d u)/(d x) x &= u + u^(-1) = (u^2 + u)/u \
  
  u/(u^2 + u) d u &= 1/x d x \
  
  1/(u + 1) d u &= 1/x d x \
  
  ln|u + 1| &= ln|x| + C \
  
  u + 1 &= C_e x \
  
  y &= C_e x^2 - x
$

#pagebreak()
= Užduotis \#3

$
  x^2 y′ + x y + 1 &= 0, y(2) = 1 \
  
  x^2 y′ + x y &= -1 \

  y' + y/x &= - 1/x^2 \
$

Naudojame konstantų variavimo metodą:

$
  y' + y/x &= 0 \

  (d y)/(d x) &= - y/x \
  
  integral 1/y \dy &= - integral 1/x \dx ,&& #h(1em) y != 0 \

  ln |y| &= -ln|x| + C \

  y &= C 1/x, #h(1em) C in RR && #h(1em) ±e^C -> C \

  y' &= C'/x - C/x^2 \

  // y = 0 : #h(1em) y' + y/x &= 0 => 0 eq.triple 0 => && C in RR
$

BLah blah blah:
$
  x^2 y′ + x y + 1 = 0 => x^2(C'/x - C/x^2) + x C/x + 1 &= 0 \

  C'x - C + C + 1 &= 0 \

  C'x &= -1 \

  C' &= - 1/x, #h(1em) x != 0 \

  C &= -ln|x| + C_1
$

$
  y = C/x => y &= (-ln|x| + C_1)/x, #h(1em) \
$

$
  y(2) = 1 => (-ln|2| + C_1)/2 &= 1 \
  
  C_1 - ln|2| &= 2 \
  
  C_1 &= 2 + ln|2| \

  "Ats.:" #h(1em) y = (-ln|x| + ln|2| + 2)/x
$