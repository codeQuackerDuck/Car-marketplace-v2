# Car Marketplace (iWantCar) – Setup & Testing Guide

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

