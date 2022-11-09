//
// Advent of Code 2018 - input for day 21
//

extension Day21 {
static let rawInput = #"""
#ip 1
seti 123 0 5
bani 5 456 5
eqri 5 72 5
addr 5 1 1
seti 0 0 1
seti 0 6 5
bori 5 65536 4
seti 13431073 4 5
bani 4 255 3
addr 5 3 5
bani 5 16777215 5
muli 5 65899 5
bani 5 16777215 5
gtir 256 4 3
addr 3 1 1
addi 1 1 1
seti 27 9 1
seti 0 1 3
addi 3 1 2
muli 2 256 2
gtrr 2 4 2
addr 2 1 1
addi 1 1 1
seti 25 4 1
addi 3 1 3
seti 17 8 1
setr 3 4 4
seti 7 7 1
eqrr 5 0 3
addr 3 1 1
seti 5 9 1
"""#
}

/*
 #ip 1
 0   seti 123 0 5            r5 = 123
 1   bani 5 456 5            r5 &= 456
 2   eqri 5 72 5             r5 = r5 == 72 ? 1 : 0
 3   addr 5 1 1              ip += r5
 4   seti 0 0 1              goto 1
 5   seti 0 6 5              r5 = 0
 6   bori 5 65536 4          r4 = r5 | 65536
 7   seti 13431073 4 5       r5 = 13431073
 8   bani 4 255 3            r3 = r4 & 255
 9   addr 5 3 5              r5 += r3
 10  bani 5 16777215 5       r5 &= 16777215
 11  muli 5 65899 5          r5 *= 65899
 12  bani 5 16777215 5       r5 &= 16777215
 13  gtir 256 4 3            r3 = 256 > r4 ? 1 : 0
 14  addr 3 1 1              ip += r3
 15  addi 1 1 1              goto 17
 16  seti 27 9 1             goto 28
 17  seti 0 1 3              r3 = 0
 18  addi 3 1 2              r2 = r3 + 2
 19  muli 2 256 2            r2 *= 256
 20  gtrr 2 4 2              r2 = r2 > r4 ? 1 : 0
 21  addr 2 1 1              ip += r2
 22  addi 1 1 1              ip += 1
 23  seti 25 4 1             goto 26
 24  addi 3 1 3              r3 += 1
 25  seti 17 8 1             goto 18
 26  setr 3 4 4              r4 = r3
 27  seti 7 7 1              goto 8
 28  eqrr 5 0 3              r3 = r5 == r0 ? 1 : 0
 29  addr 3 1 1              ip += r3
 30  seti 5 9 1              goto 6
 */

/*
 r5 = 123
 1:  r5 &= 456
 if r5 == 72 goto 5
 goto 1
 5:  r5 = 0
 6:  r4 = r5 | 65536
 r5 = 13431073
 8:  r3 = r4 & 255
 r5 += r3
 r5 &= 16777215
 r5 *= 65899
 r5 &= 16777215
 if 256 > r4 goto 28
 goto 17
 17: r3 = 0
 18: r2 = r3 + 2
 r2 *= 256
 if r2 > r4 goto 26
 r3 += 1
 goto 18
 26: r4 = r3
 goto 8
 28: if r5 == r0 goto end
 goto 6
 end:
 */
