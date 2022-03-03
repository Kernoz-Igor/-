.data

printf_format:
	.string "Array: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 %d\n"

arr:
	.long 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
arr_end:

.text
.global main
.type main, @function

main:
	movl $arr, %ebx    /*Array EBX*/
	movl $4, %esi     /*B*/
	movl $0, %ecx	  /*Summ*/
	movl (%ebx), %eax	/*Array[i]*/
	movl $0, %edx		/*Count*/

start:
	cmpl %esi, (%ebx)
	jg summ
	jl less
	je equ

less:
	addl $1, %edx
	jmp next

summ:
	addl (%ebx),%ecx
	jmp next

equ:
	addl $1, %edx
	jmp next

next:
	addl $4,%ebx
	movl (%ebx), %eax
	jmp count

count:
	cmpl $arr_end,%ebx
	jne start
	/*push %edx*/			/*Output lower than B*/
	push %ecx			/*Output summ higher than B*/
	push $printf_format
	call printf
	addl $8, %esp
	ret

