device jtagport builtin
device umr_pipe 1
iice new {IICE} -type regular
iice controller -iice {IICE} none
iice sampler -iice {IICE} -depth 128
iice clock -iice {IICE} -edge positive {/clk}
signals add -iice {IICE} -silent -trigger -sample  {/led_on_number}\
{/cnt}\
{/rst_n}\
{/led}

