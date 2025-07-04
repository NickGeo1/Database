# Vehicle Insurance Database System

A comprehensive PostgreSQL-based database project modeling a motor vehicle insurance company. It includes schema design, normalization, complex querying, trigger and cursor usage, and a C# .NET desktop application for data visualization.

## 🛠 Technologies Used

- **MySQL** – Schema design and normalization
- **PostgreSQL-SQL** – Implementation and test of table creation commands, queries, trigger and cursor
- **C# .NET (WinForms)** – Front-end desktop application
- **ODBC Connector** – Interface between C# client and PostgreSQL
- **Mockaroo** – Data generation for realistic test datasets

## 🧩 Features

### 📦 Database Design & Implementation
- Designed and normalized a relational schema to 3NF-BCNF
- Tables include:
  - **Vehicles**: type, model, value, insurance group, registration data
  - **Customers & Drivers**: personal info, license, contact
  - **Insurance Contracts**: policy details, durations, associated vehicles and people
  - **Driving Incidents**: violations, timestamps, involved entities
- Enforced referential integrity and domain constraints

### 📊 Advanced SQL Queries
Implemented parameterized queries to:
- Identify new contracts signed in the last month with related customers and drivers
- Find contracts expiring next month and related customer contacts
- Aggregate contracts per category and year (2016–2020)
- Calculate total revenue per insurance category
- Derive contract averages by vehicle age group
- Compute incident averages per driver age group

### 🔁 Triggers & Cursors
- **Trigger**: Automatically renews “professional use” contracts for 1 year on expiration
- **Cursor-based Function**: Iterates over and returns complex query results as a table (e.g., total contracts per year)

### 🖥 Desktop Client (C#)
- Built a **WinForms application** to connect to the PostgreSQL database via ODBC
- Executes all queries from the project and presents results in a tabular UI
- Enables user-friendly interaction without requiring SQL knowledge

## 📂 Deliverables
- SQL scripts for schema, data, queries, trigger, and function
- C# source code with UI and ODBC logic
- PDF report with schema explanation, normalization steps, UI implementation, screenshots etc

> Developed as part of the **Databases** course (Semester 4), Department of Informatics, University of Piraeus.
