input←⊃⎕NGET '/home/fony/Git/ProjectEuler/p54data.txt' 1
+/1⍷p54¨input

∇res←vector input;suit;hand;card;translate;high_card;values;suits;straight;royal_flush
;one_pair;two_pairs;three_of_a_kind;x_of_a_kind;flush;full_house;pair;four_of_a_kind;straight_flush;vector1
 translate←'23456789TJQKA'
 suit←{'HDSC'⍳⍵} ⍝ Heart Diamond Spade Club
 card←{(suit 2⌷⍵)(translate⍳1⌷⍵)}
 hand←{hand_table←4 13⍴0 ⋄ hand_table[(card)¨⍵]←1 ⋄ (+/[1]hand_table)(+/[2]hand_table)}

 values←⊃hand input
 suits←2⊃hand input

 high_card←1+(⍸values)[⍋⍸values]
 x_of_a_kind←{1+⍸⍵⍷values}
 pair←⌈/0,x_of_a_kind 2
 two_pairs←(2=+/2⍷values)×⌈/0,x_of_a_kind 2
 three_of_a_kind←⌈/0,x_of_a_kind 3
 straight←⌈/0,3+⍸{1 1 1 1 1≡⍵}⌺5⊢values
 flush←⌈/5⍷suits
 full_house←(⌈/0,three_of_a_kind×(x_of_a_kind 3)*0)∧(⌈/0,(x_of_a_kind 2)*0)
 four_of_a_kind←⌈/0,x_of_a_kind 4
 straight_flush←(straight>1)∧flush
 royal_flush←(straight>1)∧14∊high_card

 res←high_card,pair,two_pairs,three_of_a_kind,straight,flush,full_house,four_of_a_kind,straight_flush,royal_flush
∇

∇res←p54 input;hand1;hand2;vector1;vector2;peters_smart
    hand1←(15↑input∊'123456789TJQKA')⊂15↑input
    hand2←(15↓input∊'123456789TJQKA')⊂15↓input

    vector1←⌽vector hand1
    vector2←⌽vector hand2

    peters_smart←{(⊃⍸0≢¨⍵)⊃⍵}

    res←×peters_smart vector1-vector2
∇