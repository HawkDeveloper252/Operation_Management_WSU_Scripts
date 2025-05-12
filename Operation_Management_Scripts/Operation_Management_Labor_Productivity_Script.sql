--Created By Andrew Hawkins
--Created On 5.12.2025
--DESCRIPTION: Creating a table to find the values for labor productivity and finding the max value and also the max crew size 
--CREATE DATABASE Operation_Management;
--DROP statements to ensure the creation of the table to improve mobility
DROP VIEW IF EXISTS labor_productivity_2;
DROP TABLE IF EXISTS labor_productivity;
--Created a Table to find the labor productivity 
CREATE TABLE labor_productivity(
	Week INT PRIMARY KEY, 
	Crew DECIMAL(7,2), 
	Yard_Installed DECIMAL(7,2));
--inserted the table values into a SQL table 
INSERT INTO labor_productivity
VALUES 
	(1,4,78),
	(2,2,60),
	(3,4,92),
	(4,5,100),
	(5,4,99),
	(6,5,97);
--Making sure all of my values are in the table
SELECT * FROM labor_productivity;
--Found the labor productivity per week as the crew size based on the Labor Productivity, 
SELECT Week, Crew, round(Yard_Installed/Crew,2) as "Labor Productivity" FROM labor_productivity;
--I am trying to find the crew size where it matches the maximum labor productivity 
CREATE VIEW labor_productivity_2 
	AS SELECT 
		round(lp.Crew,2) as "Crew Size", 
		lp.Yard_Installed as "Yards_Installed", 
		round(lp.Yard_Installed/lp.Crew,2) as "Labor Productivity" 
		FROM labor_productivity as lp;  
--Finding the maximum crew size where the maximum labor productivity is met
	SELECT 
		"Crew Size", 
		"Labor Productivity"
	FROM 
		labor_productivity_2
		WHERE 
		"Labor Productivity" = (SELECT MAX("Labor Productivity") FROM labor_productivity_2);
