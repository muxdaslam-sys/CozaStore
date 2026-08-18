<%@ Page Title="Products - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Ecom_Project.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .badge-s::before {
            display: none !important;
            content: none !important;
            width: 0 !important;
            height: 0 !important;
            margin: 0 !important;
        }
        
        /* Compact Single-Page Fitting Layout */
        .prd-header-wrap {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 16px;
        }
        .prd-header-wrap h1 {
            font-size: 20px;
            font-weight: 800;
            color: var(--text-primary);
            margin: 0;
        }
        .prd-header-right {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .prd-stat-pill {
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
            min-width: 880px;
            table-layout: fixed;
            border-collapse: collapse;
        }
        .table-compact-fit th,
        .table-compact-fit td {
            padding: 10px 12px !important;
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
        
        .table-img {
            width: 38px;
            height: 38px;
            object-fit: cover;
            border-radius: var(--radius-xs, 6px);
            border: 1px solid var(--border);
            box-shadow: var(--shadow-xs);
            transition: transform 0.2s ease;
        }
        .table-img:hover {
            transform: scale(1.15);
            border-color: var(--primary);
        }
        
        /* Column Width Distribution (Sums to 100%) */
        .col-img     { width: 8%; text-align: center; }
        .col-name    { width: 24%; }
        .col-desc    { width: 28%; }
        .col-price   { width: 12%; }
        .col-stock   { width: 10%; }
        .col-status  { width: 10%; }
        .col-actions { width: 8%; text-align: center; }
        
        .truncate-text {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
            max-width: 100%;
        }
        
        .btn-action-edit {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            border: 1px solid var(--border);
            background: var(--bg-card);
            color: var(--text-secondary);
            font-size: 13px;
            transition: all 0.15s ease;
            cursor: pointer;
        }
        .btn-action-edit:hover {
            background: var(--primary-soft);
            color: var(--primary);
            border-color: rgba(108, 99, 255, 0.3);
            transform: translateY(-1px);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Compact Page Header & Actions -->
    <div class="prd-header-wrap">
        <div>
            <h1>Product Catalog & Inventory</h1>
            <div class="breadcrumb-row" style="margin-top:2px;">
                <a href="Admin_HomePage.aspx">Dashboard</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:9px;"></i></span>
                <span class="current">All Products</span>
            </div>
        </div>
        <div class="prd-header-right">
            <div class="prd-stat-pill">
                <i class="fa-solid fa-bag-shopping" style="color:var(--success);"></i> Store Catalog
            </div>
            <a href="Add_Product.aspx" class="btn-premium"><i class="fa-solid fa-plus"></i> Add Product</a>
        </div>
    </div>

    <!-- Product Catalog Card -->
    <div class="card-premium" style="margin-bottom:0;">
        <div class="card-header-premium" style="padding: 12px 20px;">
            <div class="ch-title" style="font-size: 14px;">
                <span class="ch-icon si-green" style="width:28px;height:28px;font-size:12px;"><i class="fa-solid fa-bag-shopping"></i></span>
                Product Directory
            </div>
            <span style="font-size:12px; color:var(--text-muted);">Manage product details, pricing & stock level</span>
        </div>
        <div class="card-body-premium" style="padding: 0;">
            
            <div class="table-compact-container">
                <asp:GridView ID="GV_product" runat="server" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="Product_id" 
                    OnRowEditing="GV_product_RowEditing"
                    CssClass="table-compact-fit"
                    GridLines="None"
                    UseAccessibleHeader="True">
                    
                    <Columns>
                        <%-- Image Column --%>
                        <asp:TemplateField HeaderText="Image" HeaderStyle-CssClass="col-img" ItemStyle-CssClass="col-img">
                            <ItemTemplate>
                                <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("Product_image") %>' CssClass="table-img" AlternateText="Product Image" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <%-- Product Identity Info --%>
                        <asp:TemplateField HeaderText="Product Name" HeaderStyle-CssClass="col-name" ItemStyle-CssClass="col-name">
                            <ItemTemplate>
                                <div style="min-width: 0;">
                                    <span class="truncate-text" style="font-weight: 600; color: var(--text-primary);" title='<%# Eval("Product_name") %>'><%# Eval("Product_name") %></span>
                                    <span style="font-size: 11px; color: var(--text-muted); display: block;">ID: #<%# Eval("Product_id") %> | Category: <%# Eval("Category_name") %></span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Description Column --%>
                        <asp:TemplateField HeaderText="Description" HeaderStyle-CssClass="col-desc" ItemStyle-CssClass="col-desc">
                            <ItemTemplate>
                                <span class="truncate-text" style="color: var(--text-secondary);" title='<%# Eval("Product_description") %>'>
                                    <%# Eval("Product_description") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Price Column --%>
                        <asp:TemplateField HeaderText="Price" HeaderStyle-CssClass="col-price" ItemStyle-CssClass="col-price">
                            <ItemTemplate>
                                <span style="font-weight:700; color:var(--text-primary); font-size: 13.5px;">&#8377;<%# Eval("Product_price") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Stock Column --%>
                        <asp:TemplateField HeaderText="Stock" HeaderStyle-CssClass="col-stock" ItemStyle-CssClass="col-stock">
                            <ItemTemplate>
                                <span class='<%# Convert.ToInt32(Eval("Product_stock")) == 0 ? "badge-s bs-danger" : "td-main" %>' style="font-weight:600; font-size: 12px;">
                                    <%# Eval("Product_stock") %> pcs
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Availability Status Badge --%>
                        <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="col-status" ItemStyle-CssClass="col-status">
                            <ItemTemplate>
                                <span class='<%# Eval("Product_status").ToString().Trim() == "Available" ? "badge-s bs-success" : "badge-s bs-danger" %>' style="font-size: 10.5px; padding: 3px 8px;">
                                    <%# Eval("Product_status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Action Controls --%>
                        <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="col-actions" ItemStyle-CssClass="col-actions">
                            <ItemTemplate>
                                <div style="display: flex; justify-content: center; align-items: center;">
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CssClass="btn-action-edit" ToolTip="Edit Product">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <EmptyDataTemplate>
                        <div style="text-align:center; padding:45px 20px; background: var(--bg-card);">
                            <div style="width:54px;height:54px;background:var(--success-soft);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 14px;border:2px dashed rgba(22,163,74,0.3);">
                                <i class="fa-solid fa-bag-shopping" style="font-size:22px; color:var(--success);"></i>
                            </div>
                            <h5 style="font-weight:700; color:var(--text-primary); margin-bottom:6px; font-size: 15px;">No Products Found</h5>
                            <p style="color:var(--text-muted); font-size:13px; margin-bottom:16px;">Create store products to populate your catalog.</p>
                            <a href="Add_Product.aspx" class="btn-premium"><i class="fa-solid fa-plus"></i> Add First Product</a>
                        </div>
                    </EmptyDataTemplate>

                </asp:GridView>
            </div>
            
        </div>
    </div>

</asp:Content>

