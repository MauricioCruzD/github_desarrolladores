
----Contar las HIstorias CLinicas
Select Edad, [Masculino],[Femenino]
from (Select Edad, Sexo , COUNT(DISTINCT Historia) Historia
	from (Select Case when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 0 and 2 then ' 0- 2'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 3 and 4 then ' 3- 4'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 5 and 9 then ' 5- 9'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 10 and 14 then '10- 14'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 15 and 19 then '15- 19'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 20 and 24 then '20- 24'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 25 and 29 then '25- 29'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 30 and 34 then '30- 34'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 35 and 39 then '35- 39'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 40 and 44 then '40- 44'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 45 and 49 then '45- 49'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 50 and 54 then '50- 54'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 55 and 59 then '55- 59'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 60 and 64 then '60- 64'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 65 and 69 then '65- 69'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 70 and 74 then '70- 74'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 75 and 79 then '75- 79'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 80 and 84 then '80- 84'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 85 and 89 then '85- 89'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 90 and 94 then '90- 94'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 95 and 99 then '95- 99'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 100 and 104 then '100- 104'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 105 and 109 then '105- 109'
		 else 'mas de 110' end as Edad, Sexo, Historia
		from Estadisticas_E 
		where Orden>='20200801000' and Orden<='20200831999' 
		and [Estado orden]='Activa' And CodOrigen IN (8)) as t 
	Group by Edad, Sexo) as n -- Select de los datos antes de hacer el pivot
PIVOT (SUM(Historia) For Sexo in ([Masculino],[Femenino])) p --Pivot para acomodar los datos del sexo
Order By Edad

---- Contar los examenes y perfiles
Select Edad, [Masculino],[Femenino]
from (Select Edad, Sexo , COUNT(perfil) perfil
	from (Select Case when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 0 and 2 then ' 0- 2'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 3 and 4 then ' 3- 4'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 5 and 9 then ' 5- 9'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 10 and 14 then '10- 14'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 15 and 19 then '15- 19'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 20 and 24 then '20- 24'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 25 and 29 then '25- 29'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 30 and 34 then '30- 34'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 35 and 39 then '35- 39'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 40 and 44 then '40- 44'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 45 and 49 then '45- 49'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 50 and 54 then '50- 54'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 55 and 59 then '55- 59'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 60 and 64 then '60- 64'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 65 and 69 then '65- 69'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 70 and 74 then '70- 74'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 75 and 79 then '75- 79'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 80 and 84 then '80- 84'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 85 and 89 then '85- 89'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 90 and 94 then '90- 94'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 95 and 99 then '95- 99'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 100 and 104 then '100- 104'
		 when SUBSTRING(Edad,1,CHARINDEX(' ', Edad)) Between 105 and 109 then '105- 109'
		 else 'mas de 110' end as Edad, Sexo, perfil
		from Estadisticas_E 
		where Orden>='20200801000' and Orden<='20200831999' 
		and [Estado orden]='Activa' And CodOrigen IN (8) and Perfil=0) as t 
	Group by Edad, Sexo) as n
PIVOT (SUM(perfil) For Sexo in ([Masculino],[Femenino])) p
Order By Edad
	
	