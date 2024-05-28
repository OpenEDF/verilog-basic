program automatic test(router_io.TB rtr_io);
//Lab 6 - Task 8, Step 2
//
//Delete the variable declarations and the include directives
//ToDo


//Lab 6 - Task 8, Step 3
//
//import the router_test_pkg
//ToDo
import router_test_pkg::*;


  //Lab 6 - Task 11, Step 2
  //
  //Delete the component declarations
  //ToDo

  //Lab 6 - Task 11, Step 3
  //
  //declare an instance of the Environment. Call it env
  //ToDo
  Environment env;

  initial begin
  //Lab 6 - Task 11, Step 4
  //
  //Delete the initial block test code starting here
  //ToDo

  //Delete till here

  //Lab6 - Task 11, Step 5
  //
  //construct the Environment. Pass a name string and instance of interface
  //ToDo
  env = new("env", rtr_io);
  

  //Lab6 - Task 11, Step 6
  //
  //Configure the environment using it's configure() method
  //ToDo
  env.configure();

  //Lab6 - Task 11, Step 7
  //
  //Copy the Environment's run_for_n_packets to test's run_for_n_packets
  //This is needed by the Generator and Scoreboard
  //ToDo
  run_for_n_packets = env.run_for_n_packets;

  //Lab6 - Task 11, Step 8
  //
  //Run the test using the run method in the environment
  //ToDo
  env.run();
  
  end

  //Lab 6 - Task 11, Step 9
  //
  //Delete the reset task
  //ToDo


endprogram: test
