# s0:a[]  s1:i  s2:Min  s3:M_position  s4:mid


add  $s1, $zero, $zero     #int i=0
While:
addi  $v0, $zero, 5        #cin>>a[i]
syscall
beq  $v0, $zero, EOF
sll  $t0, $s1, 2
add  $t0, $s0, $t0
sw  $v0, 0($t0)
addi  $s1, $s1, 1          #i++
j  While
EOF:
add  $t1, $zero, $zero     #int j=0
addi  $t8, $s1, -1
For1:
slt  $t5, $t1, $t8         #for( ;j<i-1; )
bne  $t5, $zero, L1
j  Sort_End
L1:
sll  $t0, $t1, 2
add  $t0, $s0, $t0
lw  $S2, 0($t0)            #int Max=a[j]
add  $s3, $t1, $zero       #int M_position=j

addi  $t2, $t1, 1          #int k=j+1
For2:
slt  $t5, $t2, $s1         #for( ;k<i; )
bne  $t5, $zero, L2
j  Search_End
L2:
sll  $t0, $t2, 2
add  $t0, $s0, $t0
lw  $t3, 0($t0)
slt  $t5, $t3, $t2         #if(a[k]<Min)
beq  $t5, $zero, L3
add  $s2, $t3, $zero       #Min=a[k]
add  $s3, $t2, $zero       #M_position=k
addi  $t2, $t2, 1          #for( ; ;k++)
L3:
j  For2
Search_End:
sll  $t0, $t1, 2
add  $t0, $s0, $t0
lw  $t3, 0($t0)            #tem=a[j]
sw  $t2, 0($t0)            #a[j]=Min
sll  $t0, $s3, 2
add  $t0, $s0, $t0
sw  $t3, 0($s0)            #a[M_position]=tem
addi  $t1, $t1, 1          #for( ; ;j++)
j  For1
Sort_End:
add  $t1, $zero, $zero     #int j=0
Print:
slt  $t5, $t1, $s1         #for( ;j<i; )
bne  $t5, $zero, L4
j  Print_End
L4:
sll  $t0, $t1, 2
add  $t0, $s0, $t0
lw  $a0, 0($t0)
addi  $v0, $zero, 1        #cout<<a[j]
syscall
addi  $t1, $t1, 1          #for( ; ;j++)
j  Print
Print_End:
and  $t9, $t9, $zero
addi  $t9, $t9, 1          #$t9:mask  [00...01]
and  $t5, $s1, $t9         #if(i%2==0)
bne  $t5, $zero, Else
srl  $s4, $s1, 1           #int mid=i/2
sll  $t0, $s4, 2
add  $t0, $s0, $t0
lw  $a0, 0($t0)
addi  $v0, $zero, 1        #cout<<a[mid]
syscall
j  End
Else:
srl  $s4, $s1, 1           #int midL=i/2
sll  $t0, $s4, 2
add  $t0, $s0, $t0
lw  $t1, 0($t0)
lw  $t2, 4($t0)
add  $t1, $t1, $t2
srl  $a0, $t1, 1
addi  $v0, $zero, 1
syscall
End:
addi  $v0, $zero, 10
syscall

