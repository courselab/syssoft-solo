/*
 *    SPDX-FileCopyrightText: 2021 Monaco F. J. <monaco@usp.br>
 *    SPDX-FileCopyrightText: 2025 renan-calusa <renansscalusa@usp.br>
 *   
 *    SPDX-License-Identifier: GPL-3.0-or-later
 *
 *  This file is a derivative of SYSeg (https://gitlab.com/monaco/syseg)
 *  and includes modifications made by the following author(s):
 *  renan-calusa <renansscalusa@usp.br>
 */

#include <stdio.h>

int main(void)   
{
    unsigned short color = 5;

    set_border_color(color);

    printf("Hello World colored");

    return 0;
}


