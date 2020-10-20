; Steven Chiang
; Due Date: 4/27/2020
; Mircosoft Visual Studio 2017
; Program that reverses contents of array with loop using indirect adressing

INCLUDE Irvine32.inc
 .data 
warray word 4,9,13,7,5,12,17,2,15,8,6,8
 .code
main proc
		MOV esi, 0 
		MOV edx, 0
		MOV eax, 0
		MOV ebx, 0
		
		MOV esi, OFFSET warray	
		MOV edx, OFFSET warray + SIZEOF warray - TYPE warray 
		MOV ecx, LENGTHOF warray / 2 
	L1:
		MOV ax, [esi]	
		MOV bx, [edx]	
		XCHG ax,bx		
		MOV [esi], ax	
		MOV [edx], bx	
		ADD esi, TYPE warray 
		SUB edx, TYPE warray 					
		LOOP L1

		MOV ecx, LENGTHOF warray
		MOV esi, 0
		MOV esi, OFFSET warray

	L2:	 
		MOV ax, [esi]	 
		ADD esi, TYPE warray
		CALL WriteDec
		LOOP L2

		call waitmsg
		exit
main endp
end main