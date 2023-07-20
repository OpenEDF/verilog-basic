global env
fsdbDumpfile "$env(OUTPUT).fsdb"
fsdbDumpvars 0 "top_tb"
fsdbDumpMDA "top_tb"
run
