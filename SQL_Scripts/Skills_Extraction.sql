USE TanqeebDB;
GO


INSERT INTO Dim_Skills (Skill_Name, Skill_Category)
VALUES 
('SQL', 'Database'), ('Python', 'Programming'), ('Excel', 'Data Analysis'),
('Power BI', 'Data Visualization'), ('Tableau', 'Data Visualization'),
('Machine Learning', 'AI/ML'), ('ETL', 'Data Engineering'), 
('AWS', 'Cloud'), ('Azure', 'Cloud'), ('Snowflake', 'Database'),
('Spark', 'Big Data'), ('Statistics', 'Math'), ('Pandas', 'Programming');


INSERT INTO Bridge_JobSkills (Job_ID, Skill_ID)
SELECT DISTINCT F.Job_ID, S.Skill_ID
FROM Fact_Jobs F
JOIN Raw_Jobs_Data R ON F.Job_Link = R.Job_Link
CROSS JOIN Dim_Skills S
WHERE LOWER(R.Full_Description_Skills) LIKE '%' + LOWER(S.Skill_Name) + '%'
   OR LOWER(R.Job_Title) LIKE '%' + LOWER(S.Skill_Name) + '%';
GO