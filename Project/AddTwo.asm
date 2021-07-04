include irvine32.inc
include  macros.inc

.data
var1 dword ?
var2 dword ?
var3 dword ?
var4 dword ?
var5 dword ?
var6 dword ?
var7 dword ?
var8 dword ?
var9 dword ?
matrixb1 dword ? 
matrixb2 dword ?
matrixb3 dword ?
temprary dword ? 
Menu byte "				What do you want to do:",0ah,0dh
	 byte "				-----------------------",0ah,0dh
	 byte "				1-Addtion of Matrices" ,0ah,0dh
	 byte "				2-Subtraction of Matrices",0ah,0dh
	 byte "				3-AdjOf of a Matrix",0ah,0dh
	 byte "				4-Determinent (Mod) of a matrix",0ah,0dh
	 byte "				5-Transpose of a matrix",0ah,0dh
	 byte "				6-Multiplication of a Matrices",0ah,0dh
	 byte "				7-Inverse of a Matrix",0ah,0dh
	 byte "				8-System Of Linear Equations:",0ah,0dh,0

selectString byte "PRESS THE KEY:",0ah,0dh
	byte "			1.For 1X1 Matrix",0ah,0dh
	byte "			2.For 1X2 Matrix",0ah,0dh
	byte "			3.For 1X3 Matrix",0ah,0dh
	byte "			4.For 2X1 Matrix",0ah,0dh
	byte "			5.For 2X2 Matrix",0ah,0dh
	byte "			6.For 2X3 Matrix",0ah,0dh
	byte "			7.For 3X1 Matrix",0ah,0dh
	byte "			8.For 3X2 Matrix",0ah,0dh
	byte "			9.For 3X3 Matrix",0ah,0dh,0

arr dword  9 dup(?)
arr1 dword  9 dup(?)

.code

mainLabel: ;label for jumping to main proc, if user press 1 after the end of each procedure

main proc
    call crlf
	mov edx,offset Menu
	call writestring
	call crlf
	mwrite<"Enter your choice << ",0>
	call readint 
	mwrite<"----------------------",0ah,0dh>

	.if eax==1
	call Sum
	.elseif eax==2
	call Subtraction
	.elseif  eax==3
	call AdjOf
	.elseif eax==4
	call ModOf
	.elseif eax==5
	call Transpose
	.elseif eax==6
	call Multiplication
	.elseif eax==7
	call Inverse
	.elseif eax==8
	call SystemOfLinearEquations
	.endif
	
	call crlf
	mwrite<"Enter 0 to Exit, 1 to proceed << ",0>
	call readint
	.if eax==1
	jmp mainLabel
	.endif

exit 
main endp

;procedure to sum the Matrix elements
Sum PROC
	call crlf
	mov edx,offset selectString
	call writestring
	call crlf
	mwrite<"Enter your choice << ",0>
	call readint 
	mwrite<"----------------------",0ah,0dh>
	.if eax==1
	jmp case1
	.elseif eax==2
	jmp case2
	.elseif  eax==3
	jmp case3
	.elseif eax==4
	jmp case4
	.elseif eax==5
	jmp case5
	.elseif eax==6
	jmp case6
	.elseif eax==7
	jmp case7
	.elseif eax==8
	jmp case8
	.elseif eax==9
	jmp case9
	.endif
	case1:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,1
		L11:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L11

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,1
		L12:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L12

		mwrite<"The sum of both matrices is",0ah,0dh,0>
		mov ecx,1
		mov esi,0
		L13:
			mov eax,arr[esi]
			add eax,arr1[esi]
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L13
		jmp LExit
	case2:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,2
		L21:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L21

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,2
		L22:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L22

		mwrite<"The sum of both matrices is",0ah,0dh,0>
		mov ecx,2
		mov esi,0
		L23:
			mov eax,arr[esi]
			add eax,arr1[esi]
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L23
		jmp LExit
	case3:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,3
		L31:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L31

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,3
		L32:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L32

		mwrite<"The sum of both matrices is",0ah,0dh,0>
		mov ecx,3
		mov esi,0
		L33:
			mov eax,arr[esi]
			add eax,arr1[esi]
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L33
		jmp LExit

	case4:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,2
		L41:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L41

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,2
		L42:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L42

		mwrite<"The sum of both matrices is",0ah,0dh,0>
		mov ecx,2
		mov esi,0
		L43:
			mov eax,arr[esi]
			add eax,arr1[esi]
			.if ecx==1
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L43
		jmp LExit
	case5:
	mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,4
		L51:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L51

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,4
		L52:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L52

		mwrite<"The sum of both matrices is",0ah,0dh,0>
		mov ecx,4
		mov esi,0
		L53:
			mov eax,arr[esi]
			add eax,arr1[esi]
			.if ecx==2
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L53
		jmp LExit

	case6:
	mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,6
		L61:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L61

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,6
		L62:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L62

		mwrite<"The sum of both matrices is",0ah,0dh,0>
		mov ecx,6
		mov esi,0
		L63:
			mov eax,arr[esi]
			add eax,arr1[esi]
			.if ecx==3
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L63
		jmp LExit

	case7:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,3
		L71:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L71

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,3
		L72:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L72

		mwrite<"The sum of both matrices is",0ah,0dh,0>
		mov ecx,3
		mov esi,0
		L73:
			mov eax,arr[esi]
			add eax,arr1[esi]
			.if ecx==2 || ecx==1
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L73
		jmp LExit

	case8:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,6
		L81:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L81

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,6
		L82:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L82

		mwrite<"The sum of both matrices is",0ah,0dh,0>
		mov ecx,6
		mov esi,0
		L83:
			mov eax,arr[esi]
			add eax,arr1[esi]
			.if ecx==4 || ecx==2
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L83
		jmp LExit

	case9:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,9
		L91:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L91

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,9
		L92:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L92

		mwrite<"The sum of both matrices is",0ah,0dh,0>
		mov ecx,9
		mov esi,0
		L93:
			mov eax,arr[esi]
			add eax,arr1[esi]
			mwrite<"	",0>
			.if ecx==6 || ecx==3
				mwrite<0ah,0dh,0>
				mwrite<"	",0>
			.endif
			call writeint
			add esi,type arr1
		loop L93
		jmp LExit
	LExit:
		ret
	sum endp

