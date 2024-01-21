res←key cypher text;decode;ascii;cypher_single;index;byte;xor
res←''
byte←8⍴2
xor←{(~⍺∧⍵)∧(⍺∨⍵)}

cypher_single←{(byte⊤⍵) xor byte⊤⍺}

ascii←'!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! _"###%_()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
decode←{((2⊥⍵))⌷ascii}

:For index :In ⍳⍴text
    res←res,decode ((1+((⍴key) | (index-1))) ⌷ key) cypher_single ⍎⊃index ⌷ text
:EndFor

⍝ Solution is: 101 120 112 = exp
⍝ To find solution paste output into 'https://onlinetools.com/ascii/convert-ascii-to-decimal'
⍝ Replace the ` in Euler`s with a proper '
⍝ Copy the output into 'https://onlinetoolz.net/sum'
⍝ Be happy :)