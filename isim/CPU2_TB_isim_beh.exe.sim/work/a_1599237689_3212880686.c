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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/aula.ELE.000/Documents/System/trabalho-novo/PUC-ComputacaoDigital-Trabalho/CPU2.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1599237689_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(121, ng0);

LAB3:    t1 = (t0 + 5192U);
    t2 = *((char **)t1);
    t1 = (t0 + 10952);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 5U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 10792);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1599237689_3212880686_p_1(char *t0)
{
    char t3[16];
    char *t1;
    unsigned char t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(145, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 10808);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(146, ng0);
    t4 = (t0 + 3112U);
    t5 = *((char **)t4);
    t4 = (t0 + 20704U);
    t6 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t3, t5, t4, 1);
    t7 = (t3 + 12U);
    t8 = *((unsigned int *)t7);
    t9 = (1U * t8);
    t10 = (2U != t9);
    if (t10 == 1)
        goto LAB5;

LAB6:    t11 = (t0 + 11016);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 2U);
    xsi_driver_first_trans_fast(t11);
    goto LAB3;

LAB5:    xsi_size_not_matching(2U, t9, 0);
    goto LAB6;

}

static void work_a_1599237689_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(149, ng0);

LAB3:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t3 = (2 - 1);
    t4 = (t3 - 1);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t1 = (t2 + t7);
    t8 = *((unsigned char *)t1);
    t9 = (t0 + 11080);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t8;
    xsi_driver_first_trans_fast(t9);

