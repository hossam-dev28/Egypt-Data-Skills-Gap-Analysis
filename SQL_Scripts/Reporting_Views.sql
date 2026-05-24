USE TanqeebDB;
GO

CREATE OR ALTER VIEW vw_FinalJobMarketData AS
SELECT 
    F.Job_ID, F.Job_Title, F.Company, L.Location_Name, R.Role_Name,
    E.Exp_Level, S.Skill_Name, S.Skill_Category
FROM Fact_Jobs F
LEFT JOIN Dim_Roles R ON F.Role_ID = R.Role_ID
LEFT JOIN Dim_Experience E ON F.Exp_ID = E.Exp_ID
LEFT JOIN Dim_Locations L ON F.Location_ID = L.Location_ID
LEFT JOIN Bridge_JobSkills B ON F.Job_ID = B.Job_ID
LEFT JOIN Dim_Skills S ON B.Skill_ID = S.Skill_ID;
GO