#include <stdio.h>
#include <stdlib.h>
#include <verilated.h> 
#include "Vtop.h"

int main(int argc, char** argv, char** env)
{
    // "VerilatedContext* contextp = new VerilatedContext" then deleting at end.
    const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
    
    // Verilator must compute traced signals
    contextp->traceEverOn(true);
    contextp->commandArgs(argc, argv);
    
    /* must need when generated VCD file */
    const std::unique_ptr<Vtop> top{new Vtop{contextp.get(), "TOP"}};

    // Set Vtop's input signals
    top->reset_l = !0;
    top->clk = 0;

    // Simulate until $finish
    while (contextp->time() < 100)
    {
        contextp->timeInc(1);  // 1 timeprecision period passes...
        top->clk = !top->clk;

        // reset is not sampled there.
        if (!top->clk) 
        {
            if (contextp->time() > 1 && contextp->time() < 10)
            {
                top->reset_l = !1;  // Assert reset
            } else {
                top->reset_l = !0;  // Deassert reset
            }
        }
        printf("counter: %d\n", top->count);
        top->eval();
    }

    // Final model cleanup
    top->final();

    return 0;
}