LAB2:    t14 = (t0 + 10824);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1599237689_3212880686_p_3(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    int t13;
    int t14;
    int t15;
    int t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    char *t21;
    int t22;
    char *t23;
    int t24;
    char *t25;
    int t26;
    char *t27;
    int t28;
    char *t29;
    int t30;
    char *t31;
    int t32;
    char *t33;
    int t34;
    char *t35;
    int t36;
    char *t37;
    int t38;
    char *t39;
    int t40;
    char *t41;
    int t42;
    char *t43;
    int t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    unsigned int t50;
    static char *nl0[] = {&&LAB6, &&LAB7, &&LAB8, &&LAB9};

LAB0:    xsi_set_current_line(153, ng0);
    t1 = (t0 + 2912U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 10840);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(154, ng0);
    t3 = (t0 + 2792U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t3 = (char *)((nl0) + t5);
    goto **((char **)t3);

LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(156, ng0);
    t6 = (t0 + 11144);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(157, ng0);
    t1 = (t0 + 11208);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(158, ng0);
    t1 = (t0 + 11272);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB5;

LAB7:    xsi_set_current_line(160, ng0);
    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t1 = (t0 + 11336);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(161, ng0);
    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 11400);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(162, ng0);
    t1 = (t0 + 4712U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 11208);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(163, ng0);
    t1 = (t0 + 11272);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(164, ng0);
    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t1 = (t0 + 20848U);
    t11 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t4 = (t0 + 11464);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t11;
    xsi_driver_first_trans_fast(t4);
    goto LAB5;

LAB8:    xsi_set_current_line(166, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t1 = (t0 + 6088U);
    t4 = *((char **)t1);
    t11 = xsi_mem_cmp(t4, t3, 5U);
    if (t11 == 1)
        goto LAB11;

LAB21:    t1 = (t0 + 6208U);
    t6 = *((char **)t1);
    t12 = xsi_mem_cmp(t6, t3, 5U);
    if (t12 == 1)
        goto LAB12;

LAB22:    t1 = (t0 + 6328U);
    t7 = *((char **)t1);
    t13 = xsi_mem_cmp(t7, t3, 5U);
    if (t13 == 1)
        goto LAB13;

LAB23:    t1 = (t0 + 6448U);
    t8 = *((char **)t1);
    t14 = xsi_mem_cmp(t8, t3, 5U);
    if (t14 == 1)
        goto LAB14;

LAB24:    t1 = (t0 + 6568U);
    t9 = *((char **)t1);
    t15 = xsi_mem_cmp(t9, t3, 5U);
    if (t15 == 1)
        goto LAB15;

LAB25:    t1 = (t0 + 6688U);
    t10 = *((char **)t1);
    t16 = xsi_mem_cmp(t10, t3, 5U);
    if (t16 == 1)
        goto LAB15;

LAB26:    t1 = (t0 + 6808U);
    t17 = *((char **)t1);
    t18 = xsi_mem_cmp(t17, t3, 5U);
    if (t18 == 1)
        goto LAB15;

LAB27:    t1 = (t0 + 6928U);
    t19 = *((char **)t1);
    t20 = xsi_mem_cmp(t19, t3, 5U);
    if (t20 == 1)
        goto LAB15;

LAB28:    t1 = (t0 + 7048U);
    t21 = *((char **)t1);
    t22 = xsi_mem_cmp(t21, t3, 5U);
    if (t22 == 1)
        goto LAB15;

LAB29:    t1 = (t0 + 7168U);
    t23 = *((char **)t1);
    t24 = xsi_mem_cmp(t23, t3, 5U);
    if (t24 == 1)
        goto LAB15;

LAB30:    t1 = (t0 + 7288U);
    t25 = *((char **)t1);
    t26 = xsi_mem_cmp(t25, t3, 5U);
    if (t26 == 1)
        goto LAB15;

LAB31:    t1 = (t0 + 7888U);
    t27 = *((char **)t1);
    t28 = xsi_mem_cmp(t27, t3, 5U);
    if (t28 == 1)
        goto LAB15;

LAB32:    t1 = (t0 + 8008U);
    t29 = *((char **)t1);
    t30 = xsi_mem_cmp(t29, t3, 5U);
    if (t30 == 1)
        goto LAB15;

LAB33:    t1 = (t0 + 8128U);
    t31 = *((char **)t1);
    t32 = xsi_mem_cmp(t31, t3, 5U);
    if (t32 == 1)
        goto LAB15;

LAB34:    t1 = (t0 + 8248U);
    t33 = *((char **)t1);
    t34 = xsi_mem_cmp(t33, t3, 5U);
    if (t34 == 1)
        goto LAB15;

LAB35:    t1 = (t0 + 7408U);
    t35 = *((char **)t1);
    t36 = xsi_mem_cmp(t35, t3, 5U);
    if (t36 == 1)
        goto LAB16;

LAB36:    t1 = (t0 + 7528U);
    t37 = *((char **)t1);
    t38 = xsi_mem_cmp(t37, t3, 5U);
    if (t38 == 1)
        goto LAB17;

LAB37:    t1 = (t0 + 7768U);
    t39 = *((char **)t1);
    t40 = xsi_mem_cmp(t39, t3, 5U);
    if (t40 == 1)
        goto LAB18;

LAB38:    t1 = (t0 + 7648U);
    t41 = *((char **)t1);
    t42 = xsi_mem_cmp(t41, t3, 5U);
    if (t42 == 1)
        goto LAB19;

LAB39:
LAB20:    xsi_set_current_line(198, ng0);

LAB10:    xsi_set_current_line(201, ng0);
    t1 = (t0 + 11272);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB5;

LAB9:    xsi_set_current_line(204, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t1 = (t0 + 6088U);
    t4 = *((char **)t1);
    t11 = xsi_mem_cmp(t4, t3, 5U);
    if (t11 == 1)
        goto LAB42;

LAB53:    t1 = (t0 + 6208U);
    t6 = *((char **)t1);
    t12 = xsi_mem_cmp(t6, t3, 5U);
    if (t12 == 1)
        goto LAB43;

LAB54:    t1 = (t0 + 6328U);
    t7 = *((char **)t1);
    t13 = xsi_mem_cmp(t7, t3, 5U);
    if (t13 == 1)
        goto LAB44;

LAB55:    t1 = (t0 + 6448U);
    t8 = *((char **)t1);
    t14 = xsi_mem_cmp(t8, t3, 5U);
    if (t14 == 1)
        goto LAB45;

LAB56:    t1 = (t0 + 6568U);
    t9 = *((char **)t1);
    t15 = xsi_mem_cmp(t9, t3, 5U);
    if (t15 == 1)
        goto LAB46;

LAB57:    t1 = (t0 + 6688U);
    t10 = *((char **)t1);
    t16 = xsi_mem_cmp(t10, t3, 5U);
    if (t16 == 1)
        goto LAB46;

LAB58:    t1 = (t0 + 6808U);
    t17 = *((char **)t1);
    t18 = xsi_mem_cmp(t17, t3, 5U);
    if (t18 == 1)
        goto LAB46;

LAB59:    t1 = (t0 + 6928U);
    t19 = *((char **)t1);
    t20 = xsi_mem_cmp(t19, t3, 5U);
    if (t20 == 1)
        goto LAB46;

LAB60:    t1 = (t0 + 7048U);
    t21 = *((char **)t1);
    t22 = xsi_mem_cmp(t21, t3, 5U);
    if (t22 == 1)
        goto LAB46;

LAB61:    t1 = (t0 + 7168U);
    t23 = *((char **)t1);
    t24 = xsi_mem_cmp(t23, t3, 5U);
    if (t24 == 1)
        goto LAB46;

LAB62:    t1 = (t0 + 7288U);
    t25 = *((char **)t1);
    t26 = xsi_mem_cmp(t25, t3, 5U);
    if (t26 == 1)
        goto LAB46;

LAB63:    t1 = (t0 + 7888U);
    t27 = *((char **)t1);
    t28 = xsi_mem_cmp(t27, t3, 5U);
    if (t28 == 1)
        goto LAB46;

LAB64:    t1 = (t0 + 8128U);
    t29 = *((char **)t1);
    t30 = xsi_mem_cmp(t29, t3, 5U);
    if (t30 == 1)
        goto LAB46;

LAB65:    t1 = (t0 + 8008U);
    t31 = *((char **)t1);
    t32 = xsi_mem_cmp(t31, t3, 5U);
    if (t32 == 1)
        goto LAB47;

LAB66:    t1 = (t0 + 8248U);
    t33 = *((char **)t1);
    t34 = xsi_mem_cmp(t33, t3, 5U);
    if (t34 == 1)
        goto LAB47;

LAB67:    t1 = (t0 + 7408U);
    t35 = *((char **)t1);
    t36 = xsi_mem_cmp(t35, t3, 5U);
    if (t36 == 1)
        goto LAB48;

LAB68:    t1 = (t0 + 7528U);
    t37 = *((char **)t1);
    t38 = xsi_mem_cmp(t37, t3, 5U);
    if (t38 == 1)
        goto LAB49;

LAB69:    t1 = (t0 + 7768U);
    t39 = *((char **)t1);
    t40 = xsi_mem_cmp(t39, t3, 5U);
    if (t40 == 1)
        goto LAB50;

LAB70:    t1 = (t0 + 7648U);
    t41 = *((char **)t1);
    t42 = xsi_mem_cmp(t41, t3, 5U);
    if (t42 == 1)
        goto LAB51;

LAB71:
LAB52:    xsi_set_current_line(253, ng0);

LAB41:    xsi_set_current_line(256, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t1 = (t0 + 7648U);
    t4 = *((char **)t1);
    t2 = 1;
    if (5U == 5U)
        goto LAB82;

LAB83:    t2 = 0;

LAB84:    if ((!(t2)) != 0)
        goto LAB79;

LAB81:    xsi_set_current_line(259, ng0);
    t1 = (t0 + 11272);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB80:    goto LAB5;

LAB11:    xsi_set_current_line(168, ng0);
    t1 = (t0 + 5032U);
    t43 = *((char **)t1);
    t1 = (t0 + 20848U);
    t44 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t43, t1);
    t45 = (t0 + 11528);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    t48 = (t47 + 56U);
    t49 = *((char **)t48);
    *((int *)t49) = t44;
    xsi_driver_first_trans_fast(t45);
    xsi_set_current_line(169, ng0);
    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t1 = (t0 + 20848U);
    t11 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t4 = (t0 + 11208);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t11;
    xsi_driver_first_trans_fast(t4);
    goto LAB10;

LAB12:    xsi_set_current_line(172, ng0);
    t1 = (t0 + 11144);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(173, ng0);
    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t1 = (t0 + 20848U);
    t11 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t4 = (t0 + 11208);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t11;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(174, ng0);
    t1 = (t0 + 3752U);
    t3 = *((char **)t1);
    t1 = (t0 + 11592);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB13:    xsi_set_current_line(177, ng0);
    goto LAB10;

LAB14:    xsi_set_current_line(180, ng0);
    goto LAB10;

LAB15:    xsi_set_current_line(183, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t1 = (t0 + 11656);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB16:    xsi_set_current_line(186, ng0);
    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t1 = (t0 + 20848U);
    t11 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t4 = (t0 + 11528);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t11;
    xsi_driver_first_trans_fast(t4);
    goto LAB10;

LAB17:    xsi_set_current_line(189, ng0);
    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t1 = (t0 + 20848U);
    t11 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t4 = (t0 + 11528);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t11;
    xsi_driver_first_trans_fast(t4);
    goto LAB10;

LAB18:    xsi_set_current_line(192, ng0);
    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t1 = (t0 + 20848U);
    t11 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t4 = (t0 + 11528);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t11;
    xsi_driver_first_trans_fast(t4);
    goto LAB10;

LAB19:    xsi_set_current_line(195, ng0);
    goto LAB10;

LAB40:;
LAB42:    xsi_set_current_line(206, ng0);
    t1 = (t0 + 5032U);
    t43 = *((char **)t1);
    t1 = (t0 + 11720);
    t45 = (t1 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    memcpy(t48, t43, 5U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(207, ng0);
    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 11208);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(208, ng0);
    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 11400);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);
    goto LAB41;

LAB43:    xsi_set_current_line(211, ng0);
    t1 = (t0 + 11144);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(212, ng0);
    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 11208);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(213, ng0);
    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 11400);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);
    goto LAB41;

