⎕FR←1287
(n⍣999)1 2 0

n←{ny←2⌷⍵ ⋄ nx←⊃⍵+2×ny ⋄ (ny)(nx) (((⌊10⍟ny+nx)>(⌊10⍟nx))+3⌷⍵)}