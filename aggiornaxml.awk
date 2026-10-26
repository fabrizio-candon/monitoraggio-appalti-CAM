#!/bin/awk -f

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

BEGIN {
  FPAT="([^;]*)|(\"[^\"]+\")"
  PROCINFO["sorted_in"] = "ordina_cpv"
  ente = ARGV[1];
  initAnni();
  initCpv();

  #for(ente in enti) {
    for(icodcpv in cpv) {  
      split(icodcpv, codcpv, " ");
      #continue 
      print "<Row ss:AutoFitHeight=\"0\">"
      print "  <Cell><Data ss:Type=\"String\">" cpv[icodcpv] " [" codcpv[2] "]</Data></Cell>"
      print "</Row>";
      for(anno in anni) {
	filename = "./estrazioni/" ente "-" anno "-" codcpv[2] ".csv";
	#print filename;
	empty=1;
        while ((getline < filename) > 0) {
           empty=0;
	   gsub("\"", "", $1);  #cig
	   gsub("\"", "", $2);
	   gsub("\"", "", $3);
	   gsub("\"", "", $4);
	   gsub("<", "", $4); # TOGLIE I CARATTERI <
	   gsub("&quot", "&quot;", $4);
	   gsub("\"", "", $5);
	   gsub("\"", "", $6);
	   gsub("\"", "", $7);
	   gsub("\"", "", $8);  #verde
	   gsub("\"", "", $9);  #rup
	   gsub("\"", "", $10); #link documenti
	   print "<Row ss:AutoFitHeight=\"0\">";
	   #print "  <Cell><Data ss:Type=\"String\"></Data></Cell>"
	   #documenti
           print "  <Cell ss:Index=\"2\" ss:StyleID=\"s64\" ss:HRef=\"" $10 "\"><Data ss:Type=\"String\">" $10 "</Data></Cell>"
	   #rup
           print "  <Cell ss:Index=\"3\"><Data ss:Type=\"String\">" $9 "</Data></Cell>"
           print "  <Cell ss:Index=\"4\"><Data ss:Type=\"Number\">20" anno "</Data></Cell>" 
	   if($8 == "t")
             print "  <Cell ss:StyleID=\"s58\" ss:Index=\"5\"><Data ss:Type=\"String\">" $1 "</Data></Cell>"
	   else
             print "  <Cell ss:Index=\"5\"><Data ss:Type=\"String\">" $1 "</Data></Cell>"
           print "  <Cell><Data ss:Type=\"Number\">" $2 "</Data></Cell>"
           print "  <Cell><Data ss:Type=\"String\">" $3 "</Data></Cell>"
           if($8 == "t")
	     print "  <Cell ss:StyleID=\"s58\"><Data ss:Type=\"String\">" $4 "</Data></Cell>"
	   else 
	     print "  <Cell><Data ss:Type=\"String\">" $4 "</Data></Cell>"
           print "  <Cell><Data ss:Type=\"String\">" $5 "</Data></Cell>"
           print "  <Cell><Data ss:Type=\"String\">" $6 "</Data></Cell>"
           print "  <Cell><Data ss:Type=\"String\">" 
	   print $7 
	   print "        </Data></Cell>"
	   print "</Row>"
	   
	} 
	if(empty) {
	  print "<Row ss:AutoFitHeight=\"0\">"
	  print "  <Cell ss:Index=\"4\"><Data ss:Type=\"Number\">20" anno "</Data></Cell>"
	  print "  <Cell ss:Index=\"5\"><Data ss:Type=\"String\">" "-" "</Data></Cell>"
	  print "</Row>"
	  
        }
        close(filename)
      }
    #exit_status = system("find ./estrazioni -name '" i  "*'");
    #print "indice " i;
    #if(exit_status!=0) {
    #  print("errore in lettura files" exit_status);
    #  exit;
    #}
    } 
  #}
  exit
}

{
}

function initCpv() {
  cpv["1 390-391-392-393-397"]="ARREDO PER INTERNI";
  cpv["2 18"]="CALZATURE DA LAVORO";
  cpv["3 301976"]="CARTA";
  cpv["4 3012-302373-301921-301923-3021"]="CARTUCCE";
  cpv["5 302320-302321"]="STAMPANTI";
  cpv["6 34922-45316"]="ARREDO URBANO";
  cpv["7 5023-453116-3499"]="ILLUMINAZIONE PUBBLICA";
  cpv["8 4521-4523-4524"]="EDILIZIA";
  cpv["9 90911"]="PULIZIA PER EDIFICI";
  cpv["10 4533"]="RISCALDAMENTO/AFFRESCAMENTO PER EDIFICI";
  cpv["11 55"]="RISTORAZIONE COLLETTIVA";
  cpv["12 395-19"]="TESSILI";
  cpv["13 773"]="VERDE PuBBLICO";
  cpv["14 9831"]="LAVANOLO";
  cpv["15 7995"]="EVENTI";
  cpv["16 651"]="RISTORO E DISTRIBUZIONE DI ACQUA DI RETE A FINI POTABILI";
  cpv["17 999999"]="CPV PREVALENTE NON DISPONIBILE";
}

function initAnni() {
#  anni["23"]="";
#  anni["24"]="";
  anni["26"]="";
}

function ordina_cpv(i1, v1, i2, v2) {
  split(i1, i1a, " ");
  split(i2, i2a, " ");
  return i1a[1] - i2a[1]
}

function stripGT(s) {
    return gensub("<", "", "g", s);
}
