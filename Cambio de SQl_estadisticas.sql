USE Enterprise
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE dbo.LabRptEstGet @Lab04C1   INT
                            , @Lab22C3I  INT 
                            , @Lab22C3E  INT
                            , @Lab22C12  CHAR(1)
                            , @Lvl       SMALLINT
                            , @Lv1T      SMALLINT
                            , @Lv1I      INT
                            , @Lv1V      VARCHAR(5000)
                            , @Lv2T      SMALLINT
                            , @Lv2I      INT
                            , @Lv2V      VARCHAR(5000)
                            , @Lv3T      SMALLINT
                            , @Lv3I      INT
                            , @Lv3V      VARCHAR(5000)
                            , @Lv4T      SMALLINT
                            , @Lv4I      INT
                            , @Lv4V      VARCHAR(5000)
                            , @Lab57C8   SMALLINT
                            , @Lab98C2   BIT          
                            , @Lab98CC   VARCHAR(4)
                            , @LabCon    BIT
WITH ENCRYPTION
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED 
    SET NOCOUNT ON
    DECLARE @Intr   NVARCHAR(MAX)
    DECLARE @Select NVARCHAR(2000)
    DECLARE @Join   NVARCHAR(2000)
    DECLARE @Where  NVARCHAR(4000)
    DECLARE @Lab22C1I BIGINT, @Lab22C1E BIGINT
	  
	CREATE TABLE #Examenes ( id int, Codigo varchar(64) NULL)
	
	IF (@Lv1T = 3 AND @Lv1I = 4)
	BEGIN
		IF (@Lv1V = '*')
			INSERT INTO #Examenes(id, Codigo)
			SELECT Lab39c2, Lab39C1 FROM Lab39 
		ELSE
			INSERT INTO #Examenes(id, Codigo)
			SELECT Code, strName FROM dbo.FSPLIT(@Lv1V, ',')  
	END
	ELSE 
	BEGIN 
		IF (@Lv2T = 3 AND @Lv2I = 4)
		BEGIN
			IF (@Lv2V is null)
				INSERT INTO #Examenes(id, Codigo)
				SELECT Lab39c2, Lab39C1 FROM Lab39 
			ELSE
				INSERT INTO #Examenes(id, Codigo)
				SELECT Code, strName FROM dbo.FSPLIT(@Lv2V, ',')
		END
		ELSE
		BEGIN
			IF	(@Lv3T = 3 AND @Lv3I = 4) 
			BEGIN
				IF (@Lv3V is null)
					INSERT INTO #Examenes(id, Codigo)
					SELECT Lab39c2, Lab39C1 FROM Lab39
				ELSE
					INSERT INTO #Examenes(id, Codigo)
					SELECT Code, strName FROM dbo.FSPLIT(@Lv3V, ',')
			END 
			ELSE
			BEGIN
				IF 	(@Lv4T = 3 AND @Lv4I = 4)
				BEGIN
					IF (@Lv4V is null)
						INSERT INTO #Examenes(id, Codigo)
						SELECT Lab39c2, Lab39C1 FROM Lab39
					ELSE
						INSERT INTO #Examenes(id, Codigo)
						SELECT Code, strName FROM dbo.FSPLIT(@Lv4V, ',')
				END
			END
		END
	END

	SET @Select = 'SELECT'
    
    SET @Select = @Select + dbo.LabFn14('Nv1', @Lv1T, @Lv1I, 1, @Lab98CC)
    IF (@Lvl > 1)
    BEGIN
        SET @Select = @Select + dbo.LabFn14('Nv2', @Lv2T, @Lv2I, 0, @Lab98CC)
        IF (@Lvl > 2)
        BEGIN
            SET @Select = @Select + dbo.LabFn14('Nv3', @Lv3T, @Lv3I, 0, @Lab98CC)
            IF (@Lvl > 3)
            BEGIN
                SET @Select = @Select + dbo.LabFn14('Nv4', @Lv4T, @Lv4I, 0, @Lab98CC)
            END
            ELSE
            BEGIN
               IF (@LabCon = 1)
                   SET @Select = @Select + dbo.LabFn14('Nv4', 100, 0, 0, @Lab98CC)
               ELSE
                   SET @Select = @Select + dbo.LabFn14('Nv4', 4, 0, 0, @Lab98CC)
            END
        END
        ELSE
        BEGIN
            IF (@LabCon = 1)
                SET @Select = @Select + dbo.LabFn14('Nv3', 100, 0, 0, @Lab98CC)
            ELSE
                SET @Select = @Select + dbo.LabFn14('Nv3', 4, 0, 0, @Lab98CC)
            
            SET @Select = @Select + dbo.LabFn14('Nv4', 100, 0, 0, @Lab98CC)
        END
    END
    ELSE
    BEGIN
        IF (@LabCon = 1)
            SET @Select = @Select + dbo.LabFn14('Nv2', 100, 0, 0, @Lab98CC)
        ELSE
            SET @Select = @Select + dbo.LabFn14('Nv2',   4, 0, 0, @Lab98CC)
        
        SET @Select = @Select + dbo.LabFn14('Nv3', 100, 0, 0, @Lab98CC)
        SET @Select = @Select + dbo.LabFn14('Nv4', 100, 0, 0, @Lab98CC)
    END

    IF (@LabCon = 0)
    BEGIN    
        SET @Select = @Select + ', Lab57C1'
        SET @Select = @Select + ', Lab57.Lab39C1'
        SET @Select = @Select + ', Lab39.Lab39C2 + ''-'' + ISNULL(Lab39.Lab39C12,Lab39.Lab39C3) Lab39C3'
        SET @Select = @Select + ', (SELECT COUNT(*) FROM Lab29 WHERE Lab29C4 = ''R'' AND Lab29.Lab57C1 = Lab57.Lab57C1) Lab29'
        SET @Select = @Select + ', CASE WHEN Lab57C10 > 0 THEN 1 ELSE 0 END Lab57C10'
        SET @Select = @Select + ', CAST(Lab57C23 AS INT) Lab57C23'
        SET @Select = @Select + ', CASE WHEN Lab39C33 > 0 THEN Lab39C33 ELSE 1 END AS Lab39C33'
    END
    
    SET @Select = @Select + ', Lab21C6'
    SET @Select = @Select + ', dbo.LabFn01(Lab21C2, @Lab98CC) Lab21C2'
    SET @Select = @Select + ', Lab22.Lab22C1'
    SET @Select = @Select + ', MONTH(Lab22C14) Lab22C3'
    
    IF (@LabCon = 1)
    BEGIN
        SET @Select = @Select + ' FROM   Lab22 WITH (NOLOCK) '
        SET @Join = 'INNER  JOIN Lab21 WITH (NOLOCK) ON (Lab21.Lab21C1 = Lab22.Lab21C1) '
    END
    ELSE
    BEGIN
        SET @Select = @Select + ' FROM   Lab57 WITH (NOLOCK) '
        SET @Join = 'INNER  JOIN Lab22 WITH (NOLOCK) ON (Lab22.Lab22C1 = Lab57.Lab22C1) '
        SET @Join = @Join + 'INNER  JOIN Lab21 WITH (NOLOCK) ON (Lab21.Lab21C1 = Lab22.Lab21C1) '
        SET @Join = @Join + 'INNER  JOIN Lab39 WITH (NOLOCK) ON (Lab39.Lab39C1 = Lab57.Lab39C1) ' 
    END
    
    SET @Join = @Join + dbo.LabFn15('Nv1', @Lv1T, @Lv1I, 0, 0)
    IF (@Lvl > 1)
    BEGIN
        SET @Join = @Join + dbo.LabFn15('Nv2', @Lv2T, @Lv2I, 0, 0)
        IF (@Lvl > 2)
        BEGIN
            SET @Join = @Join + dbo.LabFn15('Nv3', @Lv3T, @Lv3I, 0, 0)
            IF (@Lvl > 3)
                SET @Join = @Join + dbo.LabFn15('Nv4', @Lv4T, @Lv4I, 0, 0)
        END
    END

    SET @Where =  'WHERE Lab22.Lab22C13 = 0 '
    SET @Where = @Where + 'AND    Lab22.Lab07C1 = 1 '
    
    SET @Where = @Where + dbo.LabFn16('Nv1', @Lv1T, @Lv1I, @Lv1V, 0, 0)
    IF (@Lvl > 1)
    BEGIN
        SET @Where = @Where + dbo.LabFn16('Nv2', @Lv2T, @Lv2I, @Lv2V, 0, 0)
        IF (@Lvl > 2)
        BEGIN
            SET @Where = @Where + dbo.LabFn16('Nv3', @Lv3T, @Lv3I, @Lv3V, 0, 0)
            IF (@Lvl > 3)
                SET @Where = @Where + dbo.LabFn16('Nv4', @Lv4T, @Lv4I, @Lv4V, 0, 0)
        END
    END
    
    IF (@Lab22C12 IS NOT NULL) 
        SET @Where = @Where + 'AND Lab22C12 = @Lab22C12 '

    SET @Where = @Where + 'AND Lab22C3 > @Lab22C3I AND Lab22C3 < @Lab22C3E '
    
    SELECT @Lab22C1E = MAX(Lab22C1) + 1 FROM Lab22 WHERE Lab22C3 > @Lab22C3I AND Lab22C3 < @Lab22C3E
    SELECT @Lab22C1I = MIN(Lab22C1) - 1 from Lab22 WHERE Lab22C3 > @Lab22C3I AND Lab22C3 < @Lab22C3E
 
    SET @Where = @Where + 'AND Lab22.Lab22C1 > @Lab22C1I AND Lab22.Lab22C1 < @Lab22C1E '
        
    IF (@LabCon = 1)
    BEGIN
        IF (@Lab57C8 = 3)
            SET @Where = @Where + 'AND EXISTS(SELECT 1 FROM Lab57 WITH (NOLOCK) INNER JOIN Lab39 (NOLOCK) ON (Lab39.Lab39C1 = Lab57.Lab39C1) WHERE Lab39.Lab39C52 = 1 AND (Lab57C8 = 8 AND NOT EXISTS(SELECT 1 FROM Lab57 v WHERE v.Lab22c1 = Lab57.Lab22C1 AND v.Lab46C4 = Lab57.Lab39C1 AND Lab57C8 IN (1,2,3,4,7))) AND Lab57C6 IN (1,3) AND Lab22C1 = Lab22.Lab22C1) '
        ELSE              
        BEGIN
            IF (@Lab57C8 = 2)
                SET @Where = @Where + 'AND EXISTS(SELECT 1 FROM Lab57 WITH (NOLOCK) INNER JOIN Lab39 (NOLOCK) ON (Lab39.Lab39C1 = Lab57.Lab39C1) WHERE Lab39.Lab39C52 = 1 AND (Lab57C8 > 6 AND NOT EXISTS(SELECT 1 FROM Lab57 v WHERE v.Lab22c1 = Lab57.Lab22C1 AND v.Lab46C4 = Lab57.Lab39C1 AND Lab57C8 IN (1,2,3,4))) AND Lab57C6 IN (1,3) AND Lab22C1 = Lab22.Lab22C1) '
            ELSE              
            BEGIN
                SET @Where = @Where + 'AND EXISTS(SELECT 1 FROM Lab57 WITH (NOLOCK) WHERE Lab57C6 IN (1,3) AND Lab22C1 = Lab22.Lab22C1 AND Lab22C1 < @Lab22C1E AND Lab22C1 > @Lab22C1I) '
            END
        END
    END
    ELSE
    BEGIN
        --____Falta: Revisar (Estos son examenes procesados)
        IF (@Lab57C8 = 3)
            SET @Where = @Where + 'AND Lab39.Lab39C52 = 1 AND (Lab57C8 = 8 AND NOT EXISTS(SELECT 1 FROM Lab57 v WITH(NOLOCK) WHERE v.Lab22c1 = Lab57.Lab22C1 AND v.Lab46C4 = Lab57.Lab39C1 AND Lab57C8 IN(1,2,3,4,7))) '
        IF (@Lab57C8 = 2)
            SET @Where = @Where + 'AND Lab39.Lab39C52 = 1 AND (Lab57C8 > 6 AND NOT EXISTS(SELECT 1 FROM Lab57 v WITH(NOLOCK) WHERE v.Lab22c1 = Lab57.Lab22C1 AND v.Lab46C4 = Lab57.Lab39C1 AND Lab57C8 IN (1,2,3,4))) '
        SET @Where = @Where + 'AND Lab57C6 IN (1,3) ' --_____Participa en estadísticas.
    END
        
    IF @Lab98C2 = 1
        SET @Where = @Where + 'AND EXISTS(SELECT 1 FROM Lab93 WHERE Lab93.Lab63C1 = Lab22.Lab63C1 AND Lab93.Lab04C1 = @Lab04C1) '

    SET @Intr = @Select + @Join + @Where + ' ORDER BY 1, 3, 5, 7, 10'
    
    EXEC sp_executesql @Intr, N'@Lab22C3I INT, @Lab22C3E INT, @Lab22C12 VARCHAR, @Lab04C1 INT, @Lab98CC VARCHAR(4), @Lab22C1I BIGINT, @Lab22C1E BIGINT', @Lab22C3I, @Lab22C3E, @Lab22C12, @Lab04C1, @Lab98CC, @Lab22C1I, @Lab22C1E
END
GO