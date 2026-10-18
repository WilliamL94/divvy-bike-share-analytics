Divvy Bike Share | Rider Behavior Analysis (2023–2025)

SQL Data Analysis | Tableau Visualization | Business Intelligence

An end-to-end data analytics capstone project examining differences in riding behavior between annual members and casual riders of Divvy, Chicago's bike-sharing system.

This project demonstrates data preparation, cleaning, validation, exploratory analysis, SQL querying, interactive dashboard development, and business recommendations based on approximately 17.1 million rides.

Project Overview

Business Problem: How do annual members and casual riders use Divvy bikes differently, and how can these behavioral differences inform strategies to convert casual riders into annual memberships?

Analysis Period: January 2023 – December 2025

Dataset: Divvy historical bike trip data

Tools and Technologies:

Oracle SQL and Oracle SQL Developer

Tableau and Tableau Public

Microsoft Excel

Git and GitHub

Interactive Tableau Dashboard

View the Interactive Divvy Bike Share Dashboard

The dashboard includes six visualizations:

Monthly Ridership Trends

Average Ride Duration

Weekday vs. Weekend Usage

Hourly Riding Patterns

Bike Type Preferences

Top 10 Starting Stations

The dashboard also supports interactive filtering by rider membership type.

Key Findings

Metric

Annual Members

Casual Riders

Total Rides

10,921,833

6,209,374

Share of Total Rides

63.75%

36.25%

Average Ride Duration

12.55 minutes

25.35 minutes

Weekday Ride Share

76.10%

62.84%

Weekend Ride Share

23.90%

37.16%

Total rides analyzed: 17,131,207

Insights

1. Members account for most trips. Annual members generated approximately 63.75% of rides during the analysis period.

2. Casual riders take longer trips. Casual riders averaged 25.35 minutes per ride, approximately twice the average duration of member rides.

3. Casual riders have a stronger weekend preference. Weekend trips accounted for 37.16% of casual rides compared with 23.90% of member rides.

4. Member activity aligns more closely with commuting hours. Hourly usage patterns suggest stronger morning and late-afternoon riding activity among members. Trip purpose cannot be established from trip timestamps alone.

Data Preparation and Cleaning

The project used Oracle SQL to explore, clean, validate, and analyze Divvy trip records.

The analytical workflow included:

Importing historical trip data into an Oracle database

Reviewing column structure and data quality

Identifying missing values and duplicate records

Excluding invalid trip durations

Creating a cleaned SQL view for analysis

Restricting the final analysis to trips from 2023 through 2025

Validating total ride counts and membership distributions

Generating aggregated datasets for Tableau visualization

The cleaned SQL view contained 35,686,178 records, while the selected 2023–2025 analysis period contained 17,131,207 rides.

SQL Analysis

All SQL scripts are available in the SQL folder.

Script

Purpose

01_data_exploration.sql

Explore the raw data and assess data quality

02_data_cleaning.sql

Define the cleaned trip data view

03_data_validation.sql

Validate cleaned records and rider counts

04_membership_analysis.sql

Analyze member and casual ridership

05_ride_duration.sql

Compare average ride durations

06_weekday_weekend.sql

Compare weekday and weekend riding

07_monthly_ridership.sql

Analyze monthly ridership trends

08_hourly_ridership.sql

Identify hourly usage patterns

09_bike_type_preferences.sql

Compare bike type preferences

10_top_starting_stations.sql

Identify frequently used starting stations

Business Recommendations

Based on the observed differences in riding behavior, the following strategies are proposed:

Target frequent casual riders. Develop membership promotions aimed at casual riders who use Divvy repeatedly, particularly during weekends.

Promote membership value. Use messaging that compares the potential benefits of annual membership against repeated casual rides.

Use seasonal and location-based campaigns. Tailor promotions to periods and starting stations with strong casual rider activity.

Test and measure conversion strategies. Pilot targeted campaigns and evaluate membership conversion rates, customer acquisition costs, and retention before expanding.

These recommendations are hypotheses informed by descriptive trip data; they require testing with additional customer and marketing data.

Full Case Study

Read the Divvy Bike Share Capstone Case Study (PDF)

The case study documents the analytical process, findings, visualizations, and proposed business recommendations.

Data Source

Divvy historical trip data is publicly available through the Divvy Trip Data archive.

The data is made available by Divvy for public analysis. This project is an independent educational analysis and is not affiliated with or endorsed by Divvy.

Project Deliverables

Oracle SQL scripts for data exploration, cleaning, validation, and analysis

Interactive Tableau dashboard

Comprehensive capstone case study

Documented analytical findings and business recommendations

Project Type: Data Analytics Portfolio / Google Data Analytics Professional Certificate Capstone

Core Skills Demonstrated: SQL, Data Cleaning, Data Validation, Data Analysis, Data Visualization, Dashboard Design, Business Intelligence, and Data Storytelling
