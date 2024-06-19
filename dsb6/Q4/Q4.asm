add x28, x0, x0    # atual
add x29, x0, x0    # soma
addi x5, x0, 48
addi x6, x0, 48
add x10, x0, x0
add x18, x0, x0
add x19, x0, x0
add x20, x0, x0
add x21, x0, x0
add x22, x0, x0

lb x18, 1025(x0)
beq x18, x0, final
beq x18, x5, um
beq x0, x0, one
um:
	addi x18, x0, 0
	beq x0, x0, fimA
one:
add x6, x18, x0
addi x18, x18, -48   # atoi
add x28, x18, x0
add x29, x18, x0
loopA:
    addi x28, x28, -1
	addi x6, x6, -1
    beq x6, x5, fimA
    add x12, x28, x0
    add x13, x29, x0
    addi x14, x0, 16
	jal x1, mult
	add x29, x0, x10
	add x18, x0, x10
    beq x0, x0, loopA # Jump back to multb1
fimA:
lb x19, 1025(x0)
beq x19, x0, final
beq x19, x5, dois
beq x0, x0, two
dois:
	addi x19, x0, 0
	beq x0, x0, fimB
two:
add x6, x19, x0
addi x19, x19, -48   # atoi
add x28, x19, x0
add x29, x19, x0
loopB:
    addi x28, x28, -1
	addi x6, x6, -1
    beq x6, x5, fimB
    add x12, x28, x0
    add x13, x29, x0
    addi x14, x0, 16
	jal x1, mult
	add x29, x0, x10
	add x19, x0, x10
    beq x0, x0, loopB# Jump back to multb1
fimB:
lb x20, 1025(x0)
beq x20, x0, final
beq x20, x5, tres
beq x0, x0, three
tres:
	addi x20, x0, 0
	beq x0, x0, fimC
three:
add x6, x20, x0
addi x20, x20, -48   # atoi
add x28, x20, x0
add x29, x20, x0
loopC:
    addi x28, x28, -1
	addi x6, x6, -1
    beq x6, x5, fimC
    add x12, x28, x0
    add x13, x29, x0
    addi x14, x0, 16
	jal x1, mult
	add x29, x0, x10
	add x20, x0, x10
    beq x0, x0, loopC # Jump back to multb1
fimC:
lb x21, 1025(x0)
beq x21, x5, quatro
beq x0, x0, four
quatro:
	addi x21, x0, 0
	beq x0, x0, fimD
four:
beq x21, x0, final
add x6, x21, x0
addi x21, x21, -48   # atoi
add x28, x21, x0
add x29, x21, x0
loopD:
    addi x28, x28, -1
	addi x6, x6, -1
    beq x6, x5, fimD
    add x12, x28, x0
    add x13, x29, x0
    addi x14, x0, 16
	jal x1, mult
	add x29, x0, x10
	add x21, x0, x10
    beq x0, x0, loopD # Jump back to multb1
fimD:
lb x22, 1025(x0)
beq x22, x5, cinco
beq x0, x0, five
cinco:
	addi x22, x0, 0
	beq x0, x0, final
five:
beq x22, x0, final
add x6, x22, x0
addi x22, x22, -48   # atoi
add x28, x22, x0
add x29, x22, x0
loopE:
    addi x28, x28, -1
	addi x6, x6, -1
    beq x6, x5, final
    add x12, x28, x0
    add x13, x29, x0
    addi x14, x0, 16
	jal x1, mult
	add x29, x0, x10
	add x22, x0, x10
    beq x0, x0, loopE # Jump back to multb1
final:
add x18, x18, x19
add x18, x18, x20
add x18, x18, x21
add x18, x18, x22
add x12, x18, x0
addi x13, x0, 1
jal x1, print
halt

  print:  
  addi sp, sp, -16
  sw x1, 12(sp)
  sw x18, 8(sp)
  sw x19, 4(sp)
  sw x20, 0(sp)

  add x18, x13, x0 # int sel
  add x19, x0,  x0 # x = 0
  add x20, x0,  x0 # SEL = 0

  # SEL = sel*10 {
    addi sp, sp, -12
    sw x12, 8(sp)
    sw x13, 4(sp)
    sw x14, 0(sp)

    add x12, x18, x0 # sel
    addi x13, x0, 10 # 10
    addi x14, x0, 3  # precision
    jal x1, mult
    add x20, x10, x0

    lw x12, 8(sp)
    lw x13, 4(sp)
    lw x14, 0(sp)
    addi sp, sp, 12
  # }
  

  blt x12, x20, printL1

  add x13, x20, x0
  jal x1, print
  # print(num, SEL)

  # while (num >= sel) {
    printL1:
    blt x12, x18, printL1E 
    sub x12, x12, x18 # n -= sel
    addi x19, x19, 1  # x++
    jal x0, printL1
  # }

  printL1E:
  addi x19, x19, 48
  sb x19, 1024(x0)

  lw x1, 12(sp)
  lw x18, 8(sp)
  lw x19, 4(sp)
  lw x20, 0(sp)
  addi sp, sp, 16

  jalr x0, 0(x1)

	











mult:
  beq x12, x0, multZero
  beq x13, x0, multZero

  addi sp, sp, -20 # make room for 5 words in stack (push)

  sw x18, 16(sp) # store prod
  sw x28, 12(sp) # store i
  sw x29,  8(sp) # store n
  sw x30,  4(sp) # store do
  sw x31,  0(sp) # store bit

  addi x18, x0, 0     # int prod = 0
  addi x28, x0, 0     # int i = 0
  addi x29, x0, 1     # int n = 1
  addi x30, x0, 0     # int do = 0
  addi x31, x0, 1     # int bit = 1

  add x29, x29, x14   # n += precision
  sll x31, x31, x14   # bit << precision

  # while (i < n) {
    multLoop:
    slli x18, x18, 1 # prod << 1

    and x30, x13, x31 # do = b^bit

    beq x30, x0, multElse 
    # if (do != 0) {
      add x18, x18, x12 # prod += a
    # }
    #else {}
    multElse:
    srli x31, x31, 1 # bit >> 1

    multEnd:
    addi x28, x28, 1 # i++
    blt x28, x29, multLoop
  # }

  addi x10, x18, 0 # x10 = prod

  lw x18, 16(sp) # restore x18
  lw x28, 12(sp) # restore x28
  lw x29,  8(sp) # restore x29
  lw x30,  4(sp) # restore x30
  lw x31,  0(sp) # restore x31

  addi sp, sp, 20 # restore sp (pop)

  jalr x0, 0(x1) # return to x1
multZero:
  add x10, x0, x0
  jalr x0, 0(x1)




















  





