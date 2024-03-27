

--- We started by creating a join table
SELECT * FROM Absenteeism_at_work a
LEFT JOIN compensation b
ON a.ID = b.ID
LEFT JOIN Reasons r ON
a.Reason_for_absence = r.Number;

--- Finding the healthiest Employees fro the bonus (1 stands for Yes O stands for No) 
SELECT * FROM Absenteeism_at_work
WHERE Social_drinker = 0 AND Social_drinker = 0
AND Body_mass_index < 25 AND 
Absenteeism_time_in_hours < (SELECT AVG(Absenteeism_time_in_hours) FROM Absenteeism_at_work);

--- Compensation increase for non-smokers/ budget $983,221 so .68 per hour / $1414.4 per year
select count(*) as nonsmokers from Absenteeism_at_work
WHERE Social_smoker = 0;

--- OPTIMIZING OUR QUERRY
SELECT 
a.ID, r.Reason,Month_of_absence, Body_mass_index,
CASE WHEN Body_mass_index < 18.5 THEN 'Underweight'
     WHEN Body_mass_index BETWEEN  18.5 AND 25 THEN 'Healthy Weight'
	 WHEN Body_mass_index BETWEEN 25 AND 30 THEN 'Overweight'
	 WHEN Body_mass_index  > 31 THEN 'Obese'
	 ELSE 'Unkown' END AS BMI_Category,

CASE WHEN month_of_absence IN (12,1,2) THEN 'Winter'
     WHEN month_of_absence IN (3,4,5) THEN 'Spring'
	 WHEN month_of_absence IN (6,7,8) THEN 'Summer'
	 WHEN month_of_absence IN (9,10,11) THEN 'Fall'
ELSE 'Unkown' END AS Season_Names,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours

FROM Absenteeism_at_work a
LEFT JOIN compensation b
ON a.ID = b.ID
LEFT JOIN Reasons r ON
a.Reason_for_absence = r.Number;