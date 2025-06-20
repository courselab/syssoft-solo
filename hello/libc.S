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
    .global get_rtc_date

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


get_rtc_date:
    push %bp
    mov %sp, %bp

    mov $0x04, %ah         # BIOS function 0x1A / AH=04h (Get date)
    int $0x1A              # BIOS service 1 interruption
                           # CH = century, CL = year, DH = month, DL = day (in BCD 8bit)

    mov 4(%bp), %bx        # load pointer to century
    mov %ch, (%bx)         # store CH at *century

    mov 6(%bp), %bx        # load pointer to year
    mov %cl, (%bx)         # store CL at *year

    mov 8(%bp), %bx        # load pointer to month
    mov %dh, (%bx)         # store DH at *month

    mov 10(%bp), %bx       # load pointer to day
    mov %dl, (%bx)         # store DL at *day

    pop %bp
    ret

# Stack layout
#  0(%bp)   → old bp
#  2(%bp)   → return address
#  4(%bp)   → *century
#  6(%bp)   → *year
#  8(%bp)   → *month
# 10(%bp)   → *day
