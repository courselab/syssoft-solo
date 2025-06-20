/*
 *    SPDX-FileCopyrightText: 2025 renan-calusa <renansscalusa@usp.br>
 *   
 *    SPDX-License-Identifier: GPL-3.0-or-later
 *
 *  This file is a derivative of SYSeg (https://gitlab.com/monaco/syseg)
 *  and includes modifications made by the following author(s):
 *  renan-calusa <renansscalusa@usp.br>
 */

#ifndef E8_H
#define E8_H

void __attribute__((fastcall, naked)) printf(const char *); 
void __attribute__((fastcall, naked)) set_border_color(unsigned short color);

#endif	
