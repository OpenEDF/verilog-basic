:: -----------------------------------------------------
:: Author: Macro
:: Berif: vivado build and clean in windows platform
:: 
@echo off
:: read the argc from command line
set build=%1
:: set the target
set target=flowled
echo ----------------------------------------------------
echo The vaild command is build/flash/clean.

:: according the command to run
:switch-case-example
  :: Call and mask out invalid call targets
  goto :%build% 2>nul || (
    :: Default case
    echo The vaild command is build/flash/clean.
  )
  goto :switch-case-end
  
  :build
	:: build
    echo %build%
	vivado -mode tcl -source project_mode_build.tcl
    goto :switch-case-end     
  :flash
	:: flash programming
    echo %build%
	vivado -mode tcl -source cfg_program_flash.tcl
    goto :switch-case-end
  :clean
	:: clean the file and floder
    echo %build%
	rmdir /s /q output build .Xil %target%.hw %target%.ip_user_files %target%.runs %target%.cache xsim.dir
	del %target%.xpr vivado.* vivado_* webtalk.* webtalk_* *.log *.pb
    goto :switch-case-end
:switch-case-end
   echo Command execution complete.

echo ----------------------------------------------------
   
:: -----------------------------------------------------
