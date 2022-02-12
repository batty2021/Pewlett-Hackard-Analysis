

-- create retirement titles
SELECT e.emp_no,
       e.first_name,
       e.last_name,
    tl.title,
   tl.from_date,
tl.to_date
   INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS tl
ON(e.emp_no = tl.emp_no)
WHERE(e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;


-- create unique title table by Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
  rt.emp_no,
  rt.first_name,
  rt.last_name,
  rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no ASC, 
rt.to_date DESC;


-- create a Retiring Titles table
SELECT COUNT(ut.title),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
order by ut.count DESC;


-- create a Mentorship Eligibility table  who are eligible to participate in a mentorship program.
SELECT DISTINCT ON (e.emp_no)
  e.emp_no,
  e.first_name,
  e.last_name,
  e.birth_date,
  de.from_date,
  de.to_date,
  tl.title
  INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_employee AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS tl
ON (e.emp_no = tl.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;
 

 
