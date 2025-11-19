# Car Marketplace – Setup & Testing Guide

This document explains how to install, configure, and test the full iWantCar car marketplace system, including:

- **Backend API** (Node.js + Express + MySQL)
- **Frontend** (React + Vite)
- **MySQL database** (tables + sample data)

The instructions assume you are running on **Windows** with **MySQL** (e.g., WAMP or MySQL Workbench), but they can be adapted to other environments.

---

## 1. Project Structure

The project is organized into two main folders:

```text
Car-marketplace-v2/
  backend/    # Node.js + Express REST API
  frontend/   # React + Vite single-page application


The **frontend** displays the UI,  
the **backend** handles all logic,  
and **MySQL** stores the application data.

---

## 2. Prerequisites

Before starting, make sure you have installed:

- Node.js (v20+ recommended)
- npm (comes with Node)
- MySQL Server (WAMP, XAMPP, or standalone)
- MySQL Workbench 

---

## 3. Database Setup (MySQL)

### Step 1 — Start MySQL
Start your MySQL server (e.g., through WAMP).

### Step 2 — Create the database
Open MySQL Workbench and run:

```sql
CREATE DATABASE IF NOT EXISTS car_marketplace;
USE car_marketplace;



