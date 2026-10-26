--===================================================================================
-- Copyright (C) 2024-2026 Fabrizio Candon
--
--    This file is part of MONITORAGGIO APPALTI.
--
--    MONITORAGGIO APPALTI is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    MONITORAGGIO APPALTI is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with Nome-Programma.  If not, see <http://www.gnu.org/licenses/>
--
--===================================================================================

set parametri.anno_riferimento = :'anno_riferimento';
set parametri.output_dir = :'output_dir';
do $$
declare

  ente record;
  select_enti text;
  anno_riferimento varchar;
  anno varchar;
  output_dir varchar;

begin
  anno_riferimento = current_setting('parametri.anno_riferimento');
  output_dir = current_setting('parametri.output_dir');
  select_enti := 'select cf, rag_soc from enti_rdv';
  anno='26';
--substring(anno_riferimento,3,4);

  for ente in execute select_enti
  loop

  execute '
    --ARREDO PER INTERNI 390 391 392 393 397

	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''  
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279'' 
	  and a.cf_amm_appaltante=''' || ente.cf || ''' 
	  and ( a.cod_cpv like ''390%'' 
		or a.cod_cpv like ''391%'' 
		or a.cod_cpv like ''392%'' 
		or a.cod_cpv like ''393%'' 
		or a.cod_cpv like ''397%'' 
	      )
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-390-391-392-393-397.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

    --CALZATURE DA LAVORO 18

	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || ''' 
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279'' 
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and a.cod_cpv like ''18%''
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-18.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	--CARTA 301976

	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >=  '''|| anno_riferimento || ''' 
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279'' 
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and a.cod_cpv like ''301976%'' 
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-301976.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	--CARTUCCE 3012 302373 301921 301923 3021

	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279'' 
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and ( a.cod_cpv like ''3012%'' 
		or a.cod_cpv like ''302373%'' 
		or a.cod_cpv like ''301921%'' 
		or a.cod_cpv like ''301923%'' 
		or a.cod_cpv like ''3021%''
             )
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-3012-302373-301921-301923-3021.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	--STAMPANTI 302320 302321
	
	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279'' 
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and ( a.cod_cpv like ''302320%'' 
		or a.cod_cpv like ''302321%'' 
              )
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-302320-302321.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	--ARREDO URBANO 34922 45316

	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279''
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and ( a.cod_cpv like ''34922%'' 
		or a.cod_cpv like ''45316%'' 
              )
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-34922-45316.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	--ILLUMINAZIONE PUBBLICA 5023 453116 3499
	
	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279''
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and ( a.cod_cpv like ''5023%'' 
		or a.cod_cpv like ''453116%''
		or a.cod_cpv like ''3499%''
             )
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-5023-453116-3499.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	--EDILIZIA 4521 4523 4524
	
	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279'' 
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and ( a.cod_cpv like ''4521%'' 
		or a.cod_cpv like ''4523%'' 
		or a.cod_cpv like ''4524%''
              )
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-4521-4523-4524.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	--PULIZIA PER EDIFICI 90911
	
	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279''
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and a.cod_cpv like ''90911%''
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-90911.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	--RISCALDAMENTO/AFFRESCAMENTO PER EDIFICI 4533
	
	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || ''' 
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279''
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and a.cod_cpv like ''4533%''
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-4533.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	----RISTORAZIONE COLLETTIVA 55
	
	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279''
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and a.cod_cpv like ''55%''
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-55.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;
	
	--TESSILI 395 19
	
	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279''
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and ( a.cod_cpv like ''395%''
		or a.cod_cpv like ''19%'' 
	      )
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-395-19.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;
	
	--VERDE PUBBLICO 773
	
	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279''
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and a.cod_cpv like ''773%''
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-773.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	--LAVANOLO 9831
	
	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000
	  and b.cf!=''80007580279''
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and a.cod_cpv like ''9831%''
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-9831.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	--EVENTI 7995
	
	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000 
	  and b.cf!=''80007580279''
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and a.cod_cpv like ''7995%''
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-7995.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	--RISTORO E DISTRIBUZIONE DI ACQUA DI RETE A FINI POTABILI 651 4296 
	
	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000
	  and b.cf!=''80007580279''
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and ( a.cod_cpv like ''651%''
	        or a.cod_cpv like ''4296%''
	      )
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-651.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;

	--INDETERMINATI 999999
	
	copy (select a.cig, a.importo_lotto, a.numero_gara, a.oggetto_lotto, a.tipo_scelta_contraente, a.cod_cpv, a.desc_cpv, a.verde, r.nome || '' '' || r.cognome, d.link  
	  from appalti a  join enti_rdv b on a.cf_amm_appaltante=b.cf
          left join documenti d on a.cig=d.cig
          left join rup r on a.rup=r.id
	  where
	  data_pubblicazione >= '''|| anno_riferimento || '''
	  and a.importo_lotto>40000
	  and b.cf!=''80007580279''
	  and a.cf_amm_appaltante=''' || ente.cf || '''
	  and a.cod_cpv like ''999999%''
	  and (a.verde=true or a.verde is null)
	  order by a.importo_lotto desc) 
	to ''' || output_dir || ente.cf || '-' || anno || '-999999.csv''
	with csv delimiter '';'' encoding ''LATIN1'' force quote *;
  ';
  end loop;
end;
$$
