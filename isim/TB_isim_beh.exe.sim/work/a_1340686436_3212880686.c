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
char *ieee_p_1242562249_sub_800139796931496790_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_800139796931568664_1035706684(char *, char *, char *, char *, int );
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

LAB0:    xsi_set_current_line(134, ng0);

LAB3:    t2 = (t0 + 3112U);
    t3 = *((char **)t2);
    t2 = (t0 + 22480U);
    t4 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t1, t3, t2, 1);
    t5 = (t1 + 12U);
    t6 = *((unsigned int *)t5);
    t7 = (1U * t6);
    t8 = (25U != t7);
    if (t8 == 1)
        goto LAB5;

LAB6:    t9 = (t0 + 12008);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 25U);
    xsi_driver_first_trans_fast(t9);

LAB2:    t14 = (t0 + 11832);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(25U, t7, 0);
    goto LAB6;

}

static void work_a_1340686436_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(135, ng0);

LAB3:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 + 1);
    t1 = (t0 + 12072);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t4;
    xsi_driver_first_trans_fast(t1);

LAB2:    t9 = (t0 + 11848);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1340686436_3212880686_p_2(char *t0)
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

LAB0:    xsi_set_current_line(136, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 22480U);
    t4 = ieee_p_1242562249_sub_10420449594411817395_1035706684(IEEE_P_1242562249, t3, 0, 25);
    t5 = ieee_p_1242562249_sub_1434214030532789707_1035706684(IEEE_P_1242562249, t2, t1, t4, t3);
    if (t5 != 0)
        goto LAB3;

LAB4:
LAB5:    t11 = (t0 + 12136);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_fast(t11);

LAB2:    t16 = (t0 + 11864);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t6 = (t0 + 12136);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t6);
    goto LAB2;

LAB6:    goto LAB2;

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
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    int t14;

LAB0:    xsi_set_current_line(160, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 11880);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(161, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(170, ng0);
    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t1 = (t0 + 12392);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 25U);
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(162, ng0);
    t3 = (t0 + 2792U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t8);
    t3 = (t0 + 12200);
    t10 = (t3 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t9;
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(163, ng0);
    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(166, ng0);
    t1 = (t0 + 3912U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 12264);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t2;
    xsi_driver_first_trans_fast(t1);

LAB9:    xsi_set_current_line(168, ng0);
    t1 = (t0 + 4232U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 12328);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = t14;
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

LAB8:    xsi_set_current_line(164, ng0);
    t1 = (t0 + 12264);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB9;

}

