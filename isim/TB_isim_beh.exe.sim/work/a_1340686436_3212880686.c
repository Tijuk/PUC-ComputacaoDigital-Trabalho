/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ropumar/Documents/PUC-ComputacaoDigital-Trabalho/CPU.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_10420449594411817395_1035706684(char *, char *, int , int );
unsigned char ieee_p_1242562249_sub_1434214030532789707_1035706684(char *, char *, char *, char *, char *);
int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_13554554585326073636_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );


static void work_a_1340686436_3212880686_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(172, ng0);

LAB3:    t2 = (t0 + 3272U);
    t3 = *((char **)t2);
    t2 = (t0 + 17328U);
    t4 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t1, t3, t2, 1);
    t5 = (t1 + 12U);
    t6 = *((unsigned int *)t5);
    t7 = (1U * t6);
    t8 = (25U != t7);
    if (t8 == 1)
        goto LAB5;

LAB6:    t9 = (t0 + 9728);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 25U);
    xsi_driver_first_trans_fast(t9);

LAB2:    t14 = (t0 + 9552);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(25U, t7, 0);
    goto LAB6;

}

static void work_a_1340686436_3212880686_p_1(char *t0)
{
    char t3[16];
    char *t1;
    char *t2;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(173, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t1 = (t0 + 17328U);
    t4 = ieee_p_1242562249_sub_10420449594411817395_1035706684(IEEE_P_1242562249, t3, 0, 25);
    t5 = ieee_p_1242562249_sub_1434214030532789707_1035706684(IEEE_P_1242562249, t2, t1, t4, t3);
    if (t5 != 0)
        goto LAB3;

LAB4:
LAB5:    t11 = (t0 + 9792);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_fast(t11);

LAB2:    t16 = (t0 + 9568);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t6 = (t0 + 9792);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t6);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_1340686436_3212880686_p_2(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(197, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 9584);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(198, ng0);
    t3 = (t0 + 3112U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(206, ng0);
    t1 = (t0 + 3432U);
    t3 = *((char **)t1);
    t1 = (t0 + 9984);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 25U);
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(199, ng0);
    t3 = (t0 + 2952U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t8);
    t3 = (t0 + 9856);
    t10 = (t3 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t9;
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(200, ng0);
    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(203, ng0);
    t1 = (t0 + 3912U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 9920);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t2;
    xsi_driver_first_trans_fast(t1);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(201, ng0);
    t1 = (t0 + 9920);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB9;

}

static void work_a_1340686436_3212880686_p_3(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    static char *nl0[] = {&&LAB9, &&LAB10, &&LAB11, &&LAB12, &&LAB13, &&LAB14, &&LAB15, &&LAB16, &&LAB17, &&LAB18, &&LAB19, &&LAB20, &&LAB21, &&LAB22, &&LAB24, &&LAB23, &&LAB29, &&LAB32, &&LAB25, &&LAB26, &&LAB27, &&LAB28, &&LAB30, &&LAB31};

LAB0:    xsi_set_current_line(212, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_13554554585326073636_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 9600);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(213, ng0);
    t3 = (t0 + 3112U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(214, ng0);
    t3 = (t0 + 10048);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(215, ng0);
    t1 = (t0 + 10112);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(216, ng0);
    t1 = (t0 + 3752U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (char *)((nl0) + t2);
    goto **((char **)t1);

LAB8:    goto LAB6;

LAB9:    xsi_set_current_line(218, ng0);
    t4 = (t0 + 10176);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = 0;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(219, ng0);
    t1 = (t0 + 17660);
    t4 = (t0 + 10240);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 5U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(220, ng0);
    t1 = (t0 + 17665);
    t4 = (t0 + 10304);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 5U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(221, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB10:    xsi_set_current_line(224, ng0);
    t1 = (t0 + 10112);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(225, ng0);
    t1 = (t0 + 5192U);
    t3 = *((char **)t1);
    t1 = (t0 + 17424U);
    t11 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t3, t1);
    t4 = (t0 + 10432);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t11;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(226, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t1 = (t0 + 10496);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t11;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(227, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB11:    xsi_set_current_line(230, ng0);
    t1 = (t0 + 2792U);
    t3 = *((char **)t1);
    t1 = (t0 + 4072U);
    t4 = *((char **)t1);
    t11 = *((int *)t4);
    t12 = (t11 - 1);
    t13 = (t12 * 1);
    xsi_vhdl_check_range_of_index(1, 19, 1, t11);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t3 + t15);
    t2 = *((unsigned char *)t1);
    t7 = (t0 + 10368);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t16 = *((char **)t10);
    *((unsigned char *)t16) = t2;
    xsi_driver_first_trans_fast(t7);
    goto LAB8;

LAB12:    xsi_set_current_line(232, ng0);
    t1 = (t0 + 6472U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB33;

LAB35:    xsi_set_current_line(235, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(236, ng0);
    t1 = (t0 + 5192U);
    t3 = *((char **)t1);
    t1 = (t0 + 10240);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 5U);
    xsi_driver_first_trans_fast(t1);

LAB34:    xsi_set_current_line(238, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 10176);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t12;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB13:    xsi_set_current_line(240, ng0);
    t1 = (t0 + 6472U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB36;

LAB38:    xsi_set_current_line(243, ng0);
    t1 = (t0 + 10112);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(244, ng0);
    t1 = (t0 + 4392U);
    t3 = *((char **)t1);
    t1 = (t0 + 10560);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(245, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB37:    xsi_set_current_line(247, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 10176);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t12;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB14:    xsi_set_current_line(249, ng0);
    t1 = (t0 + 4552U);
    t3 = *((char **)t1);
    t1 = (t0 + 10240);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(250, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(251, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 10176);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t12;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB15:    xsi_set_current_line(253, ng0);
    t1 = (t0 + 4392U);
    t3 = *((char **)t1);
    t1 = (t0 + 10304);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(254, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(255, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 10176);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t12;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB16:    xsi_set_current_line(257, ng0);
    t1 = (t0 + 10624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 5;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(258, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)22;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB17:    xsi_set_current_line(260, ng0);
    t1 = (t0 + 10624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 6;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(261, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)22;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB18:    xsi_set_current_line(263, ng0);
    t1 = (t0 + 10624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 7;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(264, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)22;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB19:    xsi_set_current_line(266, ng0);
    t1 = (t0 + 10624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(267, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)22;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB20:    xsi_set_current_line(269, ng0);
    t1 = (t0 + 10624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 9;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(270, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)22;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB21:    xsi_set_current_line(272, ng0);
    t1 = (t0 + 10624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 10;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(273, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)22;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB22:    xsi_set_current_line(275, ng0);
    t1 = (t0 + 10624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 11;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(276, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)22;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB23:    xsi_set_current_line(278, ng0);
    t1 = (t0 + 6472U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB39;

LAB41:    xsi_set_current_line(282, ng0);
    t1 = (t0 + 6152U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB42;

LAB44:    xsi_set_current_line(285, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 10176);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t12;
    xsi_driver_first_trans_fast(t1);

LAB43:    xsi_set_current_line(287, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB40:    goto LAB8;

LAB24:    xsi_set_current_line(290, ng0);
    t1 = (t0 + 6472U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB45;

LAB47:    xsi_set_current_line(293, ng0);
    t1 = (t0 + 5992U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB48;

LAB50:    xsi_set_current_line(296, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 10176);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t12;
    xsi_driver_first_trans_fast(t1);

LAB49:    xsi_set_current_line(298, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB46:    goto LAB8;

LAB25:    xsi_set_current_line(301, ng0);
    t1 = (t0 + 10624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 16;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(302, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)22;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(303, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB26:    xsi_set_current_line(305, ng0);
    t1 = (t0 + 10624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 17;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(306, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)23;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(307, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB27:    xsi_set_current_line(309, ng0);
    t1 = (t0 + 10624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 18;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(310, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)22;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(311, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB28:    xsi_set_current_line(313, ng0);
    t1 = (t0 + 10624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 19;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(314, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)23;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(315, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB29:    xsi_set_current_line(317, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)16;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB30:    xsi_set_current_line(319, ng0);
    t1 = (t0 + 4712U);
    t3 = *((char **)t1);
    t1 = (t0 + 10240);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(320, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 10176);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t12;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(321, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB31:    xsi_set_current_line(323, ng0);
    t1 = (t0 + 4712U);
    t3 = *((char **)t1);
    t1 = (t0 + 10304);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(324, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 10176);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t12;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(325, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB32:    xsi_set_current_line(327, ng0);
    t1 = (t0 + 10368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB33:    xsi_set_current_line(233, ng0);
    t1 = (t0 + 10048);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB34;

LAB36:    xsi_set_current_line(241, ng0);
    t1 = (t0 + 10048);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB37;

LAB39:    xsi_set_current_line(279, ng0);
    t1 = (t0 + 10048);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(280, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 10176);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t12;
    xsi_driver_first_trans_fast(t1);
    goto LAB40;

LAB42:    xsi_set_current_line(283, ng0);
    t1 = (t0 + 4232U);
    t4 = *((char **)t1);
    t11 = *((int *)t4);
    t1 = (t0 + 10176);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t11;
    xsi_driver_first_trans_fast(t1);
    goto LAB43;

LAB45:    xsi_set_current_line(291, ng0);
    t1 = (t0 + 10048);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB46;

LAB48:    xsi_set_current_line(294, ng0);
    t1 = (t0 + 4232U);
    t4 = *((char **)t1);
    t11 = *((int *)t4);
    t1 = (t0 + 10176);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t11;
    xsi_driver_first_trans_fast(t1);
    goto LAB49;

}

static void work_a_1340686436_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(335, ng0);
    t1 = (t0 + 6472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 9616);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(336, ng0);
    t1 = (t0 + 5192U);
    t5 = *((char **)t1);
    t1 = (t0 + 17424U);
    t6 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t5, t1);
    t7 = (t0 + 10688);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = t6;
    xsi_driver_first_trans_fast(t7);
    goto LAB3;

}

static void work_a_1340686436_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(340, ng0);

LAB3:    t1 = (t0 + 5992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 10752);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 9632);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1340686436_3212880686_p_6(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(341, ng0);

LAB3:    t1 = (t0 + 6152U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 10816);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 9648);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1340686436_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1340686436_3212880686_p_0,(void *)work_a_1340686436_3212880686_p_1,(void *)work_a_1340686436_3212880686_p_2,(void *)work_a_1340686436_3212880686_p_3,(void *)work_a_1340686436_3212880686_p_4,(void *)work_a_1340686436_3212880686_p_5,(void *)work_a_1340686436_3212880686_p_6};
	xsi_register_didat("work_a_1340686436_3212880686", "isim/TB_isim_beh.exe.sim/work/a_1340686436_3212880686.didat");
	xsi_register_executes(pe);
}
