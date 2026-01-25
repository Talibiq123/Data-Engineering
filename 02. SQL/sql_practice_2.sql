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
