# multiplicacao
lw  x18, a # int a
lw  x19, b # int b
add x20, x0, x0 # c = '\0'
lw  x21, sA # int sA
lw  x22, sB # int sB

add x12, x18, x0
add x13, x19, x0
addi x14, x0, 16
jal x1, mult

beq x21, x22, plus
# minus:
addi x21, x0, 45
jal x0, printResult

plus:
addi x21, x0, 43

printResult:
sb x21, 1024(x0)
add x12, x10, x0
addi x13, x0, 1
jal x1, print
halt

# int mult(int a, int b) {
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
# }

# void print(int &num, int sel) {
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
# }

sA: .word 43 # '+'
a:  .word 99999
sB: .word 45 # '-'
b:  .word 99999