;procedure for the subtraction of matrices
Subtraction PROC
call crlf
	mov edx,offset selectString
	call writestring
	call crlf
	mwrite<"Enter your choice << ",0>
	call readint 
	mwrite<"----------------------",0ah,0dh>
	.if eax==1
	jmp case1
	.elseif eax==2
	jmp case2
	.elseif  eax==3
	jmp case3
	.elseif eax==4
	jmp case4
	.elseif eax==5
	jmp case5
	.elseif eax==6
	jmp case6
	.elseif eax==7
	jmp case7
	.elseif eax==8
	jmp case8
	.elseif eax==9
	jmp case9
	.endif
	case1:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,1
		L11:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L11

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,1
		L12:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L12

		mwrite<"The Subtraction of both matrices is",0ah,0dh,0>
		mov ecx,1
		mov esi,0
		L13:
			mov eax,arr[esi]
			sub eax,arr1[esi]
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L13
		jmp LExit
	case2:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,2
		L21:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L21

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,2
		L22:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L22

		mwrite<"The Subtraction of both matrices is",0ah,0dh,0>
		mov ecx,2
		mov esi,0
		L23:
			mov eax,arr[esi]
			sub eax,arr1[esi]
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L23
		jmp LExit
	case3:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,3
		L31:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L31

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,3
		L32:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L32

		mwrite<"The Subtraction of both matrices is",0ah,0dh,0>
		mov ecx,3
		mov esi,0
		L33:
			mov eax,arr[esi]
			sub eax,arr1[esi]
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L33
		jmp LExit

	case4:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,2
		L41:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L41

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,2
		L42:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L42

		mwrite<"The Subtraction of both matrices is",0ah,0dh,0>
		mov ecx,2
		mov esi,0
		L43:
			mov eax,arr[esi]
			sub eax,arr1[esi]
			.if ecx==1
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L43
		jmp LExit
	case5:
	mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,4
		L51:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L51

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,4
		L52:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L52

		mwrite<"The Subtraction of both matrices is",0ah,0dh,0>
		mov ecx,4
		mov esi,0
		L53:
			mov eax,arr[esi]
			sub eax,arr1[esi]
			.if ecx==2
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L53
		jmp LExit

	case6:
	mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,6
		L61:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L61

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,6
		L62:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L62

		mwrite<"The Subtraction of both matrices is",0ah,0dh,0>
		mov ecx,6
		mov esi,0
		L63:
			mov eax,arr[esi]
			sub eax,arr1[esi]
			.if ecx==3
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L63
		jmp LExit

	case7:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,3
		L71:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L71

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,3
		L72:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L72

		mwrite<"The Subtraction of both matrices is",0ah,0dh,0>
		mov ecx,3
		mov esi,0
		L73:
			mov eax,arr[esi]
			sub eax,arr1[esi]
			.if ecx==2 || ecx==1
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L73
		jmp LExit

	case8:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,6
		L81:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L81

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,6
		L82:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L82

		mwrite<"The Subtraction of both matrices is",0ah,0dh,0>
		mov ecx,6
		mov esi,0
		L83:
			mov eax,arr[esi]
			sub eax,arr1[esi]
			.if ecx==4 || ecx==2
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr1
		loop L83
		jmp LExit

	case9:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,9
		L91:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L91

		mwrite<"Enter the elements of Matrix 02",0ah,0dh,0>
		mov esi,0
		mov ecx,9
		L92:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L92

		mwrite<"The Subtraction of both matrices is",0ah,0dh,0>
		mov ecx,9
		mov esi,0
		L93:
			mov eax,arr[esi]
			sub eax,arr1[esi]
			mwrite<"	",0>
			.if ecx==6 || ecx==3
				mwrite<0ah,0dh,0>
				mwrite<"	",0>
			.endif
			call writeint
			add esi,type arr1
		loop L93
		jmp LExit
	LExit:
		ret
Subtraction endp

