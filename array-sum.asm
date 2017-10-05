%macro get_jni_func 2
	mov rax, %1
	add rax, %2
	mov rax, [rax]
%endmacro

global Java_JNIArraySum_computeNativeArraySum

section .data

	; JNI function indexes can be found in the following documentation:
	; http://docs.oracle.com/javase/8/docs/technotes/guides/jni/spec/functions.html
	GetIntArrayElements: 		equ 187 * 8
	ReleaseIntArrayElements:	equ 195 * 8

section .text

Java_JNIArraySum_computeNativeArraySum:
	
	push rdx		; store Java array pointer
	push rdi		; store JNIEnv pointer
	push rcx		; store array length
	mov rsi, rdx		; set array parameter for GetIntArrayElements
	get_jni_func [rdi], GetIntArrayElements
	xor edx, edx		; set isCopy to false
	call rax
	pop rcx			; retrieve array length
	lea rcx, [rax + 4 * rcx]; compute address following last array element
	mov r8, rax		; copy native array pointer
	xor ebx, ebx		; sum variable
	add_element:
		movsx r9, dword [rax]	; get current element
		add rbx, r9		; add next element
		add rax, 4		; move array pointer to next element
		cmp rax, rcx		; check whether all array was processed
		jne add_element
	pop rdi			; retrieve JNIEnv
	pop rsi			; retrieve Java array pointer
	push rbx		; store sum result
	get_jni_func [rdi], ReleaseIntArrayElements
	mov rdx, r8		; set elems parameter for ReleaseIntArrayElements
	call rax
	pop rax			; retrieve sum result	
	ret
