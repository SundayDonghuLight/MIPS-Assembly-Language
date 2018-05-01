add  $s1, $zero, $zero  #int i=0
While:
addi  $v0, $zero, 5    #cin>>a[i]
syscall
beq  $v0, $zero, EOF
sll  $t0, $s1, 2
add  $t0, $s0, $t0
sw  $v0, 0($t0)
addi  $s1, $s1, 1
j  While
EOF:
add  $t1, $zero, $zero  #int j=0
addi  $t8, $s1, -1
For1:
slt  $at, $t1, $t8    #for( ;j<i-1; )
bne  $at, $zero, L1
j  Sort_End
L1:
sll  $t0, $t1, 2
add  $t0, $s0, $t0
lw  $S2, 0($t0)    #int Max=a[j]
add  $s3, $t1, $zero  #int M_position=j

addi  $t2, $t1, 1  #int k=j+1
For2:
slt  $at, $t2, $s1  #for( ;k<i; )
bne  $at, $zero, L2
j  Search_End
L2:
