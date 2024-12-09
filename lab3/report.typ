#import "@preview/mitex:0.2.4": *
#import "@preview/codly:1.0.0"

#show: codly.codly-init.with()

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
  == *Laboratorinis darbas \#3*
])

#align(center, text(15pt)[
  Domantas Keturakis \
  #text(13pt)[
    Gruodis 2024
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

#show heading.where(depth: 1): it => [
  #set text(17pt)
  #block(smallcaps(it.body))
]

#show heading.where(depth: 2): it => [
  #set text(15pt)
  #it.body
]

= Užduotis

Išspręsti Koši uždavinį: $x''(t) + 4x(t) = 4sin(4t) - 2 cos t, #h(1em) x(0) = 0, #h(1em) x'(0) = 1$

== Analitiškas sprendimas

Pateikta antros eilės tiesinė nehomogeninė diferencialinė lygtis ir pradinės sąlygos:

$
  x(0)&=0,\
  x'(0)&=1
$

Visų pirmą randamas homogeninės dalies sprendinys, naudojant charakteringajį polinomą:
$
x''(t) + 4x(t) &= 0,\
lambda^2 + 4 &= 0,\
lambda &= plus.minus 2i
$

Charakteringojo polinomo šaknis yra kompleksinis skaičius, bendrasis sprendinys turės tokią formą:
$
x_h = C_1 cos(2t) + C_2 sin(2t)
$

Nehomogeninės dalies sprendinį ($x_a$) galima rasti naudojant neapibrėžtųjų koeficientų medotą. Kadangi abu dešinios pusės nariai atitinka galimas formas galima pritaikyti sumos taisyklę:

$
  x_a &= A sin(4t) + B cos(4t) + C sin(t) + D cos(t)\
  x'_a &= 4A cos(4t) - 4B sin(4t) + C cos(t) - D sin(t) \
  x''_a &= -16A sin(4t) - 16B cos(4t) - C sin(t) - D cos(t)
$

Įstračius i̧ pradinę lygtį:
$
  -&16A sin(4t) - 16B cos(4t) - C sin(t) - D cos(t)\
  &+4A sin(4t) + 4B cos(4t) + 4C sin(t) + 4D cos(t)\
  = -&12A sin(4t) - 12B cos(4t) + 3C sin(t) + 3D cos(t) = 4sin(4t) - 2 cos t\
$

Gaunama lygčių sistema:

$
  cases(
    -12A &= 4,
    -12B &= 0,
    3C &= 0,
    3D &= -2
  ) => cases(A = -1/3, B = 0, C = 0, D = -2/3)
$

Atskirasis sprendinys gaunasi:
$
x_a = -1/3 sin(4t) - 2/3 cos(t)
$

#pagebreak()
Bendras sprendinys:
$
x(t) = x_h + x_a = C_1 cos(2t) + C_2 sin(2t) - 1/3 sin(4t) - 2/3 cos(t)
$

Naudojamos pradinės sąlygos $x(0) = 0$ ir $x'(0)=1$, kad rasti: $C_1$ ir $C_2$

$
  x'(t) = &2C_1 sin(2t) + 2C_2 cos(2t) - 4/3 cos(4t) + 2/3 sin(t) #v(3em)
  \

  x(0) &= C_1 cos 0 + C_2 sin 0 - 1/3 sin 0 - 2/3 cos 0 = 0  &=>  C_2 = 2/3 \
  x'(t) &= 2C_1 sin 0 + 2C_2 cos 0 - 4/3 cos 0 + 2/3 sin 0 = 1 &=> C_1 = 7/6  \
$

Galutinis sprendinys:
$
x(t) = 7/6 sin(2t) + 2/3 cos(2t) - 1/3 sin(4t) - 2/3 cos(t)
$

== Sprendinys naudojant kompiuterinę programą

Python `sympy` bibliotekos pateiktas sprendinys (@sympy).

