rs = st1.executeQuery("Select Historia,Apellidos,Nombres, [Fecha orden], Sexo, Edad, Metodo, Examen, Resultado from Estadisticas_E where Orden>='" + oi+"' and Orden<='" + of+"' and Codigo="+examen+" and [Estado orden]='Activa' Order by Orden");
		           
				   
Select [Tipo Doc] as [TIPO DE IDENTIFICACION], Historia as [NUMERO DE IDENTIFICACION],Nombres + ' ' + Apellidos as [NOMBRES Y APELLIDOS], [Fecha orden] as [FECHA_TOMA_EXAMEN], Examen as [NOMBRE_EXAMEN], Resultado as [RESULTADO] From Estadisticas_E Where ((Codigo=1015  And Resultado>='0.2' and Resultado <'26') Or (Codigo=1044  And Resultado>='1' and Resultado <'9000') Or (Codigo=1016  And Resultado>='4' and Resultado <'700') Or (Codigo=1009  And Resultado>='1' and Resultado <'1500') Or (Codigo=1010  And Resultado>='1' and Resultado <'200') Or (Codigo=1011  And Resultado>='1' and Resultado <'1000') Or (Codigo=1013  And Resultado>='1' and Resultado <'4000') Or (Codigo=100913  And Resultado>='0' and Resultado <='5000') Or (Codigo=1000  And Resultado>='10' and Resultado <'800') Or (Codigo=2107  And Resultado>='3' and Resultado <='23') Or (Codigo=2043  And Resultado>'3' and Resultado <='23') Or (Codigo=1040  And Resultado>'0.5' and Resultado <='10') Or (Codigo=1046  And Resultado>'0.1' and Resultado <='12')) And Orden>='" + oi+"' and Orden<='" + of+"' and [Estado orden]='Activa' Order by Examen,Codigo");

 (Codigo=1009 And Resultado>='1' And Resultado<'1500') OR (Codigo=1015 And Resultado>='0.2' And Resultado<'26') OR (Codigo=1044 And Resultado>='1' And Resultado<'9000') OR (Codigo=1016 And Resultado>='4' And Resultado<'700') OR (Codigo=1010 And Resultado>='1' And Resultado<'200') OR (Codigo=1011 And Resultado>='1' And Resultado<'1000') OR (Codigo=1013 And Resultado>='1' And Resultado<'4000') OR (Codigo=100913 And Resultado>='0' And Resultado<='5000') OR (Codigo=1000 And Resultado>='10' And Resultado<'800') OR (Codigo=2107 And Resultado>='3' And Resultado<='23') OR (Codigo=2043 And Resultado>='3' And Resultado<='23') OR (Codigo=1040 And Resultado>='0.5' And Resultado<='10') OR (Codigo=1046 And Resultado>='0.1' And Resultado<='12')
 ((Codigo=1015  And Resultado>='0.2' and Resultado <'26') Or (Codigo=1044  And Resultado>='1' and Resultado <'9000') Or (Codigo=1016  And Resultado>='4' and Resultado <'700') Or (Codigo=1009  And Resultado>='1' and Resultado <'1500') Or (Codigo=1010  And Resultado>='1' and Resultado <'200') Or (Codigo=1011  And Resultado>='1' and Resultado <'1000') Or (Codigo=1013  And Resultado>='1' and Resultado <'4000') Or (Codigo=100913  And Resultado>='0' and Resultado <='5000') Or (Codigo=1000  And Resultado>='10' and Resultado <'800') Or (Codigo=2107  And Resultado>='3' and Resultado <='23') Or (Codigo=2043  And Resultado>'3' and Resultado <='23') Or (Codigo=1040  And Resultado>'0.5' and Resultado <='10') Or (Codigo=1046  And Resultado>'0.1' and Resultado <='12'))



		           
