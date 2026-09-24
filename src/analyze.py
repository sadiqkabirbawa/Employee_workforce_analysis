import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

EMP = Path("data/employees.csv")
DEPT = Path("data/departments.csv")
OUT = Path("visualizations")
OUT.mkdir(exist_ok=True)

employees = pd.read_csv(EMP)
departments = pd.read_csv(DEPT)
df = employees.merge(departments, on="department_id", how="left")

print("Shape:", df.shape)
print("\nDescriptive statistics:\n", df[["years_experience","salary","age"]].describe().round(2))
print("\nAverage salary by department:\n", df.groupby("department")["salary"].mean().round(2).sort_values(ascending=False))
print("\nMedian salary:", round(df["salary"].median(),2))
print("Q1:", round(df["salary"].quantile(.25),2))
print("Q3:", round(df["salary"].quantile(.75),2))
print("Experience/salary correlation:", round(df["years_experience"].corr(df["salary"]),3))

plt.figure(figsize=(8,5))
df["salary"].plot(kind="hist", bins=6)
plt.title("Salary Distribution")
plt.xlabel("Salary")
plt.tight_layout()
plt.savefig(OUT/"salary_distribution.png", dpi=150)
plt.close()

plt.figure(figsize=(8,5))
df.groupby("department")["salary"].mean().sort_values().plot(kind="barh")
plt.title("Average Salary by Department")
plt.xlabel("Average Salary")
plt.tight_layout()
plt.savefig(OUT/"average_salary_by_department.png", dpi=150)
plt.close()

plt.figure(figsize=(8,5))
plt.scatter(df["years_experience"], df["salary"])
plt.title("Years of Experience vs Salary")
plt.xlabel("Years of Experience")
plt.ylabel("Salary")
plt.tight_layout()
plt.savefig(OUT/"experience_vs_salary.png", dpi=150)
plt.close()

print("\nDone. Charts saved to visualizations/.")
