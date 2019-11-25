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
static const char *ng0 = "C:/Users/aula.ELE.000/Documents/System/trabalho-novo/PUC-ComputacaoDigital-Trabalho/ALU.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
char *ieee_p_1242562249_sub_2931903318_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2931975192_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_3273497107_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_3273568981_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
char *ieee_p_2592010699_sub_3798478767_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);


static void work_a_3670289347_3212880686_p_0(char *t0)
{
    char t36[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    int t11;
    char *t12;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    int t17;
    char *t18;
    int t20;
    char *t21;
    int t23;
    char *t24;
    int t26;
    char *t27;
    int t29;
    char *t30;
    int t32;
    char *t33;
    int t35;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned char t49;

LAB0:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 7669);
    t5 = xsi_mem_cmp(t2, t3, 5U);
    if (t5 == 1)
        goto LAB5;

LAB17:    t6 = (t0 + 7674);
    t8 = xsi_mem_cmp(t6, t3, 5U);
    if (t8 == 1)
        goto LAB6;

LAB18:    t9 = (t0 + 7679);
    t11 = xsi_mem_cmp(t9, t3, 5U);
    if (t11 == 1)
        goto LAB7;

LAB19:    t12 = (t0 + 7684);
    t14 = xsi_mem_cmp(t12, t3, 5U);
    if (t14 == 1)
        goto LAB8;

LAB20:    t15 = (t0 + 7689);
    t17 = xsi_mem_cmp(t15, t3, 5U);
    if (t17 == 1)
        goto LAB9;

LAB21:    t18 = (t0 + 7694);
    t20 = xsi_mem_cmp(t18, t3, 5U);
    if (t20 == 1)
        goto LAB10;

LAB22:    t21 = (t0 + 7699);
    t23 = xsi_mem_cmp(t21, t3, 5U);
    if (t23 == 1)
        goto LAB11;

LAB23:    t24 = (t0 + 7704);
    t26 = xsi_mem_cmp(t24, t3, 5U);
    if (t26 == 1)
        goto LAB12;

LAB24:    t27 = (t0 + 7709);
    t29 = xsi_mem_cmp(t27, t3, 5U);
    if (t29 == 1)
        goto LAB13;

LAB25:    t30 = (t0 + 7714);
    t32 = xsi_mem_cmp(t30, t3, 5U);
    if (t32 == 1)
        goto LAB14;

LAB26:    t33 = (t0 + 7719);
    t35 = xsi_mem_cmp(t33, t3, 5U);
    if (t35 == 1)
        goto LAB15;

LAB27:
LAB16:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 7724);
    t4 = (t0 + 4624);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 5U);
    xsi_driver_first_trans_fast(t4);

LAB4:    xsi_set_current_line(25, ng0);

LAB41:    t2 = (t0 + 4496);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB42;

LAB1:    return;
LAB5:    xsi_set_current_line(26, ng0);
    t37 = (t0 + 1192U);
    t38 = *((char **)t37);
    t37 = (t0 + 7556U);
    t39 = (t0 + 1352U);
    t40 = *((char **)t39);
    t39 = (t0 + 7572U);
    t41 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t36, t38, t37, t40, t39);
    t42 = (t0 + 4624);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    memcpy(t46, t41, 5U);
    xsi_driver_first_trans_fast(t42);
    goto LAB4;

LAB6:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7556U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 7572U);
    t7 = ieee_p_1242562249_sub_3273568981_1035706684(IEEE_P_1242562249, t36, t3, t2, t6, t4);
    t9 = (t0 + 4624);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    memcpy(t15, t7, 5U);
    xsi_driver_first_trans_fast(t9);
    goto LAB4;

LAB7:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7556U);
    t4 = ieee_p_1242562249_sub_2931903318_1035706684(IEEE_P_1242562249, t36, t3, t2, 1);
    t6 = (t0 + 4624);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    memcpy(t12, t4, 5U);
    xsi_driver_first_trans_fast(t6);
    goto LAB4;

LAB8:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7556U);
    t4 = ieee_p_1242562249_sub_2931975192_1035706684(IEEE_P_1242562249, t36, t3, t2, 1);
    t6 = (t0 + 4624);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    memcpy(t12, t4, 5U);
    xsi_driver_first_trans_fast(t6);
    goto LAB4;

LAB9:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 7572U);
    t4 = ieee_p_1242562249_sub_2931903318_1035706684(IEEE_P_1242562249, t36, t3, t2, 1);
    t6 = (t0 + 4624);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    memcpy(t12, t4, 5U);
    xsi_driver_first_trans_fast(t6);
    goto LAB4;

LAB10:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 7572U);
    t4 = ieee_p_1242562249_sub_2931975192_1035706684(IEEE_P_1242562249, t36, t3, t2, 1);
    t6 = (t0 + 4624);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    memcpy(t12, t4, 5U);
    xsi_driver_first_trans_fast(t6);
    goto LAB4;

