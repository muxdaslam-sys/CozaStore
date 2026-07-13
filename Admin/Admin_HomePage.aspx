<%@ Page Title="Dashboard - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_HomePage.aspx.cs" Inherits="Ecom_Project.Admin.Admin_HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header -->
    <div class="page-header">
        <div>
            <h1>Good Day, Admin 👋</h1>
            <div class="breadcrumb-row">
                <span class="current">Here's what's happening in your store today</span>
            </div>
        </div>
        <a href="../Index.aspx" target="_blank" class="btn-outline">
            <i class="fa-solid fa-arrow-up-right-from-square"></i> Visit Live Store
        </a>
    </div>

    <!-- Stats Cards -->
    <div class="stats-grid">

        <div class="stat-card sc-purple">
            <div class="stat-top">
                <div class="stat-icon si-purple"><i class="fa-solid fa-indian-rupee-sign"></i></div>
                <span class="stat-badge sb-up"><i class="fa-solid fa-arrow-trend-up"></i> 12.5%</span>
            </div>
            <div class="stat-value">₹1,42,480</div>
            <div class="stat-label">Total Revenue</div>
            <div class="stat-sub">Compared to last month</div>
        </div>

        <div class="stat-card sc-green">
            <div class="stat-top">
                <div class="stat-icon si-green"><i class="fa-solid fa-bag-shopping"></i></div>
                <span class="stat-badge sb-up"><i class="fa-solid fa-arrow-trend-up"></i> 8%</span>
            </div>
            <div class="stat-value">124</div>
            <div class="stat-label">Total Products</div>
            <div class="stat-sub">In stock catalog</div>
        </div>

        <div class="stat-card sc-orange">
            <div class="stat-top">
                <div class="stat-icon si-orange"><i class="fa-solid fa-layer-group"></i></div>
                <span class="stat-badge sb-info"><i class="fa-solid fa-circle"></i> Active</span>
            </div>
            <div class="stat-value">18</div>
            <div class="stat-label">Categories</div>
            <div class="stat-sub">Managed sections</div>
        </div>

        <div class="stat-card sc-red">
            <div class="stat-top">
                <div class="stat-icon si-red"><i class="fa-solid fa-users-gear"></i></div>
                <span class="stat-badge sb-info"><i class="fa-solid fa-circle"></i> Online</span>
            </div>
            <div class="stat-value">4</div>
            <div class="stat-label">Administrators</div>
            <div class="stat-sub">Authorized accounts</div>
        </div>

    </div>

    <!-- Two Column Layout -->
    <div class="row">

        <!-- Recent Orders -->
        <div class="col-lg-8" style="padding-right: 10px;">
            <div class="card-premium">
                <div class="card-header-premium">
                    <div class="ch-title">
                        <span class="ch-icon si-purple"><i class="fa-solid fa-receipt"></i></span>
                        Recent Orders
                    </div>
                    <a href="#" class="ch-action">View All <i class="fa-solid fa-arrow-right" style="font-size:10px;"></i></a>
                </div>
                <div style="overflow-x:auto;">
                    <table class="table-premium">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer</th>
                                <th>Product</th>
                                <th>Amount</th>
                                <th>Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><span class="td-main">#5842</span></td>
                                <td>
                                    <span class="td-main">David Miller</span>
                                    <span class="td-sub">david@email.com</span>
                                </td>
                                <td>Lightweight Jacket</td>
                                <td><span class="td-main">₹4,640</span></td>
                                <td><span class="td-sub">12 Jul 2026</span></td>
                                <td><span class="badge-s bs-success">Delivered</span></td>
                            </tr>
                            <tr>
                                <td><span class="td-main">#5841</span></td>
                                <td>
                                    <span class="td-main">Sophia Watson</span>
                                    <span class="td-sub">sophia@email.com</span>
                                </td>
                                <td>Vintage Denim Shirt</td>
                                <td><span class="td-main">₹3,400</span></td>
                                <td><span class="td-sub">11 Jul 2026</span></td>
                                <td><span class="badge-s bs-warning">Processing</span></td>
                            </tr>
                            <tr>
                                <td><span class="td-main">#5840</span></td>
                                <td>
                                    <span class="td-main">John Doe</span>
                                    <span class="td-sub">john@email.com</span>
                                </td>
                                <td>Classic Leather Watch</td>
                                <td><span class="td-main">₹9,600</span></td>
                                <td><span class="td-sub">10 Jul 2026</span></td>
                                <td><span class="badge-s bs-success">Delivered</span></td>
                            </tr>
                            <tr>
                                <td><span class="td-main">#5839</span></td>
                                <td>
                                    <span class="td-main">Emma Brown</span>
                                    <span class="td-sub">emma@email.com</span>
                                </td>
                                <td>Cotton Polo Shirt</td>
                                <td><span class="td-main">₹2,800</span></td>
                                <td><span class="td-sub">10 Jul 2026</span></td>
                                <td><span class="badge-s bs-danger">Cancelled</span></td>
                            </tr>
                            <tr>
                                <td><span class="td-main">#5838</span></td>
                                <td>
                                    <span class="td-main">Rohan Sharma</span>
                                    <span class="td-sub">rohan@email.com</span>
                                </td>
                                <td>Slim Fit Trousers</td>
                                <td><span class="td-main">₹3,200</span></td>
                                <td><span class="td-sub">09 Jul 2026</span></td>
                                <td><span class="badge-s bs-info">Shipped</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Quick Actions + Status -->
        <div class="col-lg-4" style="padding-left: 10px;">
            <div class="card-premium">
                <div class="card-header-premium">
                    <div class="ch-title">
                        <span class="ch-icon si-purple"><i class="fa-solid fa-bolt"></i></span>
                        Quick Actions
                    </div>
                </div>
                <div class="card-body-premium">
                    <div class="quick-actions">
                        <a href="Add_Product.aspx" class="quick-action-item">
                            <span class="qa-icon si-green"><i class="fa-solid fa-circle-plus"></i></span>
                            Add New Product
                            <i class="fa-solid fa-chevron-right qa-arrow"></i>
                        </a>
                        <a href="Add_Category.aspx" class="quick-action-item">
                            <span class="qa-icon si-orange"><i class="fa-solid fa-folder-plus"></i></span>
                            Add Category
                            <i class="fa-solid fa-chevron-right qa-arrow"></i>
                        </a>
                        <a href="Product.aspx" class="quick-action-item">
                            <span class="qa-icon si-green"><i class="fa-solid fa-bag-shopping"></i></span>
                            Manage Products
                            <i class="fa-solid fa-chevron-right qa-arrow"></i>
                        </a>
                        <a href="Category.aspx" class="quick-action-item">
                            <span class="qa-icon si-orange"><i class="fa-solid fa-layer-group"></i></span>
                            Manage Categories
                            <i class="fa-solid fa-chevron-right qa-arrow"></i>
                        </a>
                        <a href="Add_Admin.aspx" class="quick-action-item">
                            <span class="qa-icon si-purple"><i class="fa-solid fa-user-plus"></i></span>
                            Add Administrator
                            <i class="fa-solid fa-chevron-right qa-arrow"></i>
                        </a>
                    </div>

                    <!-- Store Status -->
                    <div class="status-pill">
                        <span class="sp-dot"></span>
                        <div>
                            <div class="sp-text">Store is Live</div>
                            <div class="sp-sub">All systems operational</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
