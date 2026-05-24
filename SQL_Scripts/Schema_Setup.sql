USE TanqeebDB;
GO


CREATE TABLE Dim_Roles (
    Role_ID INT PRIMARY KEY IDENTITY(1,1),
    Role_Name NVARCHAR(255) NOT NULL
);

CREATE TABLE Dim_Experience (
    Exp_ID INT PRIMARY KEY IDENTITY(1,1),
    Exp_Level NVARCHAR(255) NOT NULL
);


CREATE TABLE Dim_Skills (
    Skill_ID INT PRIMARY KEY IDENTITY(1,1),
    Skill_Name NVARCHAR(255) NOT NULL,
    Skill_Category NVARCHAR(100) NULL
);


CREATE TABLE Dim_Locations (
    Location_ID INT PRIMARY KEY IDENTITY(1,1),
    Location_Name NVARCHAR(255) NOT NULL
);


CREATE TABLE Fact_Jobs (
    Job_ID INT PRIMARY KEY IDENTITY(1,1),
    Job_Title NVARCHAR(MAX),
    Company NVARCHAR(MAX),
    Location_ID	INT,
    Job_Link NVARCHAR(MAX),
    Role_ID INT,
    Exp_ID INT,
    
    CONSTRAINT FK_Job_Role FOREIGN KEY (Role_ID) REFERENCES Dim_Roles(Role_ID),
    CONSTRAINT FK_Job_Experience FOREIGN KEY (Exp_ID) REFERENCES Dim_Experience(Exp_ID),
    CONSTRAINT FK_Location FOREIGN KEY (Location_ID) REFERENCES Dim_Locations(Location_ID)
);



CREATE TABLE Bridge_JobSkills (
    Job_ID INT,
    Skill_ID INT,
    
    PRIMARY KEY (Job_ID, Skill_ID),
    
    CONSTRAINT FK_Bridge_Job FOREIGN KEY (Job_ID) REFERENCES Fact_Jobs(Job_ID),
    CONSTRAINT FK_Bridge_Skill FOREIGN KEY (Skill_ID) REFERENCES Dim_Skills(Skill_ID)
);
GO