LAB11:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7556U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 7572U);
    t7 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t36, t3, t2, t6, t4);
    t9 = (t36 + 12U);
    t47 = *((unsigned int *)t9);
    t48 = (1U * t47);
    t49 = (5U != t48);
    if (t49 == 1)
        goto LAB29;

LAB30:    t10 = (t0 + 4624);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 5U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB12:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7556U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 7572U);
    t7 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t36, t3, t2, t6, t4);
    t9 = (t36 + 12U);
    t47 = *((unsigned int *)t9);
    t48 = (1U * t47);
    t49 = (5U != t48);
    if (t49 == 1)
        goto LAB31;

LAB32:    t10 = (t0 + 4624);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 5U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB13:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7556U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 7572U);
    t7 = ieee_p_2592010699_sub_3798478767_503743352(IEEE_P_2592010699, t36, t3, t2, t6, t4);
    t9 = (t36 + 12U);
    t47 = *((unsigned int *)t9);
    t48 = (1U * t47);
    t49 = (5U != t48);
    if (t49 == 1)
        goto LAB33;

LAB34:    t10 = (t0 + 4624);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 5U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB14:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7556U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 7572U);
    t7 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t36, t3, t2, t6, t4);
    t9 = (t36 + 12U);
    t47 = *((unsigned int *)t9);
    t48 = (1U * t47);
    t49 = (5U != t48);
    if (t49 == 1)
        goto LAB35;

LAB36:    t10 = (t0 + 4624);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 5U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB15:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7556U);
    t4 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t36, t3, t2);
    t6 = (t36 + 12U);
    t47 = *((unsigned int *)t6);
    t48 = (1U * t47);
    t49 = (5U != t48);
    if (t49 == 1)
        goto LAB37;

LAB38:    t7 = (t0 + 4624);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 5U);
    xsi_driver_first_trans_fast(t7);
    goto LAB4;

LAB28:;
LAB29:    xsi_size_not_matching(5U, t48, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(5U, t48, 0);
    goto LAB32;

LAB33:    xsi_size_not_matching(5U, t48, 0);
    goto LAB34;

LAB35:    xsi_size_not_matching(5U, t48, 0);
    goto LAB36;

LAB37:    xsi_size_not_matching(5U, t48, 0);
    goto LAB38;

LAB39:    t3 = (t0 + 4496);
    *((int *)t3) = 0;
    goto LAB2;

LAB40:    goto LAB39;

LAB42:    goto LAB40;

}

static void work_a_3670289347_3212880686_p_1(char *t0)
{
    char t11[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:    t9 = (t0 + 2152U);
    t10 = *((char **)t9);
    t9 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t11, 0, 5);
    t12 = 1;
    if (5U == 5U)
        goto LAB7;

LAB8:    t12 = 0;

LAB9:    if (t12 != 0)
        goto LAB5;

LAB6:
LAB13:    t21 = (t0 + 4688);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    *((unsigned char *)t25) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t21);

LAB2:    t26 = (t0 + 4512);
    *((int *)t26) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 4688);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB5:    t16 = (t0 + 4688);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t16);
    goto LAB2;

LAB7:    t13 = 0;

LAB10:    if (t13 < 5U)
        goto LAB11;
    else
        goto LAB9;

LAB11:    t14 = (t10 + t13);
    t15 = (t9 + t13);
    if (*((unsigned char *)t14) != *((unsigned char *)t15))
        goto LAB8;

LAB12:    t13 = (t13 + 1);
    goto LAB10;

LAB14:    goto LAB2;

}

static void work_a_3670289347_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t9 = (t0 + 2152U);
    t10 = *((char **)t9);
    if (4 > 0)
        goto LAB7;

LAB8:    if (-1 == -1)
        goto LAB12;

LAB13:    t11 = 0;

LAB9:    t12 = (t11 - 4);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t9 = (t10 + t15);
    t16 = *((unsigned char *)t9);
    t17 = (t0 + 4752);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = t16;
    xsi_driver_first_trans_fast_port(t17);

LAB2:    t22 = (t0 + 4528);
    *((int *)t22) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 4752);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    goto LAB2;

LAB7:    if (-1 == 1)
        goto LAB10;

LAB11:    t11 = 4;
    goto LAB9;

LAB10:    t11 = 0;
    goto LAB9;

LAB12:    t11 = 4;
    goto LAB9;

}

static void work_a_3670289347_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(50, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 4816);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 5U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4544);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3670289347_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3670289347_3212880686_p_0,(void *)work_a_3670289347_3212880686_p_1,(void *)work_a_3670289347_3212880686_p_2,(void *)work_a_3670289347_3212880686_p_3};
	xsi_register_didat("work_a_3670289347_3212880686", "isim/CPU2_TB_isim_beh.exe.sim/work/a_3670289347_3212880686.didat");
	xsi_register_executes(pe);
}
