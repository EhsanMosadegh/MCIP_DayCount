#!/bin/csh -f
###################################################################
# Usage: Preparing following variables for run.mcip.csh script:
# 	month1, month2, today, tmrw
# Created by: Ehsan Mosadegh (ehsanm@dri.edu)
# Date: Sep.12, 2018
# NOTES: 
# - for only montes: 07-11
#
# #################################################################
echo "*** Start of DayCount script ..."
set month_list = (07 08 09 10 11)
set day_list_31days = (01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31)
set day_list_30days = (01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)
set day_list_28days = (01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28)

foreach m ($month_list)
	set month1 = $m
	set month2 = $m
        # do for 31days month 
	if ($month1 == 07 || $month1 == 08 || $month1 == 10) then
		foreach d ($day_list_31days)
			if ($d < 09) then
				set today = $d
				@ tmrw = $d + 1
				set tmrw = 0$tmrw
                        else if ($d == 09) then
                                set today = $d
                                @ tmrw = $d + 1
                                set tmrw = $tmrw
			else if ($d >= 10) then	
                                set today = $d
                                @ tmrw = $d + 1
                                set tmrw = $tmrw
				if ($tmrw == 32) then
					echo "modification for tmrw=$tmrw"
					@ month2 = $m + 1
					if ($month2 < 10) then
						set month2 = 0$month2
					else
						set month2 = $month2
					endif
					set tmrw = 01
				endif
			endif
		################ run MCIP for each day ############
        	echo "*** Setting the environment ..."
		setenv MONTH1 $month1 
		setenv TODAY $today
		setenv MONTH2 $month2
		setenv TMRW $tmrw
		echo "*** Going to run MCIP for RunPeriod: month1=$month1; today=$today; month2=$month2; tmrw=$tmrw ..."
        	./run.mcip.Tahoe.modified
		###################################################	
		end
	else if ($month1 == 09 || $month1 == 11) then
		foreach d ($day_list_30days)
			if ($d < 09) then
                                set today = $d
                                @ tmrw = $d + 1
                                set tmrw = 0$tmrw
                        else if ($d == 09) then
                                set today = $d
                                @ tmrw = $d + 1
                                set tmrw = $tmrw
                        else if ($d >= 10) then
                                set today = $d
                                @ tmrw = $d + 1
                                set tmrw = $tmrw
                                if ($tmrw == 31) then
                                        echo "*** modification for tmrw=$tmrw ..."
					@ month2 = $m + 1
                                        if ($month2 < 10) then
                                                set month2 = 0$month2
                                        else
                                                set month2 = $month2
                                        endif
                                        set tmrw = 01
				endif
			endif
		################ run MCIP for each day ############
                echo "*** Setting the environment ..."
                setenv MONTH1 $month1
                setenv TODAY $today
                setenv MONTH2 $month2
                setenv TMRW $tmrw
                echo "*** Going to run MCIP for RunPeriod: month1=$month1; today=$today; month2=$month2; tmrw=$tmrw ..."
                ./run.mcip.Tahoe.modified
                ###################################################
		end
	else if ($month1 == 02) then
		foreach d ($day_list_30days)
                        if ($d < 9) then
                                set today = 0$d
                                @ tmrw = $d + 1
                                set tmrw = 0$tmrw
                        else if ($d == 9) then
                                set today = 0$d
                                @ tmrw = $d + 1
                                set tmrw = $tmrw
                        else if ($d >= 10) then
                                set today = $d
                                @ tmrw = $d + 1
                                set tmrw = $tmrw
                                if ($tmrw == 31) then
                                        echo "modification for tmrw=$tmrw"
                                        @ month2 = $m + 1
                                        if ($month2 < 10) then
                                                set month2 = 0$month2
                                        else
                                                set month2 = $month2
                                        endif
                                        set tmrw = 01
                                endif
                        endif
                ################ run MCIP for each day ############
                echo "*** Setting the environment ..."
                setenv MONTH1 $month1
                setenv TODAY $today
                setenv MONTH2 $month2
                setenv TMRW $tmrw
                echo "*** Going to run MCIP for RunPeriod: month1=$month1; today=$today; month2=$month2; tmrw=$tmrw ..."
                ./run.mcip.Tahoe.modified
                ###################################################
		end	
	else
		echo "ERROR: month1 no. $month1 is not in the month_list"
	endif
echo "*** End of DatCount script ..."
end
