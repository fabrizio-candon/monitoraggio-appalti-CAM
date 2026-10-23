#!/bin/bash

# Copyright (C) 2024-2026 Fabrizio Candon

#    This file is part of MONITORAGGIO APPALTI.
#
#    MONITORAGGIO APPALTI is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    MONITORAGGIO APPALTI is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Nome-Programma.  If not, see <http://www.gnu.org/licenses/>
#

declare -A enti

enti[1,1]="ARPAV"
enti[1,2]="92111430283"

enti[2,1]="AVEPA"
enti[2,2]="90098670277"

enti[3,1]="E.P. COLLI EUGANEI"
enti[3,2]="91004990288"

enti[4,1]="E.P. DOLOMITI BELLUNESI"
enti[4,2]="91005860258"

enti[5,1]="E.P. FIUME SILE"
enti[5,2]="94023150264";

enti[6,1]="E.P. DELTA DEL PO"
enti[6,2]="90008170293"

enti[7,1]="E.P. LESSINIA"
enti[7,2]="93287640234"

enti[8,1]="E.P. DOLOMITI D''AMPEZZO"
enti[8,2]="00806650255"

enti[9,1]="ESU DI PADOVA"
enti[9,2]="00815750286"

enti[10,1]="ESU VENEZIA"
enti[10,2]="01740230279"

enti[11,1]="ESU VERONA"
enti[11,2]="01527330235"

enti[12,1]="I.R. VILLE VENETE"
enti[12,2]="80017460272"

enti[13,1]="I.R. ZOOPROFILATTICO"
enti[13,2]="00206200289"

enti[14,1]="VENETO LAVORO"
enti[14,2]="03180130274"

enti[15,1]="AG VEN INNOV SETTORE PRIMARIO"
enti[15,2]="92281270287"

enti[16,1]="ATER BELLUNO"
enti[16,2]="00092050251"

enti[17,1]="ATER PADOVA"
enti[17,2]="00222610289"

enti[18,1]="ATER ROVIGO"
enti[18,2]="00041640293"

enti[19,1]="ATER TREVISO"
enti[19,2]="00193710266"

enti[20,1]="ATER VENEZIA"
enti[20,2]="00181510272"

enti[21,1]="ATER VERONA"
enti[21,2]="00223640236"

enti[22,1]="ATER VICENZA"
enti[22,2]="00165800244"

enti[23,1]="INFRASTRUTTURE VENETE"
enti[23,2]="03792380283"

enti[24,1]="SISTEMI TERRITORIALI"
enti[24,2]="06070650582"

enti[25,1]="VENETO ACQUE"
enti[25,2]="03875491007"

enti[26,1]="VENETO EDIFICI MONUMENTALI"
enti[26,2]="03298360268"

enti[27,1]="VENETO STRADE"
enti[27,2]="03345230274"

enti[28,1]="VENETO SVILUPPO"
enti[28,2]="00854750270"

enti[29,1]="FVS SGR"
enti[29,2]="01112230329"

enti[30,1]="VENETO INNOVAZIONE"
enti[30,2]="02568090274"

enti[31,1]="FINEST"
enti[31,2]="01234190930"

enti[32,1]="CONCESSIONI AUTOSTRADALI"
enti[32,2]="03829590276"

enti[33,1]="AUTOSTRADE ALTO ADRIATICO"
enti[33,2]="01310930324"

enti[34,1]="MILANO CORTINA 2020-2026"
enti[34,2]="16406341004"

# scrive tutti i csv nella directory estrazioni
# psql -U fabrizio-candon -d appaltiverdi -a -f ./appaltiverdi_estraidaenti.sql

cat workbook_open.xml > estrazione.xml
#for ente in "${!enti[@]}"
for ((i=1;i<=34;i++))
do 
  printf "\e[0;97m %-30s \e[0;0m   \e[4;32m# %s \e[0;0m\n" "${enti[$i,1]}" ${enti[$i,2]}
  echo " <Worksheet ss:Name=\"" ${enti[$i,1]} "\">" >> estrazione.xml 
  cat worksheet_table_open.xml >> estrazione.xml
  
  ./aggiornaxml.awk "${enti[$i,2]}" >> estrazione.xml

  cat worksheet_table_close.xml >> estrazione.xml
done
   echo "</Workbook>" >> estrazione.xml

