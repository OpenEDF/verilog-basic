#include "config.h"
#include "alu.h"

/* main */
int main(int argc, char **argv)
{
    /* Remember model */
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);

    /* Create an instance of our module */
    Valu *tb = new Valu;
    int fun;
    int ina, inb, success_count;

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

    /* finish */
    printf("[OK] Test Pass!\n");
    return 0;
}