;procedure for the Adjoint of a given matrix
AdjOf proc
call crlf
	mwrite<"		1.For 2X2 Matrix ",0ah,0dh,0>
	mwrite<"		2.For 3X3 Matrix ",0ah,0dh,0>
	mwrite<"		Enter your Choice: ",0ah,0dh,0>
	mwrite<"---------------------------------------: ",0>
	call readint
	.if eax==1
		jmp case1
	.else
		jmp case2
	.endif
	case1:
	mwrite<"Enter the elements of Matrix",0ah,0dh,0>
		mov esi,0
		mov ecx,4
		L11:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L11

		
		mov esi,0
		mov eax,arr[esi]
		xchg eax,arr[esi+12]
		mov arr[esi],eax

		mov eax,arr[esi+4]
		neg eax
		mov arr[esi+4],eax

		mov eax,arr[esi+8]
		neg eax
		mov arr[esi+8],eax

		;mov esi,0
		mov ecx,4
		L12:
			mov eax,arr[esi]
			.if ecx==2
			mwrite<" ",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi, type arr
		loop L12
		
		jmp LExit
	case2:

	mwrite<"Enter the elements of Matrix",0ah,0dh,0>
		mov esi,0
		mov ecx,9
		L21:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L21

		;calculating 1st Cofector
		mov esi,0
		mov eax,arr[esi+16]
		mov ebx,arr[esi+32]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+20]
		mov ebx,arr[esi+28]
		mul ebx
		mov var2,eax
		mov eax,var1
		sub eax,var2
		push eax

		;calculating 2nd Cofector
		mov eax,arr[esi+12]
		mov ebx,arr[esi+32]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+20]
		mov ebx,arr[esi+24]
		mul ebx
		mov var2,eax
		mov eax,var1
		sub eax,var2
		neg eax
		push eax

		;calculating 3rd Cofector
		mov eax,arr[esi+12]
		mov ebx,arr[esi+28]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+16]
		mov ebx,arr[esi+24]
		mul ebx
		mov var2,eax
		mov eax,var1
		sub eax,var2
		push eax

		;calculating 4rth Cofector
		mov eax,arr[esi+4]
		mov ebx,arr[esi+32]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+8]
	
		mov ebx,arr[esi+28]
		mul ebx
		mov var2,eax
		mov eax,var1
		sub eax,var2
		neg eax
		push eax

		;calculating 5rth Cofector
		mov eax,arr[esi]
		mov ebx,arr[esi+32]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+8]
		mov ebx,arr[esi+24]
		mul ebx
		mov var2,eax
		mov eax,var1
		sub eax,var2
		push eax

		;calculating 6th Cofector
		mov eax,arr[esi]
		mov ebx,arr[esi+28]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+4]
		mov ebx,arr[esi+24]
		mul ebx
		mov var2,eax
		mov eax,var1
		sub eax,var2
		neg eax
		push eax

		;calculating 7th Cofector
		mov eax,arr[esi+4]
		mov ebx,arr[esi+20]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+8]
		mov ebx,arr[esi+16]
		mul ebx
		mov var2,eax
		mov eax,var1
		sub eax,var2
		push eax

		;calculating 8th Cofector

		mov eax,arr[esi]
		mov ebx,arr[esi+20]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+8]
		mov ebx,arr[esi+12]
		mul ebx
		mov var2,eax
		mov eax,var1
		sub eax,var2
		neg eax
		push eax

		;calculating 9th Cofector
		mov eax,arr[esi]
		mov ebx,arr[esi+16]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+4]
		mov ebx,arr[esi+12]
		mul ebx
		mov var2,eax
		mov eax,var1
		sub eax,var2
		push eax

		mov esi,0
		mov ecx,9
		Lpop:
			pop eax
			mov arr[esi],eax
			add esi,type arr
		loop Lpop

		mov esi,0
		mov eax,arr[esi]
		xchg eax,arr[esi+32]
		mov arr[esi],eax
		mov esi,0
		mov eax,arr[esi+4]
		xchg eax,arr[esi+20]
		mov arr[esi+4],eax
		mov esi,0
		mov eax,arr[esi+12]
		xchg eax,arr[esi+28]
		mov arr[esi+12],eax

		mov esi,0
		mov ecx,9
		Lprint:
			mov eax,arr[esi]
			.if ecx==6 || ecx==3
			mwrite<" ",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi, type arr
		loop Lprint

		jmp LExit
	LExit:
		ret
AdjOf endp 

;procedure for the Mod of of a given matrix
ModOf proc
	
	call crlf
	mwrite<"		1.For 2X2 Matrix ",0ah,0dh,0>
	mwrite<"		2.For 3X3 Matrix ",0ah,0dh,0>
	mwrite<"		Enter your Choice: ",0ah,0dh,0>
	mwrite<"---------------------------------------: ",0>
	call readint
	.if eax==1
		jmp case1
	.else
		jmp case2
	.endif
	case1:
	mwrite<"Enter the elements of Matrix",0ah,0dh,0>
		mov esi,0
		mov ecx,4
		L11:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L11
		mov esi,0
		mov eax,arr[esi]
		mov ebx,arr[esi+12]
		mul ebx
		push eax
		mov eax,arr[esi+4]
		mov ebx,arr[esi+8]
		mul ebx
		mov var1,eax
		pop eax
		sub eax,var1
		call writeint
		jmp LExit
	case2:
	mwrite<"Enter the elements of Matrix",0ah,0dh,0>
		mov esi,0
		mov ecx,9
		L21:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L21
		mov esi,0
		mov eax,arr[esi]
		mov var1,eax
		mov eax,arr[esi+16]
		mov ebx,arr[esi+32]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+20]
		mov ebx,arr[esi+28]
		mul ebx
		mov var3,eax
		mov eax,var2
		sub eax,var3
		mul var1
		push eax

		mov eax,arr[esi+4]
		neg eax
		mov var1,eax
		mov eax,arr[esi+12]
		mov ebx,arr[esi+32]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+20]
		mov ebx,arr[esi+24]
		mul ebx
		mov var3,eax
		mov eax,var2
		sub eax,var3
		mul var1
		push eax

		mov eax,arr[esi+8]
		mov var1,eax
		mov eax,arr[esi+12]
		mov ebx,arr[esi+28]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+16]
		mov ebx,arr[esi+24]
		mul ebx
		mov var3,eax
		mov eax,var2
		sub eax,var3
		mul var1
		mov var1,eax
		pop eax
		mov var2,eax
		pop eax
		add eax,var2
		add eax,var1
		call writeint
	jmp LExit
	LExit:
	ret
