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
static const char *ng0 = "/home/ropumar/Documents/PUC-ComputacaoDigital-Trabalho/ALU.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_10420449594411817395_1035706684(char *, char *, int , int );
char *ieee_p_1242562249_sub_3525738511873186323_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_3525738511873258197_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_800139796931496790_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_800139796931568664_1035706684(char *, char *, char *, char *, int );
char *ieee_p_2592010699_sub_16439767405979520975_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_16439989832805790689_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_16439989833707593767_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_16447329934917513135_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_207919886985903570_503743352(char *, char *, char *, char *);


static void work_a_3670289347_3212880686_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(24, ng0);

LAB3:    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ieee_p_1242562249_sub_10420449594411817395_1035706684(IEEE_P_1242562249, t1, t4, 5);
    t5 = (t0 + 5040);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);

LAB2:    t10 = (t0 + 4896);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3670289347_3212880686_p_1(char *t0)
{
    char t30[16];
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
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned char t43;

LAB0:    t1 = (t0 + 3832U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t2 = (t0 + 7926);
    t5 = xsi_mem_cmp(t2, t3, 5U);
    if (t5 == 1)
        goto LAB5;

LAB15:    t6 = (t0 + 7931);
    t8 = xsi_mem_cmp(t6, t3, 5U);
    if (t8 == 1)
        goto LAB6;

LAB16:    t9 = (t0 + 7936);
    t11 = xsi_mem_cmp(t9, t3, 5U);
    if (t11 == 1)
        goto LAB7;

LAB17:    t12 = (t0 + 7941);
    t14 = xsi_mem_cmp(t12, t3, 5U);
    if (t14 == 1)
        goto LAB8;

LAB18:    t15 = (t0 + 7946);
    t17 = xsi_mem_cmp(t15, t3, 5U);
    if (t17 == 1)
        goto LAB9;

LAB19:    t18 = (t0 + 7951);
    t20 = xsi_mem_cmp(t18, t3, 5U);
    if (t20 == 1)
        goto LAB10;

LAB20:    t21 = (t0 + 7956);
    t23 = xsi_mem_cmp(t21, t3, 5U);
    if (t23 == 1)
        goto LAB11;

LAB21:    t24 = (t0 + 7961);
    t26 = xsi_mem_cmp(t24, t3, 5U);
    if (t26 == 1)
        goto LAB12;

LAB22:    t27 = (t0 + 7966);
    t29 = xsi_mem_cmp(t27, t3, 5U);
    if (t29 == 1)
        goto LAB13;

LAB23:
LAB14:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 7971);
    t4 = (t0 + 5104);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 5U);
    xsi_driver_first_trans_fast(t4);

LAB4:    xsi_set_current_line(27, ng0);

LAB37:    t2 = (t0 + 4912);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB38;

LAB1:    return;
LAB5:    xsi_set_current_line(28, ng0);
    t31 = (t0 + 1192U);
    t32 = *((char **)t31);
    t31 = (t0 + 7792U);
    t33 = (t0 + 1352U);
    t34 = *((char **)t33);
    t33 = (t0 + 7808U);
    t35 = ieee_p_1242562249_sub_3525738511873186323_1035706684(IEEE_P_1242562249, t30, t32, t31, t34, t33);
    t36 = (t0 + 5104);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t35, 5U);
    xsi_driver_first_trans_fast(t36);
    goto LAB4;

LAB6:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7792U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 7808U);
    t7 = ieee_p_1242562249_sub_3525738511873258197_1035706684(IEEE_P_1242562249, t30, t3, t2, t6, t4);
    t9 = (t0 + 5104);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    memcpy(t15, t7, 5U);
    xsi_driver_first_trans_fast(t9);
    goto LAB4;

LAB7:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7792U);
    t4 = ieee_p_1242562249_sub_800139796931496790_1035706684(IEEE_P_1242562249, t30, t3, t2, 1);
    t6 = (t0 + 5104);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    memcpy(t12, t4, 5U);
    xsi_driver_first_trans_fast(t6);
    goto LAB4;

LAB8:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7792U);
    t4 = ieee_p_1242562249_sub_800139796931568664_1035706684(IEEE_P_1242562249, t30, t3, t2, 1);
    t6 = (t0 + 5104);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    memcpy(t12, t4, 5U);
    xsi_driver_first_trans_fast(t6);
    goto LAB4;

LAB9:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7792U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 7808U);
    t7 = ieee_p_2592010699_sub_16439989832805790689_503743352(IEEE_P_2592010699, t30, t3, t2, t6, t4);
    t9 = (t30 + 12U);
    t41 = *((unsigned int *)t9);
    t42 = (1U * t41);
    t43 = (5U != t42);
    if (t43 == 1)
        goto LAB25;

