#    SPDX-FileCopyrightText: 2025 renan-calusa <renansscalusa@usp.br>
#   
#    SPDX-License-Identifier: GPL-3.0-or-later
#
#  This file is a derivative of SYSeg (https://gitlab.com/monaco/syseg)
#  and includes modifications made by the following author(s):
#  renan-calusa <renansscalusa@usp.br>

	/* Suppose we receive the argument in %cx. */

	.code16gcc
	.global printf
    .global set_border_color

	.section .text

printf:
    mov   %cx, %bx          # copy pointer from CX to BX
    mov   $0x0e, %ah        # BIOS teletype function
    mov   $0x0, %si         # index into string
loop:
    mov   (%bx, %si), %al   # load char from string
    cmp   $0x0, %al         # end of string?
    je    end
    int   $0x10             # print character
    add   $0x1, %si         # next character
    jmp   loop
end:
    mov   %si, %ax          # return length printed
    ret


set_border_color:
    mov $0x0b, %ah       # Function: set border color
    mov $0x00, %bh       # Display page number
    mov %cl, %bl         # Border color (ex. 4 = red), fastcall argument in %cx, %cl = lower 8bit from %cx
    int $0x10            # Call BIOS video interrupt

    ret

