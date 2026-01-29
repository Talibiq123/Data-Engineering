Q8. Show how many patients have a birth_date with 2010 as the birth year.
select
	count(*) as total_patients
from
	patients
where
	year(birth_date) = 2010;

Q9. Show the first_name, last_name, and height of the patient with the greatest height.
SELECT
    p.first_name,
    p.last_name,
    p.height
FROM
    patients AS p
WHERE
    p.height = (
        SELECT
            MAX(height)
        FROM
            patients
    );

Q10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000.
SELECT
    p.*
FROM
    patients AS p
WHERE
    p.patient_id IN (1, 45, 534, 879, 1000);

Q11. Show the total number of admissions.
select
	count(*) as total_addmission
from
	admissions;

Q12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
select
	*
from
	admissions
where
	admission_date = discharge_date;


Q13. Show the patient id and the total number of admissions for patient_id 579.
select
	patient_id, count(*) as total_admissions
from
	admissions
where 
	patient_id = 579
group by
	patient_id;


Q14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'.
SELECT DISTINCT(city) AS unique_cities
FROM patients
WHERE province_id = 'NS';

Q15. Write a query to find the first_name, last name and birth date of patients who has height greater than 160 and weight greater than 70.
select first_name, last_name, birth_date
from patients
where height > 160 and weight > 70;

Q16. Write a query to find list of patients first_name, last_name, and allergies where allergies are not null and are from the city of 'Hamilton'.
select first_name, last_name, allergies
from patients
where allergies is not null and city = 'Hamilton';

Q17. Show unique birth years from patients and order them by ascending.
select distinct year(birth_date) as birth_year
from patients
order by birth_year;

Q18. 
Show unique first names from the patients table which only occurs once in the list.

For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.


select first_name
from patients
group by first_name
having count(*) = 1;

Q19. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
select patient_id, first_name
from patients
where first_name like 's%s' and len(first_name) >= 6;

Q19. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'. Primary diagnosis is stored in the admissions table.
select p.patient_id, p.first_name, p.last_name
from patients as p join admissions as a 
on p.patient_id = a.patient_id
where a.diagnosis = 'Dementia';

Q20. Display every patient's first_name. Order the list by the length of each name and then by alphabetically.
select first_name
from patients
order by len(first_name), first_name;

Q21. Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.
select
	(select count(*) from patients where gender = 'M') as male_count,
    (select count(*) from patients where gender = 'F') as female_count;


Q22. Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
select first_name, last_name, allergies
from patients
where allergies = 'Penicillin' or allergies = 'Morphine'
order by allergies, first_name, last_name;

Q23. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
select patient_id, diagnosis
from admissions
group by patient_id, diagnosis
having count(*) > 1;

Q24. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
SELECT
  city,
  COUNT(*) AS num_patients
FROM patients
GROUP BY city
ORDER BY num_patients DESC, city asc;


Q25. Show first name, last name and role of every person that is either patient or doctor. The roles are either "Patient" or "Doctor"
SELECT
    first_name,
    last_name,
    'Patient' AS role
FROM patients

UNION ALL

SELECT
    first_name,
    last_name,
    'Doctor' AS role
FROM doctors;


Q26. Show all allergies ordered by popularity. Remove NULL values from query.
SELECT
    allergies,
    COUNT(*) AS popularity
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY popularity DESC;


Q27. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
select first_name, last_name, birth_date
from patients
where year(birth_date) between 1970 and 1979
order by birth_date asc;


Q28. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
EX: SMITH,jane

select concat(upper(last_name), ",", lower(first_name)) as full_name
from patients
order by first_name desc;

Q29. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
select province_id, sum(height) as sum_height
from patients
group by province_id
having sum_height >= 7000;

Q30. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'.
select ( max(weight) - min(weight) ) as weight_delta
from patients
where last_name = 'Maroni';


Q31. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
SELECT
    DAY(admission_date) AS day_of_month,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY day_of_month
ORDER BY total_admissions DESC;


Q32. 