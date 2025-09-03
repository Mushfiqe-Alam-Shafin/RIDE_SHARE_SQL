
🚖 RideShare SQL Analytics Project
📌 Overview

This project simulates a ride-share company database and demonstrates how to analyze it using SQL queries.
The goal is to practice advanced SQL techniques such as JOIN, CASE, LEAD, LAG, RANK, CTE, Subquery, CUME_DIST, PERCENT_RANK, and date functions.

The dataset consists of synthetic CSV files generated with realistic ride-share patterns, which can be imported into SQLite (DB Lite) or any other SQL database.

📂 Dataset Files

The project includes four CSV files:

drivers.csv

driver_id (PK)

name

vehicle_type

rating

city

riders.csv

rider_id (PK)

name

signup_date

city

rides.csv

ride_id (PK)

rider_id (FK)

driver_id (FK)

pickup_time

dropoff_time

pickup_location

dropoff_location

fare

payment_method

payments.csv

payment_id (PK)

ride_id (FK)

amount

payment_date

status (Completed, Pending, Failed)

🎯 SQL Problems Covered

This project explores 10 SQL challenges using the dataset:

JOINs → Rider & Driver details per ride

CASE → Categorize rides based on fare ranges

LEAD → Compare rider’s current and next ride fare

LAG → Compare driver’s current and previous ride fare

RANK → Rank riders by total spending within each city

CTE → Drivers with average fare above overall average

Subquery → Riders spending more than average

CUME_DIST → Distribution of driver ratings

PERCENT_RANK → Percentile ranking of riders by spending

Date Functions → Difference in days between first and last ride

⚡ Tools Used

SQLite (DB Browser for SQLite / DB Lite) for running queries

Python (pandas, random, datetime) for generating sample CSVs

GitHub for project version control

🚀 How to Use

Clone this repository:

git clone https://github.com/your-username/rideshare-sql-analytics.git
cd rideshare-sql-analytics


Open DB Browser for SQLite (or your preferred tool).

Import the CSV files into tables (drivers, riders, rides, payments).

Run the SQL queries provided in queries.sql.
📧 Contact

Author: Mushfiqe Alam Shafin

🎓 BBA (MIS), University of Dhaka

🌱 Aspiring Data Analyst

💼 Intern @ Gao Tek Inc. & IntelsenseAI

⚽ Loves football & data challenges
