<%@ Page Title="Orders - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Ecom_Project.Admin.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .badge-s::before {
            display: none !important;
            content: none !important;
            width: 0 !important;
            height: 0 !important;
            margin: 0 !important;
        }
        
        /* Header Wrap */
        .ord-header-wrap {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 16px;
        }
        .ord-header-wrap h1 {
            font-size: 20px;
            font-weight: 800;
            color: var(--text-primary);
            margin: 0;
        }
        .ord-stat-pill {
            background: #ffffff;
            border: 1px solid var(--border);
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            color: var(--text-secondary);
            display: inline-flex;
            align-items: center;
            gap: 6px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.04);
        }

        .table-compact-container {
            width: 100%;
            overflow-x: auto;
            display: block;
            -webkit-overflow-scrolling: touch;
        }
        .table-compact-fit {
            width: 100% !important;
            min-width: 820px;
            table-layout: fixed;
            border-collapse: collapse;
        }
        .table-compact-fit th,
        .table-compact-fit td {
            padding: 12px 14px !important;
            vertical-align: middle;
            font-size: 13px;
        }
        .table-compact-fit th {
            background: #f8fafc;
            color: var(--text-secondary);
            font-weight: 700;
            font-size: 11.5px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid var(--border);
        }
        .table-compact-fit tr {
            border-bottom: 1px solid var(--border);
            transition: background 0.15s ease;
        }
        .table-compact-fit tr:hover {
            background: #f8fafc;
        }

        /* Column Width Distribution */
        .col-orderid { width: 12%; }
        .col-user    { width: 22%; }
        .col-product { width: 26%; }
        .col-qty     { width: 10%; text-align: center; }
        .col-total   { width: 14%; text-align: right; }
        .col-date    { width: 14%; text-align: center; }
        .col-status  { width: 12%; text-align: center; }

        .truncate-text {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
            max-width: 100%;
        }

        .user-avatar-sm {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            background: var(--primary-soft);
            color: var(--primary);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            font-weight: 700;
            flex-shrink: 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header -->
    <div class="ord-header-wrap">
        <div>
            <h1>Order Management</h1>
            <div class="breadcrumb-row" style="margin-top:2px;">
                <a href="Admin_HomePage.aspx">Dashboard</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:9px;"></i></span>
                <span class="current">Orders Log</span>
            </div>
        </div>
        <div>
            <div class="ord-stat-pill">
                <i class="fa-solid fa-receipt" style="color:var(--primary);"></i> Paid Customer Orders
            </div>
        </div>
    </div>

    <!-- Orders Card -->
    <div class="card-premium" style="margin-bottom:0;">
        <div class="card-header-premium" style="padding: 12px 20px;">
            <div class="ch-title" style="font-size: 14px;">
                <span class="ch-icon si-purple" style="width:28px;height:28px;font-size:12px;"><i class="fa-solid fa-receipt"></i></span>
                Completed & Paid Transactions
            </div>
            <span style="font-size:12px; color:var(--text-muted);">Overview of verified customer orders</span>
        </div>
        <div class="card-body-premium" style="padding: 0;">
            <div class="table-compact-container">
                <asp:GridView ID="GV_orders" runat="server" 
                    AutoGenerateColumns="False"
                    CssClass="table-compact-fit"
                    GridLines="None"
                    UseAccessibleHeader="True">
                    
                    <Columns>
                        <%-- Order Group ID --%>
                        <asp:TemplateField HeaderText="Order ID" HeaderStyle-CssClass="col-orderid" ItemStyle-CssClass="col-orderid">
                            <ItemTemplate>
                                <span style="font-weight:700; color:var(--primary); font-family: monospace; font-size: 13px;">
                                    #<%# Eval("OrderGroupID") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Customer Name --%>
                        <asp:TemplateField HeaderText="Customer" HeaderStyle-CssClass="col-user" ItemStyle-CssClass="col-user">
                            <ItemTemplate>
                                <div style="display:flex; align-items:center; gap:8px;">
                                    <div class="user-avatar-sm">
                                        <i class="fa-solid fa-user"></i>
                                    </div>
                                    <span class="truncate-text" style="font-weight:600; color:var(--text-primary);" title='<%# Eval("User_name") %>'>
                                        <%# Eval("User_name") %>
                                    </span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Product Name --%>
                        <asp:TemplateField HeaderText="Product Name" HeaderStyle-CssClass="col-product" ItemStyle-CssClass="col-product">
                            <ItemTemplate>
                                <span class="truncate-text" style="font-weight:500; color:var(--text-primary);" title='<%# Eval("Product_name") %>'>
                                    <%# Eval("Product_name") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Quantity --%>
                        <asp:TemplateField HeaderText="Quantity" HeaderStyle-CssClass="col-qty" ItemStyle-CssClass="col-qty">
                            <ItemTemplate>
                                <span style="font-weight:600; color:var(--text-secondary);">
                                    <%# Eval("Quantity") %> pcs
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- SubTotal Amount --%>
                        <asp:TemplateField HeaderText="Total Amount" HeaderStyle-CssClass="col-total" ItemStyle-CssClass="col-total">
                            <ItemTemplate>
                                <span style="font-weight:700; color:var(--success); font-size: 13.5px;">
                                    &#8377;<%# Eval("SubTotal") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Order Date (Date Only - No Time) --%>
                        <asp:TemplateField HeaderText="Order Date" HeaderStyle-CssClass="col-date" ItemStyle-CssClass="col-date">
                            <ItemTemplate>
                                <span style="font-size:12.5px; color:var(--text-secondary); white-space:nowrap;">
                                    <i class="fa-regular fa-calendar-days" style="margin-right:5px; color:var(--text-muted);"></i><%# Eval("Order_Date", "{0:dd-MM-yyyy}") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Order Status Badge --%>
                        <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="col-status" ItemStyle-CssClass="col-status">
                            <ItemTemplate>
                                <span class="badge-s bs-success" style="font-size: 10.5px; padding: 3px 10px;">
                                    <%# Eval("Order_status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <EmptyDataTemplate>
                        <div style="text-align:center; padding:45px 20px; background: var(--bg-card);">
                            <div style="width:54px;height:54px;background:var(--primary-soft);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 14px;border:2px dashed rgba(108,99,255,0.3);">
                                <i class="fa-solid fa-receipt" style="font-size:22px; color:var(--primary);"></i>
                            </div>
                            <h5 style="font-weight:700; color:var(--text-primary); margin-bottom:6px; font-size: 15px;">No Orders Found</h5>
                            <p style="color:var(--text-muted); font-size:13px; margin-bottom:0;">There are no paid orders recorded in the system yet.</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
