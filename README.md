# Homework 7 - Create a Database using DDL

Author: Bryan Lizama Montecino

## Overview
Task is to create a comprehensive database to manage the collective skills, certifications, employees, and roles within a company. The database will help a team to keep track of the skills and certifications of employees and their roles in the company. The README will guide you through the structure and purpose of this database.

## Database Structure

### Tables
1. **Skills and Certifications**
   - Skill ID
   - Skill Name
   - Description
   - URL
   - Anticipated Graduation Date (optional)

2. **Employees**
   - Employee ID
   - Name
   - Email Address
   - LinkedIn URL
   - Headshot (image URL)
   - Discord Handle
   - Brief Bio
   - Date of Joining

3. **Roles**
   - Role ID
   - Role Name
   - Sort ID for Reporting

### Associations
- Skills and Certifications are associated with employees, including the date they were acquired or awarded.
- Employees can have multiple skills and certifications.
- Employees are associated with roles, with the date they were assigned to each role.

## HTML Report
Once the database is constructed, an HTML report will be created

## Queries
Include queries in the SQL database to support reports. These queries will form the basis of an entirely new suite of reports using information from the database.

## Getting Started
Clone the Repository
* Clone this GitHub repository to your local machine using the following command:
  * git clone <repository-url>

Database Setup
* Set up your database using the provided DDL (Data Definition Language) script. Ensure you have a compatible database system installed and running.

## Acknowledgments
- Template made by John Leonard

