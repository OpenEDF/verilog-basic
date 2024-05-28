verdiSetPrefEnv -bUndockNewCreatedWindow "on"
debImport "-ssf" "novas.fsdb"
debLoadSimResult \
           ./novas.fsdb
wvCreateWindow
wvResizeWindow -win $_nWave2 54 237 960 332
verdiWindowWorkMode -win $_Verdi_1 -hardwareDebug
srcHBSelect "router_test_top.top_io" -win $_nTrace1
wvAddSubGroup -win $_nWave2 -holdpost {top_io(router_io)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1/top_io(router_io)" 0)}
wvAddSignal -win $_nWave2 "/router_test_top/top_io/clock" \
           "/router_test_top/top_io/reset_n" \
           "/router_test_top/top_io/din\[15:0\]" \
           "/router_test_top/top_io/frame_n\[15:0\]" \
           "/router_test_top/top_io/valid_n\[15:0\]" \
           "/router_test_top/top_io/dout\[15:0\]" \
           "/router_test_top/top_io/valido_n\[15:0\]" \
           "/router_test_top/top_io/busy_n\[15:0\]" \
           "/router_test_top/top_io/frameo_n\[15:0\]"
wvSetPosition -win $_nWave2 {("G1/top_io(router_io)" 0)}
wvSetPosition -win $_nWave2 {("G1/top_io(router_io)" 9)}
wvSetPosition -win $_nWave2 {("G1/top_io(router_io)" 9)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetWindowTimeUnit -win $_nWave2 1.000000 ns