static void work_a_1340686436_3212880686_p_4(char *t0)
{
    char t49[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    int t14;
    int t15;
    int t16;
    int t17;
    int t18;
    int t19;
    int t20;
    int t21;
    char *t22;
    int t23;
    char *t24;
    int t25;
    char *t26;
    int t27;
    char *t28;
    int t29;
    char *t30;
    int t31;
    char *t32;
    int t33;
    char *t34;
    int t35;
    char *t36;
    int t37;
    char *t38;
    int t39;
    char *t40;
    int t41;
    char *t42;
    int t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    static char *nl0[] = {&&LAB9, &&LAB10, &&LAB11, &&LAB12, &&LAB14, &&LAB13};

LAB0:    xsi_set_current_line(176, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_13554554585326073636_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 11896);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(177, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(178, ng0);
    t3 = (t0 + 3752U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t3 = (char *)((nl0) + t8);
    goto **((char **)t3);

LAB8:    goto LAB6;

LAB9:    xsi_set_current_line(180, ng0);
    t9 = (t0 + 12456);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((int *)t13) = 0;
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(183, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB10:    xsi_set_current_line(187, ng0);
    t1 = (t0 + 3432U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 12584);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(188, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB11:    xsi_set_current_line(192, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 12456);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(193, ng0);
    t1 = (t0 + 5192U);
    t3 = *((char **)t1);
    t1 = (t0 + 22592U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t3, t1);
    t4 = (t0 + 12648);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = t14;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(194, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB12:    xsi_set_current_line(197, ng0);
    t1 = (t0 + 4072U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 6888U);
    t4 = *((char **)t1);
    t15 = *((int *)t4);
    if (t14 == t15)
        goto LAB17;

LAB36:    t1 = (t0 + 7008U);
    t7 = *((char **)t1);
    t16 = *((int *)t7);
    if (t14 == t16)
        goto LAB18;

LAB37:    t1 = (t0 + 7128U);
    t9 = *((char **)t1);
    t17 = *((int *)t9);
    if (t14 == t17)
        goto LAB19;

LAB38:    t1 = (t0 + 7248U);
    t10 = *((char **)t1);
    t18 = *((int *)t10);
    if (t14 == t18)
        goto LAB20;

LAB39:    t1 = (t0 + 7368U);
    t11 = *((char **)t1);
    t19 = *((int *)t11);
    if (t14 == t19)
        goto LAB21;

LAB40:    t1 = (t0 + 7488U);
    t12 = *((char **)t1);
    t20 = *((int *)t12);
    if (t14 == t20)
        goto LAB22;

LAB41:    t1 = (t0 + 7608U);
    t13 = *((char **)t1);
    t21 = *((int *)t13);
    if (t14 == t21)
        goto LAB23;

LAB42:    t1 = (t0 + 7728U);
    t22 = *((char **)t1);
    t23 = *((int *)t22);
    if (t14 == t23)
        goto LAB24;

LAB43:    t1 = (t0 + 7848U);
    t24 = *((char **)t1);
    t25 = *((int *)t24);
    if (t14 == t25)
        goto LAB25;

LAB44:    t1 = (t0 + 7968U);
    t26 = *((char **)t1);
    t27 = *((int *)t26);
    if (t14 == t27)
        goto LAB26;

LAB45:    t1 = (t0 + 8088U);
    t28 = *((char **)t1);
    t29 = *((int *)t28);
    if (t14 == t29)
        goto LAB27;

LAB46:    t1 = (t0 + 8328U);
    t30 = *((char **)t1);
    t31 = *((int *)t30);
    if (t14 == t31)
        goto LAB28;

LAB47:    t1 = (t0 + 8208U);
    t32 = *((char **)t1);
    t33 = *((int *)t32);
    if (t14 == t33)
        goto LAB29;

LAB48:    t1 = (t0 + 8448U);
    t34 = *((char **)t1);
    t35 = *((int *)t34);
    if (t14 == t35)
        goto LAB30;

LAB49:    t1 = (t0 + 8688U);
    t36 = *((char **)t1);
    t37 = *((int *)t36);
    if (t14 == t37)
        goto LAB31;

LAB50:    t1 = (t0 + 8808U);
    t38 = *((char **)t1);
    t39 = *((int *)t38);
    if (t14 == t39)
        goto LAB32;

LAB51:    t1 = (t0 + 8928U);
    t40 = *((char **)t1);
    t41 = *((int *)t40);
    if (t14 == t41)
        goto LAB33;

LAB52:    t1 = (t0 + 9048U);
    t42 = *((char **)t1);
    t43 = *((int *)t42);
    if (t14 == t43)
        goto LAB34;

LAB53:
LAB35:    xsi_set_current_line(279, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB16:    goto LAB8;

LAB13:    xsi_set_current_line(283, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB14:    xsi_set_current_line(286, ng0);
    t1 = (t0 + 4712U);
    t3 = *((char **)t1);
    t1 = (t0 + 12904);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(287, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB15:    xsi_set_current_line(289, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB17:    xsi_set_current_line(199, ng0);
    t1 = (t0 + 6472U);
    t44 = *((char **)t1);
    t2 = *((unsigned char *)t44);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB55;

LAB57:    xsi_set_current_line(205, ng0);
    t1 = (t0 + 12712);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(206, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB56:    xsi_set_current_line(208, ng0);
    t1 = (t0 + 6472U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t2);
    t1 = (t0 + 12840);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t5;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB18:    xsi_set_current_line(211, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 12456);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(212, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB19:    xsi_set_current_line(214, ng0);
    t1 = (t0 + 4552U);
    t3 = *((char **)t1);
    t1 = (t0 + 12904);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(215, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(216, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 12456);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB20:    xsi_set_current_line(218, ng0);
    t1 = (t0 + 4392U);
    t3 = *((char **)t1);
    t1 = (t0 + 12968);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(219, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(220, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 12456);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB21:    xsi_set_current_line(222, ng0);
    t1 = (t0 + 7368U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 13032);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(223, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB22:    xsi_set_current_line(225, ng0);
    t1 = (t0 + 7488U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 13032);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(226, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB23:    xsi_set_current_line(228, ng0);
    t1 = (t0 + 7608U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 13032);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(229, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB24:    xsi_set_current_line(231, ng0);
    t1 = (t0 + 7728U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 13032);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(232, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB25:    xsi_set_current_line(234, ng0);
    t1 = (t0 + 7848U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 13032);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(235, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB26:    xsi_set_current_line(237, ng0);
    t1 = (t0 + 7968U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 13032);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(238, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB27:    xsi_set_current_line(240, ng0);
    t1 = (t0 + 8088U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 13032);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(241, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB28:    xsi_set_current_line(243, ng0);
    t1 = (t0 + 6472U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB58;

LAB60:    xsi_set_current_line(246, ng0);
    t1 = (t0 + 6152U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB61;

LAB63:    xsi_set_current_line(249, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 12456);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);

LAB62:    xsi_set_current_line(251, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB59:    goto LAB16;

LAB29:    xsi_set_current_line(254, ng0);
    t1 = (t0 + 6472U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB64;

LAB66:    xsi_set_current_line(257, ng0);
    t1 = (t0 + 5992U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB67;

LAB69:    xsi_set_current_line(260, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 12456);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);

LAB68:    xsi_set_current_line(262, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB65:    goto LAB16;

LAB30:    xsi_set_current_line(265, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB31:    xsi_set_current_line(267, ng0);
    t1 = (t0 + 4392U);
    t3 = *((char **)t1);
    t1 = (t0 + 22544U);
    t4 = ieee_p_1242562249_sub_800139796931496790_1035706684(IEEE_P_1242562249, t49, t3, t1, 1);
    t7 = (t0 + 12904);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 5U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(268, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB32:    xsi_set_current_line(270, ng0);
    t1 = (t0 + 4552U);
    t3 = *((char **)t1);
    t1 = (t0 + 22544U);
    t4 = ieee_p_1242562249_sub_800139796931496790_1035706684(IEEE_P_1242562249, t49, t3, t1, 1);
    t7 = (t0 + 12968);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 5U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(271, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB33:    xsi_set_current_line(273, ng0);
    t1 = (t0 + 4392U);
    t3 = *((char **)t1);
    t1 = (t0 + 22544U);
    t4 = ieee_p_1242562249_sub_800139796931568664_1035706684(IEEE_P_1242562249, t49, t3, t1, 1);
    t7 = (t0 + 12904);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 5U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(274, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB34:    xsi_set_current_line(276, ng0);
    t1 = (t0 + 4552U);
    t3 = *((char **)t1);
    t1 = (t0 + 22544U);
    t4 = ieee_p_1242562249_sub_800139796931568664_1035706684(IEEE_P_1242562249, t49, t3, t1, 1);
    t7 = (t0 + 12968);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 5U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(277, ng0);
    t1 = (t0 + 12520);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB16;

LAB54:;
LAB55:    xsi_set_current_line(200, ng0);
    t1 = (t0 + 12712);
    t45 = (t1 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    *((unsigned char *)t48) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(201, ng0);
    t1 = (t0 + 4392U);
    t3 = *((char **)t1);
    t1 = (t0 + 12776);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(202, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t14 = *((int *)t3);
    t1 = (t0 + 12456);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = t14;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(203, ng0);
    t1 = (t0 + 5192U);
    t3 = *((char **)t1);
    t1 = (t0 + 22592U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t3, t1);
    t4 = (t0 + 12648);
    t7 = (t4 + 56U);
    t9 = *((char **)t7);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = t14;
    xsi_driver_first_trans_fast(t4);
    goto LAB56;

LAB58:    xsi_set_current_line(244, ng0);
    t1 = (t0 + 12840);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB59;

LAB61:    xsi_set_current_line(247, ng0);
    t1 = (t0 + 5672U);
    t4 = *((char **)t1);
    t14 = *((int *)t4);
    t1 = (t0 + 12456);
    t7 = (t1 + 56U);
    t9 = *((char **)t7);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = t14;
    xsi_driver_first_trans_fast(t1);
    goto LAB62;

LAB64:    xsi_set_current_line(255, ng0);
    t1 = (t0 + 12840);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB65;

LAB67:    xsi_set_current_line(258, ng0);
    t1 = (t0 + 5672U);
    t4 = *((char **)t1);
    t14 = *((int *)t4);
    t1 = (t0 + 12456);
    t7 = (t1 + 56U);
    t9 = *((char **)t7);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = t14;
    xsi_driver_first_trans_fast(t1);
    goto LAB68;

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

LAB0:    xsi_set_current_line(294, ng0);

LAB3:    t1 = (t0 + 5992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 13096);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 11912);
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

LAB0:    xsi_set_current_line(295, ng0);

LAB3:    t1 = (t0 + 6152U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 13160);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 11928);
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