#mitex(`
x{\left(t \right)} =
\frac{7 \sin{\left(2 t \right)}}{6}
- \frac{\sin{\left(4 t \right)}}{3}
- \frac{2 \cos{\left(t \right)}}{3}
+ \frac{2 \cos{\left(2 t \right)}}{3}
`)

Pertvarkius gautą atsakymą akivaizdu, kad abu sprendimai yra lygūs.

#mitex(`
x{\left(t \right)} =
\frac{7 \sin{\left(2 t \right)}}{6}
+ \frac{2 \cos{\left(2 t \right)}}{3}
- \frac{\sin{\left(4 t \right)}}{3}
- \frac{2 \cos{\left(t \right)}}{3}
`)


#figure(
  image("solution.png", width: 130%),
  caption: [
    Koši uždavinio $x''(t) + 4x(t) = 4sin(4t) - 2cos(t)$ sprendinio grafikas
  ]
)

#pagebreak()
== Sprendinio analizė

Sprendinys yra sudarytas iš trigonometrijos funkcijų $sin$ ir $cos$, kurios yra periodinės ir neturi ribos, todėl, kai $t -> +infinity$, sprendinys irgi neturi ribos.

=== Svyravimo periodas

Norint nustatyti periodą, reikia išanalizuoti atskiras dedamąsias ir jų dažnius:

Kiekvienos trigonometrinės funkcijos periodai:
$
cos(2t), sin(2t) => T = &pi\
sin(4t) => T = &pi/2\
cos(t) => T = &2pi
$

Bendras funkcijos periodas yra mažiausias bendras visų dedamųjų periodų kartotinis:

$
  T_x = "MBK"(pi, pi/2, 2pi) = 2pi
$

=== Svyravimo amplitudė

Amplitudė apskaičiuojama pagal sprendinio maksimalias ir minimalias reikšmes per vieną periodą. Skaitiškai galima atrasti minimalias reikšmes intervale $[0, 2pi]$
// $ min x(t) approx -1.965992943926988, max x(t) approx 1.6623419844462606 $
$ min x(t) approx -1.9659, max x(t) approx 1.6623 $

// $
// A = (max x(t) - min x(t))/2 approx 1.083
// $

#pagebreak()
= Priedai

== `NumPy` sprendimo kodas

#figure(
```Python
from sympy import Function, dsolve, Derivative, Eq, lambdify, sin, cos
from sympy import print_python, print_maple_code, print_latex, latex
from sympy.abc import t

x = Function('x')

eq = Eq(Derivative(Derivative(x(t), t), t) + 4*x(t), 4*sin(4*t) - 2*cos(t))

solution = dsolve(eq)
print_latex(solution)
display(solution)

Cs = solve(
  [
    Eq(solution.rhs.subs(t, 0), 0),
    Eq(solution.rhs.diff(t).subs(t, 0), 1)
  ],
  symbols("C1, C2")
)

concrete_solution = solution.subs(Cs)
print_latex(concrete_solution)
display(concrete_solution)
```,
caption: [Sprendimo kodas],
supplement: "Pav."
)<sympy>

#pagebreak()
== Vizualizacijos kodas

#figure(
```Python
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter, MultipleLocator
from fractions import Fraction as Frac

sol_f = lambdify(t, concrete_solution.rhs)

t_vals = np.linspace(-2.5 * np.pi, 2.5 * np.pi, 1000)
x_vals = sol_f(t_vals)

_, ax = plt.subplots(figsize=(12, 6))

ax.plot(t_vals, x_vals, color='blue', label=f"$x(t)$")
ax.plot(0, 0, 'bo', label="Koši taškas")

ax.set_title(f"${latex(concrete_solution)}$")
ax.axhline(y=0, lw=1, color='k')
ax.set_xlabel("t")
ax.set_ylabel("x")
ax.legend()
ax.grid(True)
ax.xaxis.set_major_formatter(FuncFormatter(
   lambda val,pos: '{:.0g}$\\pi$'.format(val/np.pi) if val != 0 else '0'
))
ax.xaxis.set_major_locator(MultipleLocator(base=np.pi))
plt.savefig('solution.png', dpi=300)

plt.show()
```,
supplement: "Pav.",
caption: [Vizualizacijos kodas]
)<viz>