ModOf endp

;procedure for the transpose of a given matrix
Transpose proc
call crlf
	mov edx,offset selectString
	call writestring
	call crlf
	mwrite<"Enter your choice << ",0>
	call readint 
	mwrite<"----------------------",0ah,0dh>
	.if eax==1
	jmp case1
	.elseif eax==2
	jmp case2
	.elseif  eax==3
	jmp case3
	.elseif eax==4
	jmp case4
	.elseif eax==5
	jmp case5
	.elseif eax==6
	jmp case6
	.elseif eax==7
	jmp case7
	.elseif eax==8
	jmp case8
	.elseif eax==9
	jmp case9
	.endif
	case1:
		mwrite<"Enter the elements of Matrix",0ah,0dh,0>
		mov esi,0
		mov ecx,1
		L11:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L11

		mwrite<"The Transpose of the given matrix is",0ah,0dh,0>
		mov ecx,1
		mov esi,0
		L12:
			mov eax,arr[esi]
			mwrite<"	",0>
			call writeint
		loop L12
		jmp LExit
	case2:
		mwrite<"Enter the elements of Matrix ",0ah,0dh,0>
		mov esi,0
		mov ecx,2
		L21:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L21

		mwrite<"The Transpose of the given matrix is",0ah,0dh,0>
		mov ecx,2
		mov esi,0
		L22:
			mov eax,arr[esi]
			.if ecx==1
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr
		loop L22
		jmp LExit
	case3:
		mwrite<"Enter the elements of Matrix ",0ah,0dh,0>
		mov esi,0
		mov ecx,3
		L31:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L31

		mwrite<"The Transpose of the given matrix is",0ah,0dh,0>
		mov ecx,3
		mov esi,0
		L32:
			mov eax,arr[esi]
			.if ecx==1 || ecx==2
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr
		loop L32
		jmp LExit

	case4:
		mwrite<"Enter the elements of Matrix",0ah,0dh,0>
		mov esi,0
		mov ecx,2
		L41:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L41

		mwrite<"The Transpose of the given matrix is",0ah,0dh,0>
		mov ecx,2
		mov esi,0
		L42:
			mov eax,arr[esi]
			mwrite<"	",0>
			call writeint
			add esi,type arr
		loop L42
		jmp LExit
	case5:
	mwrite<"Enter the elements of Matrix",0ah,0dh,0>
		mov esi,0
		mov ecx,4
		L51:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L51

		mwrite<"The Transpose of the given matrix is",0ah,0dh,0>
		mov ecx,4
		mov esi,0
		mov edx,arr[esi+4]
		xchg arr[esi+8],edx
		mov arr[esi+4],edx
		L52:
			mov eax,arr[esi]
			.if ecx==2
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr
		loop L52
		jmp LExit

	case6:
	mwrite<"Enter the elements of Matrix",0ah,0dh,0>
		mov esi,0
		mov ecx,6
		L61:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L61

		mwrite<"The Transpose of the given matrix is",0ah,0dh,0>
		mov ecx,6
		mov esi,0
		mov edx,arr[esi+4]
		xchg arr[esi+12],edx
		mov arr[esi+4],edx
		mov edx,arr[esi+8]
		xchg arr[esi+12],edx
		mov arr[esi+8],edx
		mov edx,arr[esi+12]
		xchg arr[esi+16],edx
		mov arr[esi+12],edx
		L62:
			mov eax,arr[esi]
			.if ecx==4 || ecx==2
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr
		loop L62
		jmp LExit

	case7:
		mwrite<"Enter the elements of Matrix",0ah,0dh,0>
		mov esi,0
		mov ecx,3
		L71:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L71


		mwrite<"The Transpose of the given matrix is",0ah,0dh,0>
		mov ecx,3
		mov esi,0
		L73:
			mov eax,arr[esi]
			mwrite<"	",0>
			call writeint
			add esi,type arr
		loop L73
		jmp LExit

	case8:
		mwrite<"Enter the elements of Matrix ",0ah,0dh,0>
		mov esi,0
		mov ecx,6
		L81:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L81

		mwrite<"The Transpose of the given matrix is",0ah,0dh,0>
		mov ecx,6
		mov esi,0
		mov edx,arr[esi+4]
		xchg arr[esi+8],edx
		mov arr[esi+4],edx
		mov edx,arr[esi+12]
		xchg arr[esi+16],edx
		mov arr[esi+12],edx
		mov edx,arr[esi+8]
		xchg arr[esi+12],edx
		mov arr[esi+8],edx
		L83:
			mov eax,arr[esi]
			.if ecx==3
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi,type arr
		loop L83
		jmp LExit

	case9:
		mwrite<"Enter the elements of Matrix 01",0ah,0dh,0>
		mov esi,0
		mov ecx,9
		L91:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L91

		mwrite<"The Transpose of the given matrix is ",0ah,0dh,0>
		mov ecx,9
		mov esi,0
		mov edx,arr[esi+4]
		xchg arr[esi+12],edx
		mov arr[esi+4],edx
		mov edx,arr[esi+8]
		xchg arr[esi+24],edx
		mov arr[esi+8],edx
		mov edx,arr[esi+20]
		xchg arr[esi+28],edx
		mov arr[esi+20],edx
		L93:
			mov eax,arr[esi]
			mwrite<"	",0>
			.if ecx==6 || ecx==3
				mwrite<0ah,0dh,0>
				mwrite<"	",0>
			.endif
			call writeint
			add esi,type arr
		loop L93
		jmp LExit
	LExit:
