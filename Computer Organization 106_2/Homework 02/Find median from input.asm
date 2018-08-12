# s0:sequence[]  s1:i  s2:j  s3:k  s4:temp

main:
lui $s0, 0x1122

add  $s1, $zero, $zero     #int i=0

Inputdata:
addi  $v0, $zero, 5        #cin>>a[i]
syscall
beq  $v0, $zero, EOF       #if(cin.eof()) break
sll  $t0, $s1, 2
add  $t0, $s0, $t0
sw  $v0, 0($t0)
addi  $s1, $s1, 1          #i++
j  Inputdata

EOF:
addi $s2, $zero, 1         #j=1

For:
slt $t0, $s2, $s1          for(;j<i;)
bne $zero, $t0, Sorted
sll $t0, $s2, 2
add $t0, $s0, $t0
lw  $s4, 0($t0)
addi $s3, $s2, -1

While:
slt $t0, $s3, $zero        #if(k<0) don't jump
beq $t0, $zero ,Insert     #if(k>=0) break
sll $t1, $s3, 2
add $t1, $s0, $t0
lw  $t2, 0($t1)            #$t2 <- sequence[k]
slt $t0, $s4, $t1
bne $t0, $zero ,Insert     #if(temp < sequence[k]) break
sw  $t2, 4($t1)            #sequence[k+1] = sequence[k]
addi $s3, $s3, -1          #k--
j While

Insert:
sll $t0, $s3, 2
add $t0, $s0, $t0
sw  $s4, 4($t0)            #sequence[k+1] = temp
j For

Sorted:
addi $t0, $zero, 1
and $t0, $t0, $s1
beq $t0, $zero, Even
srl $t1, $s1, 1
sll  $t1, $t1, 2
add  $t1, $s0, $t1
lw  $a0, 0($t1)
addi  $v0, $zero, 1        #cout<<sequence[mid]
syscall
j  End

Even:
srl $t0, $s1, 1
sll  $t0, $t0, 2
add  $t0, $s0, $t0
lw  $t1, 0($t0)
lw  $t2, -4($t0)
add $t0, $t1, $t2
srl $a0, $t0, 1
addi  $v0, $zero, 1        #cout<<sequence[mid]
syscall

End
