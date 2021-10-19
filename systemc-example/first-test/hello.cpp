// Learn with Examples, 2020, MIT license
#include <systemc.h>
using namespace sc_core;

void hello1() 
{
    std::cout << "Hello world using approach 1" << std::endl;
}

struct HelloWorld : sc_module {          // define a systemC module
    SC_CTOR(HelloWorld) 
    {                                    // constructor function, to be explained later
        SC_METHOD(hello2);               // register a member function to the kernel
    }
    void hello2(void) 
    {                                    // a function for systemC simulation kernel, void inside () can be omitted
        std::cout << "Hello world using approach 2" << std::endl;
    }
};

int sc_main(int, char*[]) {              // entry point
    hello1();                            // approach #1: manually invoke a normal function
    HelloWorld helloworld("helloworld"); // approach #2, instantiate a systemC module
//  sc_start();                          // let systemC simulation kernel to invoke helloworld.hello2();
    helloworld.hello2();    
    return 0;
}

/*  output result:
    Hello world using approach 1
    Hello world using approach 2
*/
