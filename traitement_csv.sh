#!/bin/bash


dir=/home/pi/data

cp rezult.csv f.csv
f=f.csv

#for f in /home/pi/test/data/*
#do
#	if !(echo "$f" | grep  done) ; then
#		echo "file : $f"
		#enlever les lignes inutiles au debut
	#	sed -i '3d' $f  
	#	sed -i '1d' $f 		
		#enlever les "
		sed -i -e 's/"//g' $f
		#retour ligne
		cat -v -e $f > tmp && mv tmp $f
		sed -i 's/\^M/\n/g' $f
		cut -c 2- $f > tmp && mv tmp $f
#		sed -i 's/\^M/\n/g' $f
		#enlever les espaces dans le header
#		tmp=$(head -3 $f | awk '{gsub(" ","_");print}')
#		sed -i "1s/.*/$tmp/" $f 

		# creer les differents csv
	        
		#creation de gateway_0
		awk -F, '{ for (i=1; i<=3; i++) { printf "%s,",$i } print ""; }' $f > ${dir}/gateway_0.csv
		sed -i -e '$d' ${dir}/gateway_0.csv 
		sed -i -e '3d' ${dir}/gateway_0.csv
		sed -i -e '1d' ${dir}/gateway_0.csv
		#enlever les espaces dans le header
		tmp=$(head -1 ${dir}/gateway_0.csv | awk '{gsub(" ","_");print}')
		sed -i "1 s|.*|${tmp}|" ${dir}/gateway_0.csv
		
		#creation de timestamp (utile plus tard)
		awk -F, '{print $1}' $f > ${dir}/timestamp.csv	
		sed -i -e '$d' ${dir}/timestamp.csv
                sed -i -e '3d' ${dir}/timestamp.csv
                sed -i -e '1d' ${dir}/timestamp.csv
		#enlever les espaces dans le header
                tmp=$(head -1 ${dir}/timestamp.csv | awk '{gsub(" ","_");print}')
                sed -i "1 s|.*|${tmp}|" ${dir}/timestamp.csv

#		#creation de battery_monitor_290
#		awk -F, '{ for (i=38; i<=54; i++) { printf "%s,",$i } print ""; }' $f > ${dir}/battery_monitor_290.csv		
#		sed -i -e '$d' ${dir}/battery_monitor_290.csv
#               sed -i -e '3d' ${dir}/battery_monitor_290.csv
#               sed -i -e '1d' ${dir}/battery_monitor_290.csv
#		paste  -d"," ${dir}/timestamp.csv ${dir}/battery_monitor_290.csv > tmp && mv tmp ${dir}/battery_monitor_290.csv
		#enlever les espaces dans le heade
