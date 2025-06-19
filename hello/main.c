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

void bcd_to_ascii(unsigned char bcd, char *str) {
    str[0] = '0' + ((bcd >> 4) & 0x0F);  // tens digit
    str[1] = '0' + (bcd & 0x0F);         // units digit
    str[2] = '\0';                       // null terminator
}


int main(void)   
{
    unsigned char century_bcd, year_bcd, month_bcd, day_bcd;
    char day_str[3], month_str[3], year_str[3], century_str[3];

    get_rtc_date(&century_bcd, &year_bcd, &month_bcd, &day_bcd);

    bcd_to_ascii(day_bcd, day_str);
    bcd_to_ascii(month_bcd, month_str);
    bcd_to_ascii(year_bcd, year_str);
    bcd_to_ascii(century_bcd, century_str);

    printf("Date: ");
    printf(day_str);
    printf("/");
    printf(month_str);
    printf("/");
    printf(century_str);
    printf(year_str);
    printf("END");

    return 0;
}