LAB44:    xsi_set_current_line(216, ng0);
    t1 = (t0 + 3912U);
    t3 = *((char **)t1);
    t1 = (t0 + 11720);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    goto LAB41;

LAB45:    xsi_set_current_line(219, ng0);
    t1 = (t0 + 3752U);
    t3 = *((char **)t1);
    t1 = (t0 + 11784);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    goto LAB41;

LAB46:    xsi_set_current_line(222, ng0);
    t1 = (t0 + 4072U);
    t3 = *((char **)t1);
    t1 = (t0 + 11720);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    goto LAB41;

LAB47:    xsi_set_current_line(225, ng0);
    t1 = (t0 + 4072U);
    t3 = *((char **)t1);
    t1 = (t0 + 11784);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 5U);
    xsi_driver_first_trans_fast(t1);
    goto LAB41;

LAB48:    xsi_set_current_line(228, ng0);
    t1 = (t0 + 5352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB73;

LAB75:    xsi_set_current_line(232, ng0);
    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 11208);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(233, ng0);
    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 11400);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);

LAB74:    goto LAB41;

LAB49:    xsi_set_current_line(237, ng0);
    t1 = (t0 + 5512U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB76;

LAB78:    xsi_set_current_line(241, ng0);
    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 11208);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(242, ng0);
    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 11400);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_fast(t1);

