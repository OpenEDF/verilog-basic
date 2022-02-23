global env
fsdbDumpfile "$env(OUTPUT).fsdb"
fsdbDumpvars 0 "flowled_tb"
fsdbDumpMDA "flowled_tb"
run
