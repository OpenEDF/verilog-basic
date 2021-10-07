:: -----------------------------------------------------
:: Author: Macro
:: Berif: vivado build and clean in windows platform
:: 
@echo off
:: read the argc from command line
set build=%1
:: set the target
set target=flowled
set env_path=D:\Xilinx\Vivado\2019.2\settings64.bat
echo ----------------------------------------------------
echo The vaild command is build/flash/clean.

:: according the command to run
:switch-case-example
  :: Call and mask out invalid call targets
  goto :%build% 2>nul || (
    :: Default case
    echo The vaild command is build/flash/clean/env.
  )
  goto :switch-case-end
  
  :build
	:: build
    echo %build%
	vivado -mode tcl -source nonproject_mode_build.tcl
    goto :switch-case-end     
  :flash
	:: flash programming
    echo %build%
	vivado -mode tcl -source cfg_program_flash.tcl
    goto :switch-case-end
  :clean
	:: clean the file and floder
    echo %build%
	rmdir /s /q output build .Xil
	del usage_statistics_webtalk.* hs_err_pid6440.* vivado.* vivado_* webtalk.*
    goto :switch-case-end
  :env
	:: set vivado windows env path
    echo %build%
	%env_path%
    goto :switch-case-end
:switch-case-end
   echo Command execution complete.

echo ----------------------------------------------------
   
:: -----------------------------------------------------