#               tmp=$(head -1 ${dir}/battery_monitor_290.csv | awk '{gsub(" ","_");print}')
#               sed -i "1 s|.*|${tmp}|" ${dir}/battery_monitor_290.csv
		
		#creation de solar_charger_288
                awk -F, '{ for (i=4; i<=20; i++) { printf "%s,",$i } print ""; }' $f > ${dir}/solar_charger_288.csv
		sed -i -e '$d' ${dir}/solar_charger_288.csv
                sed -i -e '3d' ${dir}/solar_charger_288.csv
                sed -i -e '1d' ${dir}/solar_charger_288.csv
		paste  -d"," ${dir}/timestamp.csv ${dir}/solar_charger_288.csv > tmp && mv tmp ${dir}/solar_charger_288.csv
		#enlever les espaces dans le header
                tmp=$(head -1 ${dir}/solar_charger_288.csv | awk '{gsub(" ","_");print}')
                sed -i "1 s|.*|${tmp}|" ${dir}/solar_charger_288.csv
		#ajout de instance dans le header
                sed -i -e "1 s|$|instance|" ${dir}/solar_charger_288.csv
                #ajout de instance dans les valeurs
                sed -i -e "1 ! s|$|288|"  ${dir}/solar_charger_288.csv

		#creation de solar_charger_289
                awk -F, '{ for (i=21; i<=37; i++) { printf "%s,",$i } print ""; }' $f > ${dir}/solar_charger_289.csv
		sed -i -e '$d' ${dir}/solar_charger_289.csv
                sed -i -e '3d' ${dir}/solar_charger_289.csv
                sed -i -e '1d' ${dir}/solar_charger_289.csv
		paste  -d"," ${dir}/timestamp.csv ${dir}/solar_charger_289.csv > tmp && mv tmp ${dir}/solar_charger_289.csv
		#enlever les espaces dans le header
                tmp=$(head -1 ${dir}/solar_charger_289.csv | awk '{gsub(" ","_");print}')
                sed -i "1 s|.*|${tmp}|" ${dir}/solar_charger_289.csv
		#ajout de instance dans le header
                sed -i -e "1 s|$|instance|" ${dir}/solar_charger_289.csv
                #ajout de instance dans les valeurs
                sed -i -e "1 ! s|$|289|"  ${dir}/solar_charger_289.csv

		#creation de solar_charger_290
                awk -F, '{ for (i=38; i<=54; i++) { printf "%s,",$i } print ""; }' $f > ${dir}/solar_charger_290.csv
		sed -i -e '$d' ${dir}/solar_charger_290.csv
                sed -i -e '3d' ${dir}/solar_charger_290.csv
                sed -i -e '1d' ${dir}/solar_charger_290.csv
		paste  -d"," ${dir}/timestamp.csv ${dir}/solar_charger_290.csv > tmp && mv tmp ${dir}/solar_charger_290.csv
		#enlever les espaces dans le header
                tmp=$(head -1 ${dir}/solar_charger_290.csv | awk '{gsub(" ","_");print}')
                sed -i "1 s|.*|${tmp}|" ${dir}/solar_charger_290.csv
		#ajout de instance dans le header
                sed -i -e "1 s|$|instance|" ${dir}/solar_charger_290.csv
                #ajout de instance dans les valeurs
                sed -i -e "1 ! s|$|290|"  ${dir}/solar_charger_290.csv
	
		#creation de solar_charger_291
                awk -F, '{ for (i=55; i<=71; i++) { printf "%s,",$i } print ""; }' $f > ${dir}/solar_charger_291.csv
                sed -i -e '$d' ${dir}/solar_charger_291.csv
                sed -i -e '3d' ${dir}/solar_charger_291.csv
                sed -i -e '1d' ${dir}/solar_charger_291.csv
                paste  -d"," ${dir}/timestamp.csv ${dir}/solar_charger_291.csv > tmp && mv tmp ${dir}/solar_charger_291.csv
                #enlever les espaces dans le header
                tmp=$(head -1 ${dir}/solar_charger_291.csv | awk '{gsub(" ","_");print}')
                sed -i "1 s|.*|${tmp}|" ${dir}/solar_charger_291.csv
                #ajout de instance dans le header
                sed -i -e "1 s|$|instance|" ${dir}/solar_charger_291.csv
                #ajout de instance dans les valeurs
                sed -i -e "1 ! s|$|291|"  ${dir}/solar_charger_291.csv


		#creation de system_overview_0
                awk -F, '{ for (i=72; i<=83; i++) { printf "%s,",$i } print ""; }' $f > ${dir}/system_overview_0.csv
		sed -i -e '$d' ${dir}/system_overview_0.csv
                sed -i -e '3d' ${dir}/system_overview_0.csv
                sed -i -e '1d' ${dir}/system_overview_0.csv
		paste  -d"," ${dir}/timestamp.csv ${dir}/system_overview_0.csv > tmp && mv tmp ${dir}/system_overview_0.csv
		#enlever les espaces dans le header
                tmp=$(head -1 ${dir}/system_overview_0.csv | awk '{gsub(" ","_");print}')
                sed -i "1 s|.*|${tmp}|" ${dir}/system_overview_0.csv

python csv-to-influxdb/csv-to-influxdb.py --dbname greenpanel_3 --input ${dir}/solar_charger_288.csv --timecolumn "Europe/Budapest_(+01:00)" --tagcolumns instance --fieldcolumns Voltage,Current,Battery_watts,Load_state,Load_current,Charger_on/off,Charge_state,PV_voltage,PV_current,PV_power,MPPT_State,Yield_today,Maximum_charge_power_today,Yield_yesterday,Maximum_charge_power_yesterday,Error_code,User_yield,instance

python csv-to-influxdb/csv-to-influxdb.py --dbname greenpanel_3 --input ${dir}/solar_charger_289.csv --timecolumn "Europe/Budapest_(+01:00)" --tagcolumns instance --fieldcolumns Voltage,Current,Battery_watts,Load_state,Load_current,Charger_on/off,Charge_state,PV_voltage,PV_current,PV_power,MPPT_State,Yield_today,Maximum_charge_power_today,Yield_yesterday,Maximum_charge_power_yesterday,Error_code,User_yield,instance

python csv-to-influxdb/csv-to-influxdb.py --dbname greenpanel_3 --input ${dir}/solar_charger_290.csv --timecolumn "Europe/Budapest_(+01:00)" --tagcolumns instance --fieldcolumns Voltage,Current,Battery_watts,Load_state,Load_current,Charger_on/off,Charge_state,PV_voltage,PV_current,PV_power,MPPT_State,Yield_today,Maximum_charge_power_today,Yield_yesterday,Maximum_charge_power_yesterday,Error_code,User_yield,instance

python csv-to-influxdb/csv-to-influxdb.py --dbname greenpanel_3 --input ${dir}/solar_charger_291.csv --timecolumn "Europe/Budapest_(+01:00)" --tagcolumns instance --fieldcolumns Voltage,Current,Battery_watts,Load_state,Load_current,Charger_on/off,Charge_state,PV_voltage,PV_current,PV_power,MPPT_State,Yield_today,Maximum_charge_power_today,Yield_yesterday,Maximum_charge_power_yesterday,Error_code,User_yield,instance


#awk -F "," '{ print $1","$2 }' f.csv
		#enlever le timestamp dans le header
		
		#envoyer le csv sur db
		#csv-to-influxdb.py --dbname greenpanel --input .csv --fieldcolumns   
		#changer nom du fichier traitée	
		#mv $f ${f}.done
		


#	fi
#done