ret
Transpose endp

;procedure for the multiplication of a two matrices
Multiplication proc
	call crlf
	mwrite<"	For Square Matrix Only ",0ah,0dh,0>
	mwrite<"---------------------------------------: ",0ah,0dh,0>
	mwrite<"		1.For 2X2 Matrix ",0ah,0dh,0>
	mwrite<"		2.For 3X3 Matrix ",0ah,0dh,0>
	mwrite<"		Enter your Choice: ",0ah,0dh,0>
	mwrite<"---------------------------------------: ",0ah,0dh,0>
	call readint
	.if eax==1
		jmp case1
	.else
		jmp case2
	.endif
	case1:
		mwrite<"Enter the elements of Matrix_01",0ah,0dh,0>
		mov esi,0
		mov ecx,4
		L11:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L11

		mwrite<"Enter the elements of Matrix_02",0ah,0dh,0>
		mov esi,0
		mov ecx,4
		L12:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L12

		mov esi,0
		mov eax,arr[esi]
		mov ebx,arr1[esi]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+4]
		mov ebx,arr1[esi+8]
		mul ebx
		add eax,var1
		push eax

		mov eax,arr[esi]
		mov ebx,arr1[esi+4]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+4]
		mov ebx,arr1[esi+12]
		mul ebx
		add eax,var1
		push eax

		mov eax,arr[esi+8]
		mov ebx,arr1[esi]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+12]
		mov ebx,arr1[esi+8]
		mul ebx
		add eax,var1
		push eax

		mov eax,arr[esi+8]
		mov ebx,arr1[esi+4]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+12]
		mov ebx,arr1[esi+12]
		mul ebx
		add eax,var1
		push eax

		mov esi,0
		mov ecx,4
		Lpop:
			pop eax
			mov arr[esi],eax
			add esi,type arr
		loop Lpop

		mov esi,12
		mov ecx,4
		Lprint:
			mov eax,arr[esi]
			.if ecx==2
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			sub esi,type arr
		loop Lprint
		jmp LExit
		case2:
		mwrite<"Enter the elements of Matrix_01",0ah,0dh,0>
		mov esi,0
		mov ecx,9
		L21:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L21

		mwrite<"Enter the elements of Matrix_02",0ah,0dh,0>
		mov esi,0
		mov ecx,9
		L22:
			call readint
			mov arr1[esi],eax
			add esi,type arr1
		loop L22

		mov esi,0
		mov eax,arr[esi]
		mov ebx,arr1[esi]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+4]
		mov ebx,arr1[esi+12]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+8]
		mov ebx,arr1[esi+24]
		mul ebx
		add eax,var1
		add eax,var2
		push eax

		mov esi,0
		mov eax,arr[esi]
		mov ebx,arr1[esi+4]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+4]
		mov ebx,arr1[esi+16]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+8]
		mov ebx,arr1[esi+28]
		mul ebx
		add eax,var1
		add eax,var2
		push eax

		mov esi,0
		mov eax,arr[esi]
		mov ebx,arr1[esi+8]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+4]
		mov ebx,arr1[esi+20]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+8]
		mov ebx,arr1[esi+32]
		mul ebx
		add eax,var1
		add eax,var2
		push eax
		
		mov esi,0
		mov eax,arr[esi+12]
		mov ebx,arr1[esi]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+16]
		mov ebx,arr1[esi+12]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+20]
		mov ebx,arr1[esi+24]
		mul ebx
		add eax,var1
		add eax,var2
		push eax

		mov esi,0
		mov eax,arr[esi+12]
		mov ebx,arr1[esi+4]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+16]
		mov ebx,arr1[esi+16]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+20]
		mov ebx,arr1[esi+28]
		mul ebx
		add eax,var1
		add eax,var2
		push eax

		mov esi,0
		mov eax,arr[esi+12]
		mov ebx,arr1[esi+8]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+16]
		mov ebx,arr1[esi+20]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+20]
		mov ebx,arr1[esi+32]
		mul ebx
		add eax,var1
		add eax,var2
		push eax
		
		mov esi,0
		mov eax,arr[esi+24]
		mov ebx,arr1[esi]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+28]
		mov ebx,arr1[esi+12]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+32]
		mov ebx,arr1[esi+24]
		mul ebx
		add eax,var1
		add eax,var2
		push eax

		mov esi,0
		mov eax,arr[esi+24]
		mov ebx,arr1[esi+4]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+28]
		mov ebx,arr1[esi+16]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+32]
		mov ebx,arr1[esi+28]
		mul ebx
		add eax,var1
		add eax,var2
		push eax

		mov esi,0
		mov eax,arr[esi+24]
		mov ebx,arr1[esi+8]
		mul ebx
		mov var1,eax
		mov eax,arr[esi+28]
		mov ebx,arr1[esi+20]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+32]
		mov ebx,arr1[esi+32]
		mul ebx
		add eax,var1
		add eax,var2
		push eax

		mov esi,0
		mov ecx,9
		Lpop2:
			pop eax
			mov arr[esi],eax
			add esi,type arr
		loop Lpop2

		mov esi,32
		mov ecx,9
		Lprint2:
			mov eax,arr[esi]
			.if ecx==6 || ecx==3
			mwrite<"	",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			sub esi,type arr
		loop Lprint2

		LExit:
		ret
Multiplication endp

