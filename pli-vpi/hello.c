#include <stdio.h>
#include "vpi_user.h"

void hello(void)
{
    printf("Hello World!\n");
    printf("This is a test from macro.\n");
    vpi_printf("The vpi test printf.\n ");
}
