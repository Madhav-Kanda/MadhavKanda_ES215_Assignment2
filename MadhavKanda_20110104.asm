.data
	array: .word 0:3
	size: .word 3
	
.text
main:
	la $t0, array # storing the address of the array in $t0
	addi $s5, $0, 4
	addi $s6, $0, 11
	addi $s7, $0, 2
	sw $s5, 0($t0)
	sw $s6, 4($t0)
	sw $s7, 8($t0)
	lw $t1, 0($t0) # Highest value = $t1=0
	lw $t2, 0($t0) #Lowest value = $t2 and we are storing the array 's first index value in it
	addi $t3,$0,0 #Putting the value 0 in the $t3 register which is HighInd
	addi $t4,$0,0 #Putting the value 0 in the $t4 register which is LowInd
	addi $t6,$0,0 #$t6=sum=0
	addi $t7,$0,0 #$t7=index=0
	addi $t8,$0,3 #t8= value=100
	
while: 
	beq $t7,$t8,average
	lw $s2,0($t0) #load the value in $s2
	slt $s1,$t1,$s2 # if $t1 less than $t0 then $s1 will become 1
	bne $s1,$0, Highest #if the value of $s1 not equals 0 then move to Highest
	slt $s1,$s2,$t1 # if $t0 less than $t1 then $s1 will become 1
	bne $s1,$0, Lowest #if the value of $s1 not equals 0 then move to Highest
	addi $t7,$t7,1 #index+=1
	addi $t0,$t0,4 #incrementing the index value
	add $t6,$t6,$s2 #increment sum
	j while
	
Highest:
	add $t1,$0,$s2 # Highest = array[0]
	add $t3,$0,$t7 #HighestInd= current index
	addi $t7,$t7,1 #index+=1
	add $t6,$t6,$s2 #increment sum
	addi $t0,$t0,4 #incrementing the index value
	j while
	
Lowest:
	add $t2,$0,$s2 # Lowest = array[0]
	add $t4,$0,$t7 #LowestInd= current index
	addi $t7,$t7,1 #index+=1
	add $t6,$t6,$s2 #increment sum
	addi $t0,$t0,4 #incrementing the index value
	j while

average:
	div $t6,$t6,100 #Dividing by 100 
	jr $ra
	
	
	
