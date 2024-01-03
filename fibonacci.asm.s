; Assembly code translation
100: LOAD 110E      ; Load the value at memory address 110E into the accumulator
101: LOAD 110C      ; Load FibNo (at address 110C) into the accumulator
102: ADD  210F      ; Add the value at address 210F (Neg1) to the accumulator
103: STORE 310D     ; Store the current accumulator value into CurrNum (address 310D)
104: LOAD 110E      ; Load the value at SumLoc (address 110E) into the accumulator
105: ADD 210D       ; Add CurrNum (at address 210D) to the accumulator
106: STORE 310D     ; Store the new sum into SumLoc (address 310D)
107: LOAD 110D      ; Load CurrNum into the accumulator
108: STORE 310C     ; Store the accumulator value into FibNo (address 310C)
109: SKIP 2000      ; Skip the next instruction if the accumulator value is 0
10A: JUMP 5101      ; Jump to the address 5101 (start of loop) if not skipped
10B: HALT           ; Stop execution
10C: DATA `h00B     ; FibNo, initialized with value 11
10D: DATA 0000      ; CurrNum, initialized with 0
10E: DATA `h000B    ; SumLoc, initialized with value 11
10F: DATA `h00FF    ; Neg1, representing -1 in 2's complement
