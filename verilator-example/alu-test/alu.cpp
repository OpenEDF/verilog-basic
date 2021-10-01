#include "alu.h"
#include "config.h"

void cycle(Vtop *tb, uint32_t in1, uint32_t in2, uint8_t alu_op)
{
    /* verify the alu model */
    uint32_t expected_out = 0;
    uint32_t out;
    uint32_t zero;
    uint32_t neg;

    /* moudle parameters initalization */
    tb->t_in1 = in1;
    tb->t_in2 = in2;
    tb->t_control = alu_op;

    /* must be invoke, called eval thread */
    tb->eval();
    
    /* get parameter from aul model */
    out  = tb->t_out;
    zero = tb->t_zero;
    neg  = tb->t_neg;

    /* verify */
    switch (alu_op)
    {
        case 0:
            expected_out = in1 + in2;
            break;
        case 1:
            expected_out = in1 - in2;
            break;

        default:
            break;
    }

    /* check the result */
    printf("in1 = %d, \tin2 = %d, \top = %d, \tout = %d, \tzero = %d, \tneg = %d, \texpected_out = %d\n", in1, in2, alu_op, out, zero, neg, expected_out);
    
    if ((expected_out != out) || (zero != (expected_out == 0)) || (neg != ((int)expected_out < 0)))
    {
        printf("[ERROR] test failed!\n");
        exit(-1);
    }

    /* return */
}
