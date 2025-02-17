/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_158(char*, char *);
extern void execute_159(char*, char *);
extern void execute_156(char*, char *);
extern void execute_157(char*, char *);
extern void execute_18(char*, char *);
extern void execute_155(char*, char *);
extern void execute_21(char*, char *);
extern void execute_34(char*, char *);
extern void execute_35(char*, char *);
extern void execute_36(char*, char *);
extern void execute_37(char*, char *);
extern void execute_38(char*, char *);
extern void execute_39(char*, char *);
extern void execute_40(char*, char *);
extern void execute_25(char*, char *);
extern void execute_26(char*, char *);
extern void execute_27(char*, char *);
extern void execute_28(char*, char *);
extern void execute_42(char*, char *);
extern void execute_58(char*, char *);
extern void execute_62(char*, char *);
extern void execute_63(char*, char *);
extern void execute_64(char*, char *);
extern void execute_65(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_104(char*, char *);
extern void execute_105(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_73(char*, char *);
extern void execute_74(char*, char *);
extern void execute_68(char*, char *);
extern void execute_69(char*, char *);
extern void execute_109(char*, char *);
extern void execute_111(char*, char *);
extern void execute_112(char*, char *);
extern void execute_113(char*, char *);
extern void execute_114(char*, char *);
extern void execute_115(char*, char *);
extern void execute_145(char*, char *);
extern void execute_148(char*, char *);
extern void execute_154(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_33(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[46] = {(funcp)execute_158, (funcp)execute_159, (funcp)execute_156, (funcp)execute_157, (funcp)execute_18, (funcp)execute_155, (funcp)execute_21, (funcp)execute_34, (funcp)execute_35, (funcp)execute_36, (funcp)execute_37, (funcp)execute_38, (funcp)execute_39, (funcp)execute_40, (funcp)execute_25, (funcp)execute_26, (funcp)execute_27, (funcp)execute_28, (funcp)execute_42, (funcp)execute_58, (funcp)execute_62, (funcp)execute_63, (funcp)execute_64, (funcp)execute_65, (funcp)execute_102, (funcp)execute_103, (funcp)execute_104, (funcp)execute_105, (funcp)execute_106, (funcp)execute_107, (funcp)execute_73, (funcp)execute_74, (funcp)execute_68, (funcp)execute_69, (funcp)execute_109, (funcp)execute_111, (funcp)execute_112, (funcp)execute_113, (funcp)execute_114, (funcp)execute_115, (funcp)execute_145, (funcp)execute_148, (funcp)execute_154, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_33};
const int NumRelocateId= 46;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Final_Project_sim_behav/xsim.reloc",  (void **)funcTab, 46);
	iki_vhdl_file_variable_register(dp + 23912);
	iki_vhdl_file_variable_register(dp + 23968);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Final_Project_sim_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/Final_Project_sim_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern int xsim_argc_copy ;
extern char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/Final_Project_sim_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Final_Project_sim_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Final_Project_sim_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
