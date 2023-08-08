/******CÓDIGO 28 - DESP. INVESTIMENTO  ************/
	IF @Tp_Rel IN ('28', 'P', 'T', '', 'C')
	BEGIN
		SET @exec1  =
		CONCAT(
		'
		INSERT INTO #FluxoFinanceiro

		SELECT *
		   FROM OPENQUERY( SRV_TOTVS ,
		''
			 SELECT ''''28 - DESP. INVESTIMENTO'''' AS DESCRICAO, 
				 E5_TIPO, E5_MOEDA,  
				 CASE WHEN E5_RECPAG = ''''P'''' THEN E5_VALOR ELSE -(E5_VALOR) END E5_VALOR
				 , E5_NATUREZ, E5_BANCO, E5_CONTA, E5_NUMCHEQ,
				 E5_DOCUMEN, E5_RECPAG, E5_BENEF, E5_HISTOR,
				 E5_TIPODOC, E5_SITUACA, E5_PREFIXO, E5_NUMERO, E5_PARCELA, E5_CLIFOR, E5_MOTBX, E5_DTDISPO, E5_KEY, E5_DTCANBX, E5_TABORI, R_E_C_N_O_
			FROM DADOSP12.dbo.SE5010 WITH(NOLOCK)
			WHERE E5_FILIAL=''''''''
				AND (E5_NATUREZ IN (
								   ''''209047'''', ''''709016'''', ''''709017'''', ''''709006'''', ''''709005'''', ''''709004'''', ''''709015'''', ''''709009'''', ''''709008'''', ''''709003'''', ''''209022'''',
								   ''''709010'''', ''''709012'''', ''''709011'''', ''''709013'''', ''''709014'''', ''''709007'''', ''''709001'''', ''''709002'''', ''''600244'''', ''''209018'''', ''''209996'''', 
								   ''''209998'''', ''''209997'''', ''''209999'''', ''''209016'''', ''''209017'''', ''''209006'''', ''''209024'''', ''''209030'''', ''''209005'''', ''''209019'''', ''''209020'''', 
								   ''''209044'''', ''''209043'''', ''''209004'''', ''''209015'''', ''''209009'''', ''''209042'''', ''''209041'''', ''''209008'''', ''''209027'''', ''''209036'''', ''''209003'''', 
								   ''''209037'''', ''''209010'''', ''''209028'''', ''''209038'''', ''''209040'''', ''''209039'''', ''''209012'''', ''''209029'''', ''''209011'''', ''''209025'''', ''''209013'''', 
								   ''''209023'''', ''''209021'''', ''''209014'''', ''''209032'''', ''''209033'''', ''''209007'''', ''''209035'''', ''''209034'''', ''''209001'''', ''''600978'''', ''''209046'''', 
								   ''''209045'''', ''''209002'''', ''''209026'''', ''''600979'''', ''''209031'''', ''''209048'''', ''''209049'''', ''''209050''''
								   )
					OR E5_NATUREZ IN (SELECT ED_CODIGO FROM SED010 WHERE ED_FILIAL='' AND ED_ZNATFLU=''''28'''')
					)
				AND E5_BANCO NOT IN (''''CXA'''', ''''CX1'''',''''CX2'''', ''''CX3'''', ''''CX4'''', ''''CX5'''',''''999'''', ''''CRT'''')
				AND E5_RECPAG=''''P''''
				AND E5_TIPODOC NOT IN (''''JR'''',''''MT'''', ''''DC'''')
				AND E5_SITUACA =''''''''
				AND E5_MOTBX IN (''''NOR'''',''''DEB'''')
				AND (E5_DTDISPO BETWEEN ''''', @dtIni, ''''' AND ''''', @dtFim , ''''' )
				AND E5_KEY = ''''''''
				AND D_E_L_E_T_='''''''' 
				AND (E5_DTCANBX ='''''''' OR E5_DTCANBX <> E5_DTDISPO)
		'' )
		' )

		exec( @exec1 )

		INSERT INTO  #FluxoFinanceiro (DESCRICAO, E5_TIPO, E5_MOEDA,  E5_VALOR, E5_NATUREZ, E5_BANCO, E5_CONTA, E5_NUMCHEQ, E5_DOCUMEN, E5_RECPAG, E5_BENEF, E5_HISTOR,
		E5_TIPODOC, E5_SITUACA, E5_PREFIXO, E5_NUMERO, E5_PARCELA, E5_CLIFOR, E5_MOTBX, E5_DTDISPO, E5_KEY, E5_DTCANBX, E5_TABORI, R_E_C_N_O_) VALUES 			
		('28 - DESP. INVESTIMENTO','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0')

	END