LAB77:    goto LAB41;

LAB50:    xsi_set_current_line(246, ng0);
    t1 = (t0 + 3432U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t1 = (t0 + 11208);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t11;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(247, ng0);
    t1 = (t0 + 3432U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t1 = (t0 + 11400);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t11;
    xsi_driver_first_trans_fast(t1);
    goto LAB41;

LAB51:    xsi_set_current_line(250, ng0);
    goto LAB41;

LAB72:;
LAB73:    xsi_set_current_line(229, ng0);
    t1 = (t0 + 3432U);
    t4 = *((char **)t1);
    t11 = *((int *)t4);
    t1 = (t0 + 11208);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t11;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(230, ng0);
    t1 = (t0 + 3432U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t1 = (t0 + 11400);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t11;
    xsi_driver_first_trans_fast(t1);
    goto LAB74;

LAB76:    xsi_set_current_line(238, ng0);
    t1 = (t0 + 3432U);
    t4 = *((char **)t1);
    t11 = *((int *)t4);
    t1 = (t0 + 11208);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t11;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(239, ng0);
    t1 = (t0 + 3432U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t1 = (t0 + 11400);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t11;
    xsi_driver_first_trans_fast(t1);
    goto LAB77;

LAB79:    xsi_set_current_line(257, ng0);
    t7 = (t0 + 11272);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t17 = *((char **)t10);
    *((unsigned char *)t17) = (unsigned char)1;
    xsi_driver_first_trans_fast(t7);
    goto LAB80;

LAB82:    t50 = 0;

LAB85:    if (t50 < 5U)
        goto LAB86;
    else
        goto LAB84;

LAB86:    t1 = (t3 + t50);
    t6 = (t4 + t50);
    if (*((unsigned char *)t1) != *((unsigned char *)t6))
        goto LAB83;

LAB87:    t50 = (t50 + 1);
    goto LAB85;

}

static void work_a_1599237689_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(265, ng0);

LAB3:    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11848);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 10856);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1599237689_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(266, ng0);

LAB3:    t1 = (t0 + 5512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11912);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 10872);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1599237689_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1599237689_3212880686_p_0,(void *)work_a_1599237689_3212880686_p_1,(void *)work_a_1599237689_3212880686_p_2,(void *)work_a_1599237689_3212880686_p_3,(void *)work_a_1599237689_3212880686_p_4,(void *)work_a_1599237689_3212880686_p_5};
	xsi_register_didat("work_a_1599237689_3212880686", "isim/CPU2_TB_isim_beh.exe.sim/work/a_1599237689_3212880686.didat");
	xsi_register_executes(pe);
}
