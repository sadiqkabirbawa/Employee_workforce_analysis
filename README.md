# Employee Workforce Analysis

A compact SQL + Python + statistics project for practicing relational data analysis.

## What it demonstrates
- SELECT / WHERE
- GROUP BY / HAVING
- Aggregation
- JOINs
- Descriptive statistics
- Correlation
- Visualization

## Data
A small **synthetic practice dataset** is included so the project can run immediately. It is deliberately labelled synthetic and is not intended to make real-world salary claims.

For a final portfolio, you may replace it with a properly licensed public workforce dataset and update the source information.

## Analysis questions
1. How many employees are in each department?
2. What is average salary by department?
3. Which departments are above the overall salary average?
4. What are the highest-paid roles?
5. How does salary vary with experience?
6. What is the salary range by department?
7. What are median and quartile salaries?
8. How many employees are in each role?
9. What is the relationship between experience and salary?

## Run
```bash
pip install -r requirements.txt
python src/analyze.py
```

SQL examples are in `sql/analysis.sql`.

## Interview explanation
"I used SQL for relational questions, aggregation and joins, then used Python for descriptive statistics and visualization. I also examined the experience-salary relationship while recognizing that correlation does not establish causation."

## Limitations
The included dataset is synthetic and small. It demonstrates the analytical method rather than real labor-market conditions.
