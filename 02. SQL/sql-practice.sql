https://www.sql-practice.com/


Q1. Show first name, last name, and gender of patients whose gender is 'M'.
Query:

select first_name, last_name, gender
from patients
where gender = 'M';

Q2. Show first name and last name of patients who does not have allergies. (null)
Query:

select first_name, last_name
    FROM patients
    where allergies IS null;


Q3. Show first name of patients that start with the letter 'C'.
Query 1:

select first_name
    from patients
    where first_name like 'C%';

Query 2:

select first_name
    from patients
    where substring(first_name, 1, 1) = 'C';


Q4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive).
Query 1:
	select first_name, last_name
    from patients
    where weight between 100 and 120;

Query 2:
    SELECT first_name, last_name
    FROM patients
    WHERE weight >= 100 AND weight <= 120;

Q5. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'.
Query: 
    update patients
    set allergies = 'NKA'
    where allergies is null;

Q6. Show first name and last name concatinated into one column to show their full name.
Query:
    select concat(first_name, ' ', last_name) as Full_name
    from patients;


Q7. Show first name, last name, and the full province name of each patient. Example: 'Ontario' instead of 'ON'.
Query: 
    select p.first_name, p.last_name, pn.province_name
    from patients p join province_names pn on p.province_id = pn.province_id;

Q8. Show how many patients have a birth_date with 2010 as the birth year.
Query: 
    select count(patient_id) 
    from patients
    where year(birth_date) = 2010;

Q9. Show the first_name, last_name, and height of the patient with the greatest height.
Query:
    select first_name, last_name, max(height)
    from patients;

Q10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000.
Qurey:
    select * 
    from patients
    where patient_id in (1, 45, 534, 879, 1000);

Q11. Show the total number of admissions.
Query: 
    select count(*) as total_admissions
    from admissions;

Q12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
Query:
    select *
    from admissions
    where admission_date = discharge_date;

Q13. Show the patient id and the total number of admissions for patient_id 579.
Query: 
    select patient_id, count(*) as total_admissions
    from admissions
    where patient_id = 579;

Q14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'.
Query 1: 
    select distinct city
    from patients
    where province_id = 'NS';


Query 2:
    SELECT city
    FROM patients
    GROUP BY city
    HAVING province_id = 'NS';

Q15. Write a query to find the first_name, last name and birth date of patients who has height greater than 160 and weight greater than 70.
Query: 
    select first_name, last_name, birth_date
    from patients
    where height > 160 and weight > 70;

Q16. Write a query to find list of patients first_name, last_name, and allergies where allergies are not null and are from the city of 'Hamilton'.
Query: 
    select first_name, last_name, allergies
    from patients
    where allergies is not null AND city = 'Hamilton';

Q17. Show unique birth years from patients and order them by ascending.
Query 1:
    select year(birth_date)
    from patients
    group by year(birth_date)
    order by year(birth_date);

Query 2:
SELECT
  DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year;

Q18. Show unique first names from the patients table which only occurs once in the list. For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.

Query 1: 
select first_name
from patients
group by first_name
having count(*) = 1;

Query 2:
SELECT first_name
FROM (
    SELECT
      first_name,
      count(first_name) AS occurrencies
    FROM patients
    GROUP BY first_name
  )
WHERE occurrencies = 1

Q19. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
Query 1: 
SELECT
  patient_id,
  first_name
FROM patients
WHERE first_name LIKE 's____%s';

Query 2:
SELECT
  patient_id,
  first_name
FROM patients
WHERE
  first_name LIKE 's%s'
  AND len(first_name) >= 6;

Query 3:
SELECT
  patient_id,
  first_name
FROM patients
where
  first_name like 's%'
  and first_name like '%s'
  and len(first_name) >= 6;

Q20. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'. Primary diagnosis is stored in the admissions table.
Query 1:
select p.patient_id, p.first_name, p.last_name
from patients p join admissions a on p.patient_id = a.patient_id
where a.diagnosis = 'Dementia';

Query 2:
SELECT
  patient_id,
  first_name,
  last_name
FROM patients
WHERE patient_id IN (
    SELECT patient_id
    FROM admissions
    WHERE diagnosis = 'Dementia'
  );

  Query 3:
  SELECT
  patient_id,
  first_name,
  last_name
FROM patients p
WHERE 'Dementia' IN (
    SELECT diagnosis
    FROM admissions
    WHERE admissions.patient_id = p.patient_id
  );

  Q21: Display every patient's first_name. Order the list by the length of each name and then by alphabetically.
Query 1: 
select first_name
from patients
order by len(first_name), first_name;

Q22. Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row.
Query 1: 
SELECT 
  (SELECT COUNT(*) FROM patients WHERE gender = 'M') AS male_count,
  (SELECT COUNT(*) FROM patients WHERE gender = 'F') AS female_count;

Query 2:
select
	sum(gender = 'M') as male_count,
    sum(gender = 'F') as female_count
from patients;

Q23. Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
Query 1:
SELECT first_name, last_name, allergies
FROM patients
WHERE allergies = 'Penicillin' OR allergies = 'Morphine'
ORDER BY allergies ASC, first_name ASC, last_name ASC;

Q24. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
Query 1:
SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(*) > 1;

Q25. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
Query 1: 
select city, count(patient_id) as num_patients
from patients
group by city
order by count(patient_id) desc, city;

Q26. Show first name, last name and role of every person that is either patient or doctor. The roles are either "Patient" or "Doctor".
Query 1: 
SELECT first_name, last_name, 'Patient' AS role
FROM patients

UNION ALL

SELECT first_name, last_name, 'Doctor' AS role
FROM doctors;

Q27. Show all allergies ordered by popularity. Remove NULL values from query.
Query 1:
SELECT
  allergies,
  COUNT(*) AS total_diagnosis
FROM patients
WHERE
  allergies IS NOT NULL
GROUP BY allergies
ORDER BY total_diagnosis DESC

Q28. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
Query 1:
SELECT
  first_name,
  last_name,
  birth_date
FROM patients
WHERE
  YEAR(birth_date) BETWEEN 1970 AND 1979
ORDER BY birth_date ASC;

Query 2:
SELECT
  first_name,
  last_name,
  birth_date
FROM patients
WHERE
  birth_date >= '1970-01-01'
  AND birth_date < '1980-01-01'
ORDER BY birth_date ASC

Query 3:
SELECT
  first_name,
  last_name,
  birth_date
FROM patients
WHERE year(birth_date) LIKE '197%'
ORDER BY birth_date ASC

Q29. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
EX: SMITH,jane

Query 1:
SELECT CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS full_name
FROM patients
ORDER BY first_name DESC;


Q30. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
Query 1: 
 select province_id, sum(height) as sum_height
 from patients
 group by province_id
 having sum_height >= 7000;

 Query 2:
 select * from (select province_id, SUM(height) as sum_height FROM patients group by province_id) where sum_height >= 7000;


 Q31. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'.
 Query 1:
 SELECT MAX(weight) - MIN(weight) AS weight_difference
FROM patients
WHERE last_name = 'Maroni';




Q32. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
Query 1:
SELECT 
  DAY(admission_date) AS day_of_month,
  COUNT(*) AS admission_count
FROM admissions
GROUP BY day_of_month
ORDER BY admission_count DESC;




Q33. Show all columns for patient_id 542's most recent admission_date.
Query 1:


























