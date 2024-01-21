p58 0.1

∇res←p58 goal;next;y;primes;i;n
primes←3
n←5

next←{a←⍵*2 ⋄(a) (a-(⍵-1)) (a-2×(⍵-1)) (a-3×(⍵-1))}
y←{+/IsPrime¨next ⍵}
i←3
:While (primes÷n)≥goal
    i←i+2
    primes←primes+(y i)
    n←n+4
:EndWhile
res←i (primes÷n)
∇