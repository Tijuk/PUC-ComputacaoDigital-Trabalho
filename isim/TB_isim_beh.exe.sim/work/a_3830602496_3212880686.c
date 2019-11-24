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
static const char *ng0 = "/home/ropumar/Documents/PUC-ComputacaoDigital-Trabalho/RAM.vhd";



static void work_a_3830602496_3212880686_p_0(char *t0)
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
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t9 = (t0 + 1512U);
    t10 = *((char **)t9);
    t11 = *((int *)t10);
    t9 = (t0 + 4976);
    t12 = (t9 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((int *)t15) = t11;
    xsi_driver_first_trans_fast(t9);

LAB2:    t16 = (t0 + 4848);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 4976);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3830602496_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;

LAB0:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t16 = (t0 + 2312U);
    t17 = *((char **)t16);
    t16 = (t0 + 2632U);
    t18 = *((char **)t16);
    t19 = *((int *)t18);
    t20 = (t19 - 0);
    t21 = (t20 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t19);
    t22 = (5U * t21);
    t23 = (0 + t22);
    t16 = (t17 + t23);
    t24 = (t0 + 1672U);
    t25 = *((char **)t24);
    t26 = *((int *)t25);
    t27 = (t26 - 0);
    t28 = (t27 * 1);
    t29 = (5U * t28);
    t30 = (0U + t29);
    t24 = (t0 + 5040);
    t31 = (t24 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t16, 5U);
    xsi_driver_first_trans_delta(t24, t30, 5U, 0LL);

LAB2:    t35 = (t0 + 4864);
    *((int *)t35) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1832U);
    t5 = *((char **)t1);
    t1 = (t0 + 1672U);
    t6 = *((char **)t1);
    t7 = *((int *)t6);
    t8 = (t7 - 0);
    t9 = (t8 * 1);
    t10 = (5U * t9);
    t11 = (0U + t10);
    t1 = (t0 + 5040);
    t12 = (t1 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t5, 5U);
    xsi_driver_first_trans_delta(t1, t11, 5U, 0LL);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3830602496_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(60, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 2632U);
    t3 = *((char **)t1);
    t4 = *((int *)t3);
    t5 = (t4 - 0);
    t6 = (t5 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t4);
    t7 = (5U * t6);
    t8 = (0 + t7);
    t1 = (t2 + t8);
    t9 = (t0 + 5104);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 5U);
    xsi_driver_first_trans_fast_port(t9);

LAB2:    t14 = (t0 + 4880);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3830602496_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(61, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = (30 - 0);
    t4 = (t3 * 1);
    t5 = (5U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = (t0 + 5168);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 5U);
    xsi_driver_first_trans_fast_port(t7);

LAB2:    t12 = (t0 + 4896);
    *((int *)t12) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3830602496_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3830602496_3212880686_p_0,(void *)work_a_3830602496_3212880686_p_1,(void *)work_a_3830602496_3212880686_p_2,(void *)work_a_3830602496_3212880686_p_3};
	xsi_register_didat("work_a_3830602496_3212880686", "isim/TB_isim_beh.exe.sim/work/a_3830602496_3212880686.didat");
	xsi_register_executes(pe);
}
