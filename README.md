# CozaStore - E-Commerce Web Application 🛍️💻

![ASP.NET](https://img.shields.io/badge/ASP.NET-Web%20Forms-blueviolet?style=for-the-badge&logo=.net)
![C#](https://img.shields.io/badge/C%23-239120?style=for-the-badge&logo=c-sharp&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL%20Server-CC292B?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**CozaStore** is a comprehensive, full-stack E-Commerce Web Application built using **ASP.NET (C#)** and **Microsoft SQL Server**. It features a modern, responsive user storefront alongside a powerful Admin Control Panel for managing inventory, categories, customer orders, user permissions, and support ticketing.

---

## ✨ Features

### 👤 User Storefront
* **Product Catalog & Filtering:** Browse products with category filtering and interactive previews.
* **Product Details:** View detailed product descriptions, pricing, and stock information.
* **Dynamic Shopping Cart:** Add, remove, update quantities, and calculate real-time totals.
* **Billing & Checkout:** Complete checkout process with billing detail inputs and account management.
* **Payment Status:** Order confirmation and payment status verification.
* **Order History:** Users can track placed orders and view order status (`ViewOrders.aspx`).
* **Contact & Support:** Built-in support form for customer inquiries.

### 🛡️ Admin Management Panel
* **Category Management:** Create, view, update, and delete product categories (`Add_Category.aspx`, `Edit_Category.aspx`).
* **Product Management:** Add new products with image uploads, update pricing, stock, and descriptions (`Add_Product.aspx`, `Edit_Product.aspx`).
* **Order Processing:** Track incoming customer orders, review details, and update fulfillment statuses (`Orders.aspx`).
* **User Management:** Oversee registered user accounts (`UserManagement.aspx`).
* **Customer Support Desk:** Manage and respond to customer tickets and support requests (`UserSupport.aspx`).
* **Admin Access Control:** Manage administrative users and roles (`Add_Admin.aspx`).

---

## 🛠️ Tech Stack

* **Backend:** ASP.NET Web Forms (C#)
* **Database:** Microsoft SQL Server (`CozaStore_DB`)
* **Frontend:** HTML5, CSS3, JavaScript, jQuery, Bootstrap, Animate.css, Slick Carousel
* **IDE:** Microsoft Visual Studio

---

## 📁 Repository Structure

```
CozaStore/
├── Admin/                     # Admin panel ASPX pages & Master page
├── User/                      # User storefront ASPX pages & Master page
├── DB-Backup/                 # Database backup file (CozaStore_DB)
├── Images/                    # Product & UI images
├── css/                       # Stylesheets & Bootstrap
├── js/                        # JavaScript & interactive modules
├── vendor/                    # Third-party libraries (Bootstrap, jQuery, etc.)
├── ConClass.cs                # Database connection helper class (ADO.NET)
├── Index.aspx                 # Main landing page
├── Login.aspx                 # User authentication page
├── Web.config                 # Application configuration & connection strings
└── CozaStore.sln              # Visual Studio Solution file
```

---

## 🚀 Getting Started & Installation

### Prerequisites
1. **Microsoft Visual Studio** (2019 or later recommended) with ASP.NET and web development workload installed.
2. **Microsoft SQL Server** / **SQL Server Express** & **SSMS** (SQL Server Management Studio).

### 1. Database Setup
1. Open SQL Server Management Studio (SSMS) and connect to your local server instance.
2. Restore or attach the database backup located in the `DB-Backup/` folder (`DB-Backup/CozaStore_DB`).
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
3. Rebuild the solution (`Ctrl + Shift + B`) to restore packages and compile binaries.
4. Set `Index.aspx` or `Login.aspx` as the Startup Page.
5. Press **F5** or click **IIS Express** to run the project in your browser.

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [Issues page](https://github.com/muxdaslam-sys/CozaStore/issues).

---

## 📜 License

Distributed under the MIT License. See `LICENSE` for more information.
