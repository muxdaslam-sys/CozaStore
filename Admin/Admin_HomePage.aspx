<%@ Page Title="Dashboard - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_HomePage.aspx.cs" Inherits="Ecom_Project.Admin.Admin_HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .badge-s::before {
            display: none !important;
            content: none !important;
            width: 0 !important;
            height: 0 !important;
            margin: 0 !important;
        }

        /* ── Page Header Alignment ── */
        .dash-header-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 16px;
            margin-bottom: 24px;
        }
        .dash-header-bar h1 {
            font-size: 22px;
            font-weight: 800;
            color: var(--text-primary);
            margin: 0 0 4px 0;
            line-height: 1.2;
        }
        .dash-header-bar .sub-text {
            font-size: 13px;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .dash-actions-right {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }
        .live-status-pill {
            background: #ffffff;
            border: 1px solid var(--border);
            padding: 7px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            color: var(--text-secondary);
            display: inline-flex;
            align-items: center;
            gap: 7px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.03);
        }

        /* ── Perfect 4-Card Metrics Grid ── */
        .stats-grid-4 {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-bottom: 24px;
        }
        @media (max-width: 991px) {
            .stats-grid-4 { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 575px) {
            .stats-grid-4 { grid-template-columns: 1fr; }
        }

        .metric-card {
            background: #ffffff;
            border: 1px solid var(--border);
            border-radius: var(--radius-md, 14px);
            padding: 20px;
            position: relative;
            overflow: hidden;
            box-shadow: var(--shadow-card);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .metric-card:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-md);
        }
        .metric-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0;
            width: 4px; height: 100%;
        }
        .metric-card.mc-purple::before { background: var(--primary); }
        .metric-card.mc-green::before  { background: var(--success); }
        .metric-card.mc-orange::before { background: var(--warning); }
        .metric-card.mc-blue::before   { background: var(--info); }

        .mc-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 14px;
        }
        .mc-icon {
            width: 42px;
            height: 42px;
            border-radius: var(--radius-xs, 8px);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 17px;
            flex-shrink: 0;
        }
        .mc-icon.si-purple { background: var(--primary-soft); color: var(--primary); }
        .mc-icon.si-green  { background: var(--success-soft); color: var(--success); }
        .mc-icon.si-orange { background: var(--warning-soft); color: var(--warning); }
        .mc-icon.si-blue   { background: var(--info-soft);    color: var(--info); }

        .mc-badge {
            font-size: 11px;
            font-weight: 700;
            padding: 3px 9px;
            border-radius: 20px;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }
        .mc-val {
            font-size: 26px;
            font-weight: 800;
            color: var(--text-primary);
            line-height: 1.1;
            margin-bottom: 4px;
            letter-spacing: -0.3px;
        }
        .mc-label {
            font-size: 11.5px;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.6px;
            margin-bottom: 0;
        }
        .mc-foot {
            margin-top: 12px;
            padding-top: 10px;
            border-top: 1px dashed var(--border);
            font-size: 12px;
            color: var(--text-secondary);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .mc-foot strong {
            color: var(--text-primary);
        }

        /* ── Table Precision Alignment ── */
        .table-wrap {
            width: 100%;
            overflow-x: auto;
            display: block;
            -webkit-overflow-scrolling: touch;
        }
        .table-orders-custom {
            width: 100% !important;
            min-width: 680px;
            table-layout: fixed;
            border-collapse: collapse;
            margin: 0 !important;
        }
        .table-orders-custom th,
        .table-orders-custom td {
            padding: 12px 14px !important;
            vertical-align: middle;
            font-size: 13px;
        }
        .table-orders-custom th {
            background: #f8fafc;
            color: var(--text-secondary);
            font-weight: 700;
            font-size: 11.5px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid var(--border);
            white-space: nowrap;
        }
        .table-orders-custom tr {
            border-bottom: 1px solid var(--border);
            transition: background 0.15s ease;
        }
        .table-orders-custom tr:hover {
            background: #f8fafc;
        }

        /* Explicit Column Width & Alignment Rules */
        .tcol-id     { width: 14%; text-align: left; }
        .tcol-user   { width: 26%; text-align: left; }
        .tcol-prod   { width: 25%; text-align: left; }
        .tcol-amount { width: 13%; text-align: right; }
        .tcol-date   { width: 11%; text-align: center; }
        .tcol-status { width: 11%; text-align: center; }

        .truncate-text {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
            max-width: 100%;
        }

        .user-initial-circle {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: var(--primary-soft);
            color: var(--primary);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 700;
            flex-shrink: 0;
        }

        /* ── Inventory Alert Rows ── */
        .inv-alert-card {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 12px;
            border-radius: 8px;
            background: #f8fafc;
            border: 1px solid var(--border);
            margin-bottom: 9px;
            transition: background 0.2s ease;
        }
        .inv-alert-card:hover {
            background: #ffffff;
            border-color: rgba(108, 99, 255, 0.3);
        }
        .inv-left {
            display: flex;
            align-items: center;
            gap: 10px;
            min-width: 0;
            flex: 1;
        }
        .inv-img {
            width: 36px;
            height: 36px;
            border-radius: 6px;
            object-fit: cover;
            border: 1px solid var(--border);
            background: #fff;
            flex-shrink: 0;
        }
        .inv-title {
            font-size: 13px;
            font-weight: 600;
            color: var(--text-primary);
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
        }
        .inv-sub {
            font-size: 11.5px;
            color: var(--text-muted);
            display: block;
        }
        .inv-right {
            text-align: right;
            flex-shrink: 0;
            margin-left: 10px;
        }
        .inv-stock-tag {
            font-size: 11px;
            font-weight: 700;
            padding: 2px 7px;
            border-radius: 12px;
            background: #fee2e2;
            color: #b91c1c;
            display: inline-block;
        }
        .inv-link {
            display: block;
            font-size: 11px;
            font-weight: 600;
            color: var(--primary);
            margin-top: 3px;
        }

        /* ── 2x2 Action Tiles ── */
        .tile-grid-2x2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-bottom: 14px;
        }
        .action-tile-btn {
            background: #ffffff;
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 12px 8px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 6px;
            text-align: center;
            color: var(--text-secondary);
            font-size: 12px;
            font-weight: 600;
            transition: all 0.2s ease;
            cursor: pointer;
        }
        .action-tile-btn i {
            font-size: 17px;
        }
        .action-tile-btn:hover {
            border-color: var(--primary);
            color: var(--primary);
            background: var(--primary-soft);
            transform: translateY(-2px);
        }

        /* ── 2x2 Overview Counters ── */
        .summary-boxes {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }
        .sum-box {
            background: #f8fafc;
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 10px 8px;
            text-align: center;
        }
        .sum-box .sb-num {
            font-size: 17px;
            font-weight: 800;
            color: var(--text-primary);
            line-height: 1.1;
            margin-bottom: 2px;
        }
        .sum-box .sb-txt {
            font-size: 10.5px;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.4px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ════ Top Header Section ════ -->
    <div class="dash-header-bar">
        <div>
            <h1>Dashboard Overview</h1>
            <div class="sub-text">
                <i class="fa-regular fa-calendar-days" style="color: var(--primary);"></i>
                <span><%= DateTime.Now.ToString("dddd, dd MMMM yyyy") %> &bull; Live store summary & latest orders</span>
            </div>
        </div>
        <div class="dash-actions-right">
            <div class="live-status-pill">
                <i class="fa-solid fa-circle" style="color: #16a34a; font-size: 8px;"></i>
                Store Online
            </div>
            <a href="Add_Product.aspx" class="btn-premium">
                <i class="fa-solid fa-plus"></i> Add Product
            </a>
            <a href="../user/uindex.aspx" target="_blank" class="btn-outline">
                <i class="fa-solid fa-arrow-up-right-from-square"></i> Visit Store
            </a>
        </div>
    </div>

    <!-- ════ 4 Key Metric Cards Grid ════ -->
    <div class="stats-grid-4">

        <!-- 1. Total Revenue -->
        <div class="metric-card mc-purple">
            <div class="mc-top">
                <div class="mc-icon si-purple">
                    <i class="fa-solid fa-indian-rupee-sign"></i>
                </div>
                <span class="mc-badge bs-success">
                    <i class="fa-solid fa-circle-check"></i> Verified
                </span>
            </div>
            <div>
                <div class="mc-val"><asp:Label ID="lblTotalRevenue" runat="server" Text="₹0"></asp:Label></div>
                <div class="mc-label">Total Revenue</div>
            </div>
            <div class="mc-foot">
                <span>Avg Order Value:</span>
                <strong><asp:Label ID="lblAOV" runat="server" Text="₹0"></asp:Label></strong>
            </div>
        </div>

        <!-- 2. Total Orders -->
        <div class="metric-card mc-green">
            <div class="mc-top">
                <div class="mc-icon si-green">
                    <i class="fa-solid fa-receipt"></i>
                </div>
                <span class="mc-badge bs-info">
                    <i class="fa-solid fa-check"></i> Completed
                </span>
            </div>
            <div>
                <div class="mc-val"><asp:Label ID="lblTotalOrders" runat="server" Text="0"></asp:Label></div>
                <div class="mc-label">Total Orders</div>
            </div>
            <div class="mc-foot">
                <span>Completed Sales:</span>
                <strong style="color: #16a34a;"><i class="fa-solid fa-arrow-trend-up"></i> Active</strong>
            </div>
        </div>

        <!-- 3. Catalog Products -->
        <div class="metric-card mc-orange">
            <div class="mc-top">
                <div class="mc-icon si-orange">
                    <i class="fa-solid fa-bag-shopping"></i>
                </div>
                <span class="mc-badge bs-warning">
                    <asp:Label ID="lblActiveCategories" runat="server" Text="0"></asp:Label> Categories
                </span>
            </div>
            <div>
                <div class="mc-val"><asp:Label ID="lblTotalProducts" runat="server" Text="0"></asp:Label></div>
                <div class="mc-label">Catalog Products</div>
            </div>
            <div class="mc-foot">
                <span>Low Stock Alerts:</span>
                <strong style="color: #dc2626;"><asp:Label ID="lblLowStockCount" runat="server" Text="0"></asp:Label> items</strong>
            </div>
        </div>

        <!-- 4. Registered Users -->
        <div class="metric-card mc-blue">
            <div class="mc-top">
                <div class="mc-icon si-blue">
                    <i class="fa-solid fa-users"></i>
                </div>
                <span class="mc-badge bs-info">
                    <i class="fa-solid fa-user-check"></i> Registered
                </span>
            </div>
            <div>
                <div class="mc-val"><asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label></div>
                <div class="mc-label">Customers</div>
            </div>
            <div class="mc-foot">
                <span>Pending Support:</span>
                <strong style="color: #b45309;"><asp:Label ID="lblPendingSupport" runat="server" Text="0"></asp:Label> queries</strong>
            </div>
        </div>

    </div>

    <!-- ════ Main 2-Column Content Layout ════ -->
    <div class="row">

        <!-- ── Left Column (8 cols): Recent Customer Orders ── -->
        <div class="col-lg-8">
            <div class="card-premium" style="margin-bottom: 24px;">
                <div class="card-header-premium" style="padding: 14px 20px;">
                    <div class="ch-title" style="font-size: 14.5px;">
                        <span class="ch-icon si-purple" style="width:28px; height:28px; font-size:12px;"><i class="fa-solid fa-receipt"></i></span>
                        Recent Transactions
                    </div>
                    <a href="Orders.aspx" class="ch-action">
                        View All Orders <i class="fa-solid fa-arrow-right" style="font-size:10px;"></i>
                    </a>
                </div>
                <div class="card-body-premium" style="padding: 0;">
                    <div class="table-wrap">
                        <asp:GridView ID="GV_RecentOrders" runat="server"
                            AutoGenerateColumns="False"
                            CssClass="table-orders-custom"
                            GridLines="None"
                            UseAccessibleHeader="True">
                            <Columns>
                                <%-- 1. Order ID --%>
                                <asp:TemplateField HeaderText="Order ID" HeaderStyle-CssClass="tcol-id" ItemStyle-CssClass="tcol-id">
                                    <ItemTemplate>
                                        <span style="font-family: monospace; font-weight: 700; color: var(--primary); font-size: 13px;">
                                            #<%# Eval("OrderGroupID") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- 2. Customer --%>
                                <asp:TemplateField HeaderText="Customer" HeaderStyle-CssClass="tcol-user" ItemStyle-CssClass="tcol-user">
                                    <ItemTemplate>
                                        <div style="display: flex; align-items: center; gap: 8px;">
                                            <div class="user-initial-circle">
                                                <%# Eval("User_name").ToString().Length > 0 ? Eval("User_name").ToString().Substring(0,1).ToUpper() : "U" %>
                                            </div>
                                            <div style="min-width: 0; flex: 1;">
                                                <span class="truncate-text" style="font-weight: 600; color: var(--text-primary);" title='<%# Eval("User_name") %>'>
                                                    <%# Eval("User_name") %>
                                                </span>
                                                <span class="truncate-text" style="font-size: 11.5px; color: var(--text-muted);" title='<%# Eval("User_email") %>'>
                                                    <%# Eval("User_email") %>
                                                </span>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- 3. Product Item --%>
                                <asp:TemplateField HeaderText="Product Item" HeaderStyle-CssClass="tcol-prod" ItemStyle-CssClass="tcol-prod">
                                    <ItemTemplate>
                                        <div style="min-width: 0;">
                                            <span class="truncate-text" style="font-weight: 500; color: var(--text-primary);" title='<%# Eval("Product_name") %>'>
                                                <%# Eval("Product_name") %>
                                            </span>
                                            <span style="font-size: 11.5px; color: var(--text-muted);">
                                                Qty: <strong><%# Eval("Quantity") %></strong> pcs
                                            </span>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- 4. Amount --%>
                                <asp:TemplateField HeaderText="Amount" HeaderStyle-CssClass="tcol-amount" ItemStyle-CssClass="tcol-amount">
                                    <ItemTemplate>
                                        <span style="font-weight: 700; color: var(--success); font-size: 13.5px;">
                                            &#8377;<%# Eval("SubTotal") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- 5. Date --%>
                                <asp:TemplateField HeaderText="Date" HeaderStyle-CssClass="tcol-date" ItemStyle-CssClass="tcol-date">
                                    <ItemTemplate>
                                        <span style="font-size: 12px; color: var(--text-secondary); white-space: nowrap;">
                                            <%# Eval("Order_Date", "{0:dd-MM-yyyy}") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- 6. Status --%>
                                <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="tcol-status" ItemStyle-CssClass="tcol-status">
                                    <ItemTemplate>
                                        <span class="badge-s bs-success" style="font-size: 10.5px; padding: 3px 8px;">
                                            <%# Eval("Order_status") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                            <EmptyDataTemplate>
                                <div style="text-align: center; padding: 45px 20px;">
                                    <div style="width: 48px; height: 48px; background: var(--primary-soft); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 12px; color: var(--primary);">
                                        <i class="fa-solid fa-receipt" style="font-size: 20px;"></i>
                                    </div>
                                    <h5 style="font-weight: 700; color: var(--text-primary); margin-bottom: 4px; font-size: 14px;">No Orders Recorded Yet</h5>
                                    <p style="color: var(--text-muted); font-size: 12.5px; margin-bottom: 0;">Completed customer orders will appear here automatically.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <!-- ── Right Column (4 cols): Inventory Alerts & Shortcuts ── -->
        <div class="col-lg-4">

            <!-- Card 1: Inventory Alerts -->
            <div class="card-premium" style="margin-bottom: 20px;">
                <div class="card-header-premium" style="padding: 12px 18px;">
                    <div class="ch-title" style="font-size: 13.5px;">
                        <span class="ch-icon si-orange" style="width:26px; height:26px; font-size:12px;"><i class="fa-solid fa-triangle-exclamation"></i></span>
                        Inventory Alerts
                    </div>
                    <a href="Product.aspx" style="font-size: 11.5px; font-weight: 600; color: var(--primary);">Manage</a>
                </div>
                <div class="card-body-premium" style="padding: 14px;">
                    
                    <asp:Panel ID="pnlLowStockList" runat="server">
                        <asp:Repeater ID="rptrLowStock" runat="server">
                            <ItemTemplate>
                                <div class="inv-alert-card">
                                    <div class="inv-left">
                                        <img src='<%# ResolveUrl(Eval("Product_image").ToString()) %>' alt="Product" class="inv-img" onerror="this.src='../images/icons/logo-01.png';" />
                                        <div style="min-width: 0;">
                                            <span class="inv-title" title='<%# Eval("Product_name") %>'><%# Eval("Product_name") %></span>
                                            <span class="inv-sub">&#8377;<%# Eval("Product_price") %></span>
                                        </div>
                                    </div>
                                    <div class="inv-right">
                                        <span class="inv-stock-tag"><%# Eval("Product_stock") %> left</span>
                                        <a href='<%# "Edit_Product.aspx?id=" + Eval("Product_id") %>' class="inv-link">Restock &rarr;</a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:Panel>

                    <asp:Panel ID="pnlLowStockEmpty" runat="server" Visible="false">
                        <div style="text-align: center; padding: 18px 10px;">
                            <div style="width: 38px; height: 38px; border-radius: 50%; background: #dcfce7; color: #16a34a; display: inline-flex; align-items: center; justify-content: center; margin-bottom: 6px;">
                                <i class="fa-solid fa-boxes-packing" style="font-size: 15px;"></i>
                            </div>
                            <div style="font-weight: 700; font-size: 13px; color: var(--text-primary);">Inventory Healthy</div>
                            <div style="font-size: 11.5px; color: var(--text-muted);">All store items have sufficient stock.</div>
                        </div>
                    </asp:Panel>

                </div>
            </div>

            <!-- Card 2: Quick Management Shortcuts -->
            <div class="card-premium" style="margin-bottom: 20px;">
                <div class="card-header-premium" style="padding: 12px 18px;">
                    <div class="ch-title" style="font-size: 13.5px;">
                        <span class="ch-icon si-purple" style="width:26px; height:26px; font-size:12px;"><i class="fa-solid fa-compass"></i></span>
                        Quick Shortcuts
                    </div>
                </div>
                <div class="card-body-premium" style="padding: 14px;">
                    <div class="tile-grid-2x2">
                        <a href="Add_Product.aspx" class="action-tile-btn">
                            <i class="fa-solid fa-circle-plus" style="color: #16a34a;"></i>
                            <span>Add Product</span>
                        </a>
                        <a href="Add_Category.aspx" class="action-tile-btn">
                            <i class="fa-solid fa-folder-plus" style="color: #d97706;"></i>
                            <span>Add Category</span>
                        </a>
                        <a href="Orders.aspx" class="action-tile-btn">
                            <i class="fa-solid fa-box-archive" style="color: #6c63ff;"></i>
                            <span>View Orders</span>
                        </a>
                        <a href="UserSupport.aspx" class="action-tile-btn">
                            <i class="fa-solid fa-headset" style="color: #0284c7;"></i>
                            <span>User Support</span>
                        </a>
                    </div>

                    <!-- Mini Store Overview -->
                    <div class="summary-boxes">
                        <div class="sum-box">
                            <div class="sb-num"><asp:Label ID="lblBoxCategories" runat="server" Text="0"></asp:Label></div>
                            <div class="sb-txt">Categories</div>
                        </div>
                        <div class="sum-box">
                            <div class="sb-num"><asp:Label ID="lblBoxAdmins" runat="server" Text="0"></asp:Label></div>
                            <div class="sb-txt">Admins</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</asp:Content>
