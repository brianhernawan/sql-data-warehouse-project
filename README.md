# End-to-End SQL Server Data Warehouse Project 🚀

Welcome to my **SQL Server Data Warehouse** portfolio project! This repository demonstrates the design, development, and implementation of a scalable, centralized modern data warehouse. Building a modern data warehouse with SQL Server, including ETL processes, data modelling, and analytics.

Using enterprise best practices, this project unifies disparate transactional records from CRM and ERP source systems into a singular, high-performance analytical hub.

---

## 🏗️ Core Architecture (Medallion Pattern)

The infrastructure follows the **Medallion Architecture**, structurally segregating data into three distinct layers to ensure governance, performance, and extreme data quality:

* **Bronze Layer (Staging):** Ingests raw data directly from external source systems (CRM and ERP CSV files) as-is into SQL Server database tables. This preserves historical extraction snapshots.
* **Silver Layer (Cleansing & Enrichment):** Drops or flags bad rows, sanitizes strings (trimming whitespace), standardizes categorical codes (like gender, location, or marital status), resolves data-type irregularities (e.g., parsing integers into strict dates), and executes mathematical reconciliations.
* **Gold Layer (Analytical Modeling):** Aggregates and refines the standardized Silver data into high-performance dimensional models (Star Schema) and fact views optimized directly for business intelligence visualization and reporting.

---

## 📖 Project Objectives & Scope

This project covers the full lifecycle of a data engineer and analytics developer:
1. **Infrastructure & Schema Setup:** Constructing safe, isolated database environments across multi-tier namespaces (`bronze`, `silver`, `gold`).
2. **Automated ETL Pipelines:** Developing modular stored procedures utilizing high-speed `BULK INSERT` techniques to seamlessly drop, re-load, and orchestrate raw tables.
3. **Data Quality Engineering:** Writing data-profiling suites to trap unwanted duplicates, isolate primary/foreign key anomalies, handle missing fields (`NULL`), and audit business metric logic.
4. **Business Analytics Generation:** Constructing analytical logic to surface metrics on customer segments (such as Membership Level performance), transaction frequency, product velocities, and promotional campaign efficacy.

---

## 🚀 Technical Requirements

* **Database Management System:** Microsoft SQL Server (2022 / 2025 Standard or Express Edition)
* **Database IDE:** SQL Server Management Studio (SSMS)
* **Version Control:** Git & GitHub
* **Data Architecture Design:** Draw.io / Lucidchart (Data Architecture, ERDs, and Data Flow modeling)

---

## 📂 Repository Structure

```text
sql-data-warehouse-project/
│
├── datasets/                 # Raw data files divided into source boundaries
│   ├── source_crm/          # Customer, Product, and Sales details from CRM systems
│   └── source_erp/          # Segmented location, product categories, and historical records
│
├── docs/                     # Architectural visuals and text documentation
│   ├── data_architecture.md # Technical breakdown of data layers
│   ├── data_catalog.md      # Field descriptions, constraints, and data dictionaries
│   └── naming-conventions.md# Standardization guidelines for objects, types, and schemas
│
├── scripts/                  # Structured SQL Transformation Code
│   ├── bronze/              # Table definitions and automated raw load stored procedures
│   ├── silver/              # Cleaning scripts, type casting, and validation logic
│   └── gold/                # Core Dimensional models, analytical views, and fact layers
│
├── tests/                    # Data quality checks and diagnostic profiling queries
│
├── .gitignore                # Files excluded from version control tracking
├── LICENSE                   # Open-source licensing metrics
└── README.md                 # Current project documentation hub
