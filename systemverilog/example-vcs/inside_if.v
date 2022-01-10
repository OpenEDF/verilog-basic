module test;
    bit [3:0] m_data;
    bit flag;

    initial begin
        for (int i = 0; i < 10; i++) begin
            m_data = $random;
            flag = m_data inside {[4:9]} ? 1 : 0;

            if (m_data inside {[4:9]})
                $display("m_data = %0d \tINSIDE  [4:9] \tflag = %0d", m_data, flag);
            else
                $display("m_data = %0d \tOUTSIDE [4:9] \tflag = %0d", m_data, flag);
        end
    end

endmodule


/*
* Result
Compiler version O-2018.09-SP2_Full64; Runtime version O-2018.09-SP2_Full64;  Jan 10 08:46 2022
m_data = 4      INSIDE  [4:9]   flag = 1
m_data = 1      OUTSIDE [4:9]   flag = 0
m_data = 9      INSIDE  [4:9]   flag = 1
m_data = 3      OUTSIDE [4:9]   flag = 0
m_data = 13     OUTSIDE [4:9]   flag = 0
m_data = 13     OUTSIDE [4:9]   flag = 0
m_data = 5      INSIDE  [4:9]   flag = 1
m_data = 2      OUTSIDE [4:9]   flag = 0
m_data = 1      OUTSIDE [4:9]   flag = 0
m_data = 13     OUTSIDE [4:9]   flag = 0
           V C S   S i m u l a t i o n   R e p o r t
Time: 0
CPU Time:      0.500 seconds;       Data structure size:   0.0Mb
Mon Jan 10 08:46:50 2022
*/