;procedure for the inverse of a given matrix
Inverse proc
	call crlf
	mwrite<"		1.For 2X2 Matrix ",0ah,0dh,0>
	mwrite<"		2.For 3X3 Matrix ",0ah,0dh,0>
	mwrite<"		Enter your Choice: ",0ah,0dh,0>
	mwrite<"---------------------------------------: ",0>
	call readint
	.if eax==1
		jmp case1
	.else
		jmp case2
	.endif
	case1:

		mwrite<"Enter the elements of Matrix",0ah,0dh,0>
		mov esi,0
		mov ecx,4
		L11:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L11

		mov esi,0
		mov eax,arr[esi]
		mov ebx,arr[esi+12]
		mul ebx
		push eax
		mov eax,arr[esi+4]
		mov ebx,arr[esi+8]
		mul ebx
		mov var1,eax
		pop eax
		sub eax,var1
		mov var1,eax

		call writeint
		.if eax==0
			mwrite<0ah,0dh,"As it is Singular Matrix So,solution Does not Exit",0ah,0dh,0>
			jmp LExit
		.else
			mov esi,0
			mov eax,arr[esi]
			xchg eax,arr[esi+12]
			mov arr[esi],eax
			mov eax,arr[esi+4]
			neg eax
			mov arr[esi+4],eax

			mov eax,arr[esi+8]
			neg eax
			mov arr[esi+8],eax

			mov esi,0
			mov ecx,4
			L13:
			mov eax,arr[esi]
			mov edx,0
			div var1
			.if ecx==2
			mwrite<" ",0ah,0dh,0>
			.endif
			mwrite<"	",0>
			call writeint
			add esi, type arr
			loop L13
		.endif
	jmp LExit
	case2:

	mwrite<"Enter the elements of Matrix",0ah,0dh,0>
		mov esi,0
		mov ecx,9
		L21:
			call readint
			mov arr[esi],eax
			add esi,type arr
		loop L21

		mov esi,0
		mov eax,arr[esi]
		mov var1,eax
		mov eax,arr[esi+16]
		mov ebx,arr[esi+32]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+20]
		mov ebx,arr[esi+28]
		mul ebx
		mov var3,eax
		mov eax,var2
		sub eax,var3
		mul var1
		push eax

		mov eax,arr[esi+4]
		neg eax
		mov var1,eax
		mov eax,arr[esi+12]
		mov ebx,arr[esi+32]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+20]
		mov ebx,arr[esi+24]
		mul ebx
		mov var3,eax
		mov eax,var2
		sub eax,var3
		mul var1
		push eax

		mov eax,arr[esi+8]
		mov var1,eax
		mov eax,arr[esi+12]
		mov ebx,arr[esi+28]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+16]
		mov ebx,arr[esi+24]
		mul ebx
		mov var3,eax
		mov eax,var2
		sub eax,var3
		mul var1
		mov var1,eax
		pop eax
		mov var2,eax
		pop eax
		add eax,var2
		add eax,var1
		call writeint

		.if eax==0
			mwrite<0ah,0dh,"As it is Singular Matrix So,solution Does not Exit",0ah,0dh,0>
			jmp LExit
		.else
			push eax

			mov esi,0
			mov eax,arr[esi+16]
			mov ebx,arr[esi+32]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+20]
			mov ebx,arr[esi+28]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			push eax

			;calculating 2nd Cofector
			mov eax,arr[esi+12]
			mov ebx,arr[esi+32]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+20]
			mov ebx,arr[esi+24]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			neg eax
			push eax

			;calculating 3rd Cofector
			mov eax,arr[esi+12]
			mov ebx,arr[esi+28]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+16]
			mov ebx,arr[esi+24]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			push eax

			;calculating 4rth Cofector
			mov eax,arr[esi+4]
			mov ebx,arr[esi+32]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+8]
	
			mov ebx,arr[esi+28]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			neg eax
			push eax

			;calculating 5rth Cofector
			mov eax,arr[esi]
			mov ebx,arr[esi+32]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+8]
			mov ebx,arr[esi+24]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			push eax

			;calculating 6th Cofector
			mov eax,arr[esi]
			mov ebx,arr[esi+28]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+4]
			mov ebx,arr[esi+24]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			neg eax
			push eax

			;calculating 7th Cofector
			mov eax,arr[esi+4]
			mov ebx,arr[esi+20]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+8]
			mov ebx,arr[esi+16]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			push eax

			;calculating 8th Cofector

			mov eax,arr[esi]
			mov ebx,arr[esi+20]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+8]
			mov ebx,arr[esi+12]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			neg eax
			push eax

			;calculating 9th Cofector
			mov eax,arr[esi]
			mov ebx,arr[esi+16]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+4]
			mov ebx,arr[esi+12]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			push eax

			mov esi,0
			mov ecx,9
			Lpop:
				pop eax
				mov arr[esi],eax
				add esi,type arr
			loop Lpop

			mov esi,0
			mov eax,arr[esi]
			xchg eax,arr[esi+32]
			mov arr[esi],eax
			mov esi,0
			mov eax,arr[esi+4]
			xchg eax,arr[esi+20]
			mov arr[esi+4],eax
			mov esi,0
			mov eax,arr[esi+12]
			xchg eax,arr[esi+28]
			mov arr[esi+12],eax

			pop var1

			mov esi,0
			mov ecx,9
			Lprint:
				mov eax,arr[esi]
				mov edx,0
				div var1
				.if ecx==6 || ecx==3
				mwrite<" ",0ah,0dh,0>
				.endif
				mwrite<"	",0>
				call writeint
				add esi, type arr
			loop Lprint
		.endif
	LExit:
		ret
