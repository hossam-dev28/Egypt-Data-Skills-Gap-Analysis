USE TanqeebDB;
GO


ALTER TABLE Fact_Jobs
ADD Location_ID INT;
GO

ALTER TABLE Fact_Jobs
ADD CONSTRAINT FK_Location FOREIGN KEY (Location_ID) REFERENCES Dim_Locations(Location_ID);
GO

INSERT INTO Fact_Jobs (Job_Title, Company, Job_Link, Role_ID, Exp_ID, Location_ID)
SELECT 
    R.Job_Title, 
    R.Company, 
    R.Job_Link,
    DR.Role_ID,
    DE.Exp_ID,
    DL.Location_ID
FROM Raw_Jobs_Data R
LEFT JOIN Dim_Roles DR ON R.Search_Query = DR.Role_Name
LEFT JOIN Dim_Experience DE ON R.Experience = DE.Exp_Level
LEFT JOIN Dim_Locations DL ON 
    CASE 
        WHEN R.Location IS NULL OR R.Location = '' OR R.Location = ' ' THEN 'Not Specified'
        ELSE R.Location 
    END = DL.Location_Name;
GO
