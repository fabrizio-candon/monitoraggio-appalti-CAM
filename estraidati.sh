#!/bin/sh

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

export LC_ALL=it_IT.ISO-8859-1
export PGCLIENTENCODING=LATIN1
export PGOPTIONS='--client-min-messages=warning'
export N_PROC=0

OS_DIR='d:\Documents and Settings\fabrizio-candon\e-procurement\report\git\monitoraggio_gare_verdi\estrazioni\'
psql -U anac -d anac -a --variable=anno_riferimento=$1 --variable=output_dir="$OS_DIR" -f ./sql/estraidaenti.sql

