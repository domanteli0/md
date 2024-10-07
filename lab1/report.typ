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

= Užduotis \#1

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

#figure(
  image("1.png", width: 65%),
  caption: [Lygties $y(e^x + 1) d x - e^x d y &= 0$ integralinės kreivės]
)

#pagebreak()
= Užduotis \#2

$ 
  eq.triple \

  x y′ &= 2y + x^2/y \
  
  y′ &= 2y/x + x/(y) ,#h(1em) x != 0 \
  
  y′ &= 2y/x + (y/x)^(-1) \

  u′x + u &= 2u + u^(-1) && [ u &= y/x, #h(1em) y = u x #h(1em) y' = u'x + u ] \
  
  (d u)/(d x) x &= u + u^(-1) = (u^2 + 1)/u \
  
  u/(u^2 + 1) d u &= 1/x d x \
  
  1/2 1/(u^2 + 1) d u^2 &= 1/x d x \
  
  1/2 ln|u^2 + 1| &= ln|x| + C \

  ln|u^2 + 1| &= 2ln|x| + C \

  u^2 + 1 &= e^(2ln|x| + C) \

  u^2 + 1 &= e^(ln|x^2| + C) \

  u^2 + 1 &= C_e x^2 ,#h(1em) C_e = ±e^C \
  
  y^2 &= C_e x^4 - x^2
$

$
  y : 0 => 2y = 0 - #text[ne tapatybė, todėl] y = 0 #text[nėra užduoties sprendinys]
$

`SymPy` pateikti sprendimai:

$
    y(x) = (-x sqrt(C_1 x^2 - 1)) \
    y(x) = (x sqrt(C_1 x^2 - 1))
$

Pertvarkius sprendimą:

$
  y^2 &= C_e x^4 - x^2 \

  y^2 &= x^2 (C_e x^2 - 1) \

  y &= sqrt(x^2 (C_e x^2 - 1)) \

  y &= ±x sqrt((C_e x^2 - 1)) \
$

Ativaizdu, kad tai tie patys sprendimai.


#pagebreak()
= Užduotis \#3

$
  x^2 y′ + x y + 1 &= 0, y(2) = 1 \
  
  x^2 y′ + x y &= -1 \

  y' + y/x &= - 1/x^2 \
$

Naudojant konstantų variavimo metodą:

$
  y' + y/x &= 0 \

  (d y)/(d x) &= - y/x \
  
  integral 1/y \dy &= - integral 1/x \dx ,&& #h(1em) y != 0 \

  ln |y| &= -ln|x| + C \

  y &= C 1/x, #h(1em) C in RR && #h(1em) ±e^C -> C \

  y' &= C'/x - C/x^2 \

  // y = 0 : #h(1em) y' + y/x &= 0 => 0 eq.triple 0 => && C in RR
$

Įsistačius gautas $y$ ir $y'$ reikšmes gauname:
$
  x^2 y′ + x y + 1 = 0 => x^2(C'/x - C/x^2) + x C/x + 1 &= 0 \

  C'x - C + C + 1 &= 0 \

  C'x &= -1 \

  C' &= - 1/x, #h(1em) x != 0 \

  C &= -ln|x| + C_1
$

$
  y = C/x => y &= (C_1 - ln|x| )/x, #h(1em) \

  x : 0 => 1 != 0 - x = 0 #text[nėra atskiras sprendinys]
$

Koši sąlygos sprendimas:

$
  y(2) = 1 => (C_1 - ln|2|)/2 &= 1 \
  
  C_1 - ln|2| &= 2 \
  
  C_1 &= 2 + ln|2| \

  "Ats.:" #h(1em) y = (ln|2| + 2 -ln|x|)/x
$

`SymPy` pateiktas sprendimas:

$
  y(x) = (C - ln(x))/x
$

Ativaizdu, kad tai tie patys sprendimai.


#figure(
  image("3.png", width: 65%),
  caption: [
    Lygties $x^2 y′ + x y + 1 &= 0, y(2) = 1$ integralinė krevė ir Koši taškas
  ]
)

#pagebreak()
= Priedai

Visuose kodo pavyzdžiose naudojami šie įtraukimai:

```python
from sympy import Function, dsolve, Derivative, E, Eq, lambdify, symbols
from sympy import print_python, print_maple_code, print_latex, latex
from sympy.abc import x
import sympy as sm
import numpy as np
import matplotlib.pyplot as plt
```

== Uždieties \#1 sprendimo kodas

```python
y = Function('y')

eq = Eq(y(x) * (E**x + 1) - E**x * Derivative(y(x), x), 0)

solution = dsolve(eq)
display(solution)
```

== Uždieties \#1 vizualicazijos kodas

```python
import numpy as np
import matplotlib.pyplot as plt

C = symbols('C')
solution = solution.subs('C1', C)

sol = solution.rhs

sol1 = lambdify(x, sol.subs('C', 1))
sol2 = lambdify(x, sol.subs('C', 3))
sol3 = lambdify(x, sol.subs('C', 0.25))

x_vals = np.linspace(-1, 5, 100)
y_vals1 = sol1(x_vals)
y_vals2 = sol2(x_vals)
y_vals3 = sol3(x_vals)

plt.figure(figsize=(6, 6))

plt.plot(x_vals, y_vals1, label='C = 1', color='blue')
plt.plot(x_vals, y_vals2, label='C = 3', color='green')
plt.plot(x_vals, y_vals3, label='C = 0.25', color='red')

plt.title(f"${latex(solution)}$")
plt.xlabel("x")
plt.ylabel("y")
plt.legend()
plt.grid(True)

plt.show()
```

#pagebreak()
== Uždieties \#2 sprendimo kodas

```py
y = Function('y')

eq = Eq(
    x * Derivative(y(x), x),
    2*y(x) + x**2/y(x)
  )

solutions = dsolve(eq)

display(solutions[0])
display(solutions[1])
```

== Uždieties \#2 vizualicazijos kodas

```py
sol1 = solutions[0].rhs
sol2 = solutions[1].rhs

sol11 = lambdify(x, sol1.subs('C1', 1))
sol12 = lambdify(x, sol1.subs('C1', 3))
sol13 = lambdify(x, sol1.subs('C1', 0.25))

sol21 = lambdify(x, sol2.subs('C1', 1))
sol22 = lambdify(x, sol2.subs('C1', 3))
sol23 = lambdify(x, sol2.subs('C1', 0.25))

x2_vals = np.linspace(-10, 10, 500)
x1_vals = np.linspace(-10, 10, 500)
y_vals1 = sol11(x1_vals)
y_vals2 = sol12(x1_vals)
y_vals3 = sol13(x1_vals)
y_vals4 = sol21(x2_vals)
y_vals5 = sol22(x2_vals)
y_vals6 = sol23(x2_vals)

plt.figure(figsize=(8, 8))

plt.plot(x1_vals, y_vals1, label='C = 1', color='blue')
plt.plot(x1_vals, y_vals2, label='C = 3', color='green')
plt.plot(x1_vals, y_vals3, label='C = 0.25', color='red')
plt.plot(x2_vals, y_vals4, color='blue')
plt.plot(x2_vals, y_vals5, color='green')
plt.plot(x2_vals, y_vals6, color='red')

plt.title(f"${latex(solutions)}$")
plt.xlabel("x")
plt.ylabel("y")
plt.legend()
plt.grid(True)

plt.show()
```

#pagebreak()
== Uždieties \#3 sprendimo kodas

```py
y = Function('y')

eq = Eq(
    x**2 * Derivative(y(x), x) + x * y(x) + 1,
    0
  )

solution = dsolve(eq)
display(solution)
```

== Uždieties \#3 vizualicazijos kodas

```py
sol = solution

sol = sol.subs('C1', sm.log(2) + 2)
sol1 = lambdify(x, sol.rhs)

x_vals = np.linspace(0.1, 5, 100)
y_vals1 = sol1(x_vals)

plt.figure(figsize=(6, 6))

plt.plot(x_vals, y_vals1, label='$log(x) + 2$', color='blue')
plt.plot(2, 1, 'bo', label="Koši taškas")

plt.title(f"${latex(sol)}$")
plt.xlabel("x")
plt.ylabel("y")
plt.legend()
plt.grid(True)

plt.show()
```