LAB26:    t10 = (t0 + 5104);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 5U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB10:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7792U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 7808U);
    t7 = ieee_p_2592010699_sub_16439767405979520975_503743352(IEEE_P_2592010699, t30, t3, t2, t6, t4);
    t9 = (t30 + 12U);
    t41 = *((unsigned int *)t9);
    t42 = (1U * t41);
    t43 = (5U != t42);
    if (t43 == 1)
        goto LAB27;

LAB28:    t10 = (t0 + 5104);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 5U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB11:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7792U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 7808U);
    t7 = ieee_p_2592010699_sub_16447329934917513135_503743352(IEEE_P_2592010699, t30, t3, t2, t6, t4);
    t9 = (t30 + 12U);
    t41 = *((unsigned int *)t9);
    t42 = (1U * t41);
    t43 = (5U != t42);
    if (t43 == 1)
        goto LAB29;

LAB30:    t10 = (t0 + 5104);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 5U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB12:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7792U);
    t4 = (t0 + 1352U);
    t6 = *((char **)t4);
    t4 = (t0 + 7808U);
    t7 = ieee_p_2592010699_sub_16439989833707593767_503743352(IEEE_P_2592010699, t30, t3, t2, t6, t4);
    t9 = (t30 + 12U);
    t41 = *((unsigned int *)t9);
    t42 = (1U * t41);
    t43 = (5U != t42);
    if (t43 == 1)
        goto LAB31;

LAB32:    t10 = (t0 + 5104);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 5U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB13:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7792U);
    t4 = ieee_p_2592010699_sub_207919886985903570_503743352(IEEE_P_2592010699, t30, t3, t2);
    t6 = (t30 + 12U);
    t41 = *((unsigned int *)t6);
    t42 = (1U * t41);
    t43 = (5U != t42);
    if (t43 == 1)
        goto LAB33;

LAB34:    t7 = (t0 + 5104);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 5U);
    xsi_driver_first_trans_fast(t7);
    goto LAB4;

LAB24:;
LAB25:    xsi_size_not_matching(5U, t42, 0);
    goto LAB26;

LAB27:    xsi_size_not_matching(5U, t42, 0);
    goto LAB28;

LAB29:    xsi_size_not_matching(5U, t42, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(5U, t42, 0);
    goto LAB32;

LAB33:    xsi_size_not_matching(5U, t42, 0);
    goto LAB34;

LAB35:    t3 = (t0 + 4912);
    *((int *)t3) = 0;
    goto LAB2;

LAB36:    goto LAB35;

LAB38:    goto LAB36;

}

static void work_a_3670289347_3212880686_p_2(char *t0)
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
    char *t12;
    unsigned int t13;
    unsigned char t14;
    unsigned int t15;
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
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:    t9 = (t0 + 2152U);
    t10 = *((char **)t9);
    t9 = ieee_p_1242562249_sub_10420449594411817395_1035706684(IEEE_P_1242562249, t11, 0, 5);
    t12 = (t11 + 12U);
    t13 = *((unsigned int *)t12);
    t13 = (t13 * 1U);
    t14 = 1;
    if (5U == t13)
        goto LAB7;

LAB8:    t14 = 0;

LAB9:    if (t14 != 0)
        goto LAB5;

LAB6:
LAB13:    t23 = (t0 + 5168);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t23);

LAB2:    t28 = (t0 + 4928);
    *((int *)t28) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 5168);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB5:    t18 = (t0 + 5168);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t18);
    goto LAB2;

LAB7:    t15 = 0;

LAB10:    if (t15 < 5U)
        goto LAB11;
    else
        goto LAB9;

LAB11:    t16 = (t10 + t15);
    t17 = (t9 + t15);
    if (*((unsigned char *)t16) != *((unsigned char *)t17))
        goto LAB8;

LAB12:    t15 = (t15 + 1);
    goto LAB10;

LAB14:    goto LAB2;

}

static void work_a_3670289347_3212880686_p_3(char *t0)
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
    t17 = (t0 + 5232);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    *((unsigned char *)t21) = t16;
    xsi_driver_first_trans_fast_port(t17);

LAB2:    t22 = (t0 + 4944);
    *((int *)t22) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 5232);
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

static void work_a_3670289347_3212880686_p_4(char *t0)
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
    t1 = (t0 + 5296);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 5U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4960);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3670289347_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3670289347_3212880686_p_0,(void *)work_a_3670289347_3212880686_p_1,(void *)work_a_3670289347_3212880686_p_2,(void *)work_a_3670289347_3212880686_p_3,(void *)work_a_3670289347_3212880686_p_4};
	xsi_register_didat("work_a_3670289347_3212880686", "isim/TB_isim_beh.exe.sim/work/a_3670289347_3212880686.didat");
	xsi_register_executes(pe);
}
