# CozaStore - E-Commerce Web Application

![ASP.NET](https://img.shields.io/badge/ASP.NET-Web%20Forms-blueviolet?style=for-the-badge&logo=.net)
![C#](https://img.shields.io/badge/C%23-239120?style=for-the-badge&logo=c-sharp&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![GitHub Actions CI](https://img.shields.io/badge/CI%20Pipeline-GitHub%20Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**CozaStore** is a full-stack, enterprise-ready E-Commerce Web Application engineered using **ASP.NET Web Forms (C#)** and **Microsoft SQL Server**. It features a modern user storefront paired with a centralized Admin Management Dashboard for handling live sales analytics, inventory cataloging, customer orders, user management, and support ticketing.

---

## ⚙️ Continuous Integration (CI) Pipeline

The repository is configured with an automated **GitHub Actions CI Pipeline** (`.github/workflows/ci.yml`) to enforce code quality, dependency validation, and compilation checks across the codebase:

* **Triggers:** Automated on every `push` and `pull_request` targeting `main` and `Develop` branches.
* **Runner Environment:** `windows-latest`
* **Automated Workflow Steps:**
  1. **Checkout Code:** Retrieves the latest branch codebase (`actions/checkout@v4`).
  2. **NuGet Setup & Restore:** Automatically configures NuGet CLI and restores all solution dependencies (`nuget restore CozaStore.sln`).
  3. **MSBuild Tooling:** Configures MSBuild environment variables (`microsoft/setup-msbuild@v2`).
  4. **Solution Build & Validation:** Compiles `CozaStore.sln` in `Release` mode across `Any CPU` target (`msbuild /m`) to catch any compile-time or syntax regressions before merging.

---

## ✨ Features

### 👤 User Storefront
* **Product Catalog & Filtering:** Browse products with category filtering, instant search, and responsive layout.
* **Product Details:** High-resolution product images, pricing, real-time availability, and detailed descriptions.
* **Dynamic Shopping Cart:** Add, remove, update item quantities, and calculate order totals automatically.
* **Billing & Checkout:** Multi-step checkout workflow with customer shipping/billing addresses.
* **Order Tracking & Invoicing:** View placed orders, order status, and itemized billing summaries (`ViewOrders.aspx`, `Billing.aspx`).
* **Customer Support Desk:** Built-in customer inquiry and product messaging system.

### 🛡️ Admin Management Panel
* **Live Dashboard Overview:** Real-time metrics including total revenue, order count, catalog size, active users, and average order value (`Admin_HomePage.aspx`).
* **Inventory & Low-Stock Alerts:** Automatic tracking of low-stock products ($\le 10$ pcs) with direct restock links.
* **Recent Transactions Log:** Live tabular overview of incoming customer orders with user details, product items, and payment status badges.
* **Category Management:** Add, update, and manage product categories (`Category.aspx`, `Add_Category.aspx`, `Edit_Category.aspx`).
* **Product Catalog Management:** Add new items with image uploads, edit stock, price, and descriptions (`Product.aspx`, `Add_Product.aspx`, `Edit_Product.aspx`).
* **Order Processing:** Full order management table with status filtering (`Orders.aspx`).
* **User Management:** Oversee registered users and permissions (`UserManagement.aspx`).
* **Support & Ticket Replies:** Review customer support tickets and send replies directly from the dashboard (`UserSupport.aspx`).
* **Admin Access Control:** Manage administrator accounts and privileges (`Admins.aspx`, `Add_Admin.aspx`).

---

## 🛠️ Tech Stack

* **Backend & Logic:** ASP.NET Web Forms, C#, ADO.NET (SQL Server)
* **Frontend:** HTML5, CSS3, JavaScript, jQuery, Bootstrap, FontAwesome 6
* **Database:** Microsoft SQL Server (`CozaStore_DB`)
* **DevOps / CI:** GitHub Actions (Windows MSBuild runner)
* **IDE:** Microsoft Visual Studio

---

## 📁 Repository Structure

```
CozaStore/
├── .github/
│   └── workflows/
│       └── ci.yml             # GitHub Actions CI pipeline configuration
├── Admin/                     # Admin control panel pages & master layout
│   ├── Admin.Master           # Shared Admin master layout & navigation
│   ├── Admin_HomePage.aspx    # Live admin dashboard overview
│   ├── Product.aspx           # Product catalog management
│   ├── Orders.aspx            # Order processing and tracking
│   ├── Category.aspx          # Category management
│   ├── UserManagement.aspx    # Customer accounts management
│   └── UserSupport.aspx       # Support ticketing system
├── User/                      # Customer storefront pages & master layout
├── DB-Backup/                 # Database backup file (CozaStore_DB)
├── Images/                    # UI assets and product images
├── css/                       # Core stylesheets and admin theme styles
├── js/                        # JavaScript interactive modules
├── vendor/                    # Bootstrap, jQuery, and vendor libraries
├── ConClass.cs                # Database connection helper class
├── Index.aspx                 # Store landing page
├── Login.aspx                 # Authentication page
├── Web.config                 # Application configuration & connection strings
└── CozaStore.sln              # Visual Studio Solution file
```

---

## 🚀 Getting Started & Installation

### Prerequisites
* **Microsoft Visual Studio** (2019 or later recommended) with the *ASP.NET and web development* workload.
* **Microsoft SQL Server / SQL Server Express** & SSMS.

### 1. Database Setup
1. Open SQL Server Management Studio (SSMS) and connect to your local server instance.
2. Restore the database backup located in the `DB-Backup/` folder (`DB-Backup/CozaStore_DB`).
3. Ensure the database name is `CozaStore_DB`.

### 2. Configure Connection String
Update the SQL Server connection string in `ConClass.cs` (or `Web.config`) to point to your local SQL Server instance:
```csharp
con = new SqlConnection(@"server=YOUR_SERVER_NAME\SQLEXPRESS; database=CozaStore_DB; integrated security=true");
```

### 3. Running the Project
1. Clone the repository:
   ```bash
   git clone https://github.com/muxdaslam-sys/CozaStore.git
   ```
2. Open `CozaStore.sln` in **Visual Studio**.
3. Build the solution (`Ctrl + Shift + B`) to verify all dependencies and compile.
4. Set `Index.aspx` or `Login.aspx` as the Startup Page.
5. Press **F5** (or run via **IIS Express**) to launch the application in your browser.

---

## 🤝 Branching & Workflow

* `main` — Production-ready release branch.
* `Develop` — Primary integration branch for new features, UI enhancements, and bug fixes.
* Feature branches: `feature/<feature-name>`

All pull requests into `main` and `Develop` trigger the **GitHub Actions CI Pipeline** to ensure builds pass before merging.

---

## 📜 License

Distributed under the MIT License.
