USE TanqeebDB;
GO

INSERT INTO Dim_Roles (Role_Name)
SELECT DISTINCT Search_Query 
FROM Raw_Jobs_Data
WHERE Search_Query IS NOT NULL AND Search_Query <> '';


ALTER TABLE Dim_Experience 
ALTER COLUMN Exp_Level NVARCHAR(MAX) NOT NULL;
INSERT INTO Dim_Experience (Exp_Level)
SELECT DISTINCT Experience 
FROM Raw_Jobs_Data
WHERE Experience IS NOT NULL AND Experience <> '';


INSERT INTO Dim_Locations (Location_Name)
SELECT DISTINCT 
    CASE 
        WHEN Location IS NULL OR Location = '' OR Location = ' ' THEN 'Not Specified'
        ELSE Location 
    END
FROM Raw_Jobs_Data;

GO