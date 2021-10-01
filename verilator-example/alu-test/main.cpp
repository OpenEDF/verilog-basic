#include "config.h"
#include "alu.h"
#include "verilated_vcd_c.h"

/* main */
int main(int argc, char **argv)
{
    /* Remember model */
    VerilatedContext* contextp = new VerilatedContext;
   
    /* Set debug level, 0 is off, 9 is highest presently used */ 
    contextp->debug(0);

    /* Randomization reset policy */
    contextp->randReset(2);
    
    /* This needs to be called before you create any model */
    contextp->commandArgs(argc, argv);

    /* Create an instance of our module */
    Vtop *tb = new Vtop;
    int fun;
    int ina, inb, success_count;

    /* simulate until $finish */
    while (contextp->time() < TESTBENCH_TIMES)
    {
        contextp->timeInc(1);

        /* test add instruction */
        success_count = 0;
        fun = 0;
        for (uint32_t count = 0; count < ADD_TEST_COUNTER; count++)
        {
            ina = rand();
            inb = rand();
            cycle(tb, ina, inb, fun);
            success_count++;
        }
        printf("ADD ALU TEST SUCCESSFUL COUNTER: %d.\n", success_count);

        /* test sub instruction */
        success_count = 0;
        fun = 1;
        for (uint32_t count = 0; count < SUB_TEST_COUNTER; count++)
        {
            ina = rand();
            inb = rand();
            cycle(tb, ina, inb, fun);
            success_count++;
        }
        printf("SUB ALU TEST SUCCESSFUL COUNTER: %d.\n", success_count);

    }
    
    /* finish */
    printf("[OK] Test Pass!\n");

    /* Final model cleanup */
    tb->final();
    
    /* Return good completion status */
    return 0;
}