Inverse endp

SystemOfLinearEquations proc
call crlf
	mwrite<"		1.For Equation with 2 Variables: ",0ah,0dh,0>
	mwrite<"		2.For Equations with 3 Variables: ",0ah,0dh,0>
	mwrite<"		Enter your Choice: ",0ah,0dh,0>
	mwrite<"---------------------------------------: ",0>
	call readint
	.if eax==1
		jmp case1
	.else
		jmp case2
	.endif
	case1:

		mov esi,0
		mwrite<"Enter The Co-Effient of A1",0ah,0dh,0>
		call readint
		mov var1,eax
		mwrite<"Enter The Co-Effient of B1",0ah,0dh,0>
		call readint
		mov var2,eax
		mwrite<"Enter The Contant(c) of the Equation_1",0ah,0dh,0>
		call readint
		mov matrixb1,eax
		mwrite<"Enter The Co-Effient of A2",0ah,0dh,0>
		call readint
		mov var3,eax
		mwrite<"Enter The Co-Effient of B2",0ah,0dh,0>
		call readint
		mov var4,eax
		mwrite<"Enter The Contant(c) of the Equation_2",0ah,0dh,0>
		call readint
		mov matrixb2,eax


		mov esi,0
		mov eax,var1
		mov arr[esi],eax
		mov eax,var2
		mov arr[esi+4],eax
		mov eax,var3
		mov arr[esi+8],eax
		mov eax,var4
		mov arr[esi+12],eax

		mov esi,0
		mov eax,matrixb1
		mov arr1[esi],eax
		mov eax,matrixb2
		mov arr1[esi+4],eax

		mov esi,0
		mov eax,arr[esi]
		mov ebx,arr[esi+12]
		mul ebx
		push eax
		mov eax,arr[esi+4]
		mov ebx,arr[esi+8]
		mul ebx
		mov var1,eax
		pop eax
		sub eax,var1
		mov var1,eax

		call writeint
		.if eax==0
			mwrite<0ah,0dh,"As it is Singular Matrix So,solution Does not Exit",0ah,0dh,0>
			jmp LExit
		.else
			mov esi,0
			mov eax,arr[esi]
			xchg eax,arr[esi+12]
			mov arr[esi],eax
			mov eax,arr[esi+4]
			neg eax
			mov arr[esi+4],eax

			mov eax,arr[esi+8]
			neg eax
			mov arr[esi+8],eax

			mov esi,0
			mov eax,arr[esi]
			mov ebx,arr1[esi]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+4]
			mov ebx,arr1[esi+4]
			mul ebx
			add eax,var1
			push eax

			mov eax,arr[esi+8]
			mov ebx,arr1[esi]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+12]
			mov ebx,arr1[esi+4]
			mul ebx
			add eax,var1
			push eax

			mov esi,0
			mov ecx,2
			Lpop:
				pop eax
				mov arr[esi],eax
				add esi,type arr
			loop Lpop
			mwrite<"The Solution of the Given Equations is: ",0ah,0dh,0>
			mov esi,4
			mov ecx,2
			Lprint:
				mov eax,arr[esi]
				.if ecx==1
				mwrite<"	",0ah,0dh,0>
				.endif
				mwrite<"	",0>
				call writeint
				sub esi,type arr
			loop Lprint
		.endif
			jmp LExit
	case2:
		mov esi,0
		mwrite<"Enter The Co-Effient of A1",0ah,0dh,0>
		call readint
		mov var1,eax
		mwrite<"Enter The Co-Effient of B1",0ah,0dh,0>
		call readint
		mwrite<"Enter The Co-Effient of c1",0ah,0dh,0>
		call readint
		mov var3,eax
		mwrite<"Enter The Contant(d1) of the Equation_1",0ah,0dh,0>
		call readint
		mov matrixb1,eax
		mwrite<"Enter The Co-Effient of A2",0ah,0dh,0>
		call readint
		mov var4,eax
		mwrite<"Enter The Co-Effient of B2",0ah,0dh,0>
		call readint
		mov var5,eax
		mwrite<"Enter The Co-Effient of C2",0ah,0dh,0>
		call readint
		mov var6,eax
		mwrite<"Enter The Contant(d2) of the Equation_2",0ah,0dh,0>
		call readint
		mov matrixb2,eax
		mwrite<"Enter The Co-Effient of A3",0ah,0dh,0>
		call readint
		mov var4,eax
		mwrite<"Enter The Co-Effient of B3",0ah,0dh,0>
		call readint
		mov var5,eax
		mwrite<"Enter The Co-Effient of C3",0ah,0dh,0>
		call readint
		mov var6,eax
		mwrite<"Enter The Contant(d3) of the Equation_3",0ah,0dh,0>
		call readint
		mov matrixb3,eax

		mov esi,0
		mov eax,var1
		mov arr[esi],eax
		mov eax,var2
		mov arr[esi+4],eax
		mov eax,var3
		mov arr[esi+8],eax
		mov eax,var4
		mov arr[esi+12],eax
		mov eax,var5
		mov arr[esi+16],eax
		mov eax,var6
		mov arr[esi+20],eax
		mov eax,var7
		mov arr[esi+24],eax
		mov eax,var8
		mov arr[esi+28],eax
		mov eax,var9
		mov arr[esi+32],eax

		mov esi,0
		mov eax,matrixb1
		mov arr1[esi],eax
		mov eax,matrixb2
		mov arr1[esi+4],eax
		mov eax,matrixb3
		mov arr[esi+8],eax



		mov esi,0
		mov eax,arr[esi]
		mov var1,eax
		mov eax,arr[esi+16]
		mov ebx,arr[esi+32]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+20]
		mov ebx,arr[esi+28]
		mul ebx
		mov var3,eax
		mov eax,var2
		sub eax,var3
		mul var1
		push eax

		mov eax,arr[esi+4]
		neg eax
		mov var1,eax
		mov eax,arr[esi+12]
		mov ebx,arr[esi+32]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+20]
		mov ebx,arr[esi+24]
		mul ebx
		mov var3,eax
		mov eax,var2
		sub eax,var3
		mul var1
		push eax

		mov eax,arr[esi+8]
		mov var1,eax
		mov eax,arr[esi+12]
		mov ebx,arr[esi+28]
		mul ebx
		mov var2,eax
		mov eax,arr[esi+16]
		mov ebx,arr[esi+24]
		mul ebx
		mov var3,eax
		mov eax,var2
		sub eax,var3
		mul var1
		mov var1,eax
		pop eax
		mov var2,eax
		pop eax
		add eax,var2
		add eax,var1
		call writeint

		.if eax==0
			mwrite<0ah,0dh,"As it is Singular Matrix So,solution Does not Exit",0ah,0dh,0>
			jmp LExit
		.else
			push eax

			mov esi,0
			mov eax,arr[esi+16]
			mov ebx,arr[esi+32]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+20]
			mov ebx,arr[esi+28]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			push eax

			;calculating 2nd Cofector
			mov eax,arr[esi+12]
			mov ebx,arr[esi+32]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+20]
			mov ebx,arr[esi+24]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			neg eax
			push eax

			;calculating 3rd Cofector
			mov eax,arr[esi+12]
			mov ebx,arr[esi+28]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+16]
			mov ebx,arr[esi+24]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			push eax

			;calculating 4rth Cofector
			mov eax,arr[esi+4]
			mov ebx,arr[esi+32]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+8]
	
			mov ebx,arr[esi+28]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			neg eax
			push eax

			;calculating 5rth Cofector
			mov eax,arr[esi]
			mov ebx,arr[esi+32]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+8]
			mov ebx,arr[esi+24]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			push eax

			;calculating 6th Cofector
			mov eax,arr[esi]
			mov ebx,arr[esi+28]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+4]
			mov ebx,arr[esi+24]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			neg eax
			push eax

			;calculating 7th Cofector
			mov eax,arr[esi+4]
			mov ebx,arr[esi+20]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+8]
			mov ebx,arr[esi+16]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			push eax

			;calculating 8th Cofector

			mov eax,arr[esi]
			mov ebx,arr[esi+20]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+8]
			mov ebx,arr[esi+12]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			neg eax
			push eax

			;calculating 9th Cofector
			mov eax,arr[esi]
			mov ebx,arr[esi+16]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+4]
			mov ebx,arr[esi+12]
			mul ebx
			mov var2,eax
			mov eax,var1
			sub eax,var2
			push eax

			mov esi,0
			mov ecx,9
			Lpop1:
				pop eax
				mov arr[esi],eax
				add esi,type arr
			loop Lpop1

			mov esi,0
			mov eax,arr[esi]
			xchg eax,arr[esi+32]
			mov arr[esi],eax
			mov esi,0
			mov eax,arr[esi+4]
			xchg eax,arr[esi+20]
			mov arr[esi+4],eax
			mov esi,0
			mov eax,arr[esi+12]
			xchg eax,arr[esi+28]
			mov arr[esi+12],eax

			pop var1

			mov esi,0
			mov ecx,9
			Lprint1:
				mov eax,arr[esi]
				mov edx,0
				div var1
				.if ecx==6 || ecx==3
				mwrite<" ",0ah,0dh,0>
				.endif
				mwrite<"	",0>
				add esi, type arr
			loop Lprint1

			mov esi,0
			mov eax,arr[esi]
			mov ebx,arr1[esi]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+4]
			mov ebx,arr1[esi+4]
			mul ebx
			mov var2,eax
			mov eax,arr[esi+8]
			mov ebx,arr1[esi+12]
			mul ebx
			add eax,var1
			add eax,var2
			push eax

			mov esi,0
			mov eax,arr[esi+12]
			mov ebx,arr1[esi]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+16]
			mov ebx,arr1[esi+4]
			mul ebx
			mov var2,eax
			mov eax,arr[esi+20]
			mov ebx,arr1[esi+8]
			mul ebx
			add eax,var1
			add eax,var2
			push eax

					
			mov esi,0
			mov eax,arr[esi+24]
			mov ebx,arr1[esi]
			mul ebx
			mov var1,eax
			mov eax,arr[esi+28]
			mov ebx,arr1[esi+4]
			mul ebx
			mov var2,eax
			mov eax,arr[esi+32]
			mov ebx,arr1[esi+8]
			mul ebx
			add eax,var1
			add eax,var2
			push eax

			
			mov esi,0
			mov ecx,3
			Lpop2:
				pop eax
				mov arr[esi],eax
				add esi,type arr
			loop Lpop2

			mov esi,8
			mov ecx,3
			Lprint2:
				mov eax,arr[esi]
				.if ecx==2 || ecx==1
				mwrite<"	",0ah,0dh,0>
				.endif
				mwrite<"	",0>
				call writeint
				sub esi,type arr
			loop Lprint2
		.endif
	LExit:
		ret
SystemOfLinearEquations endp
	
end main



