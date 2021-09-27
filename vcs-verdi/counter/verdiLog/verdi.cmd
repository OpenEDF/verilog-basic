debImport "/home/macro/verilog-basic/vcs-verdi/counter/tb_counter.v" \
          "/home/macro/verilog-basic/vcs-verdi/counter/counter.v" -path \
          {/home/macro/verilog-basic/vcs-verdi/counter}
wvCreateWindow
srcHBSelect "tb_counter.u1" -win $_nTrace1
srcHBSelect "tb_counter.u1" -win $_nTrace1
srcSetScope -win $_nTrace1 "tb_counter.u1" -delim "."
srcHBSelect "tb_counter.u1" -win $_nTrace1
srcHBSelect "tb_counter.u1" -win $_nTrace1
srcHBSelect "tb_counter.u1" -win $_nTrace1
srcHBSelect "tb_counter.u1" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/macro/verilog-basic/vcs-verdi/counter/tb_counter.fsdb}
srcHBSelect "tb_counter.u1" -win $_nTrace1
srcHBSelect "tb_counter.u1" -win $_nTrace1
srcHBSelect "tb_counter.u1" -win $_nTrace1
srcHBSelect "tb_counter.u1" -win $_nTrace1
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "u1" 1 )} 
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "u1" 3 )} 
wvSelectSignal -win $_nWave2 {( "u1" 3 )} 
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "u1" 3 )} 
wvSelectSignal -win $_nWave2 {( "u1" 2 )} 
wvSelectSignal -win $_nWave2 {( "u1" 1 )} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_counter"
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1438.471929 -snap {("G2" 0)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
schCreateWindow -delim "." -win $_nSchema1 -scope "tb_counter.u1"
schSelect -win $_nSchema3 -inst "counter:FSM0:9:14:Counter"
schSelect -win $_nSchema3 -signal "clk"
schSelect -win $_nSchema3 -port "clk"
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -inst "u1"
schSelect -win $_nSchema3 -inst "u1"
schSelect -win $_nSchema3 -inst "tb_counter:Always0:14:14:Combo"
schSelect -win $_nSchema3 -inst "tb_counter:Always0:14:14:Combo"
debExit
