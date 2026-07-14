<%@ Page Title="Categories - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Ecom_Project.Admin.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .table-img {
            width: 48px;
            height: 48px;
            object-fit: cover;
            border-radius: var(--radius-sm);
            border: 1px solid var(--border);
            box-shadow: var(--shadow-xs);
            transition: var(--transition-fast);
        }
        .table-img:hover {
            transform: scale(1.08) rotate(1deg);
            border-color: var(--primary-light);
            box-shadow: var(--shadow-sm);
        }
        .desc-truncate {
            color: var(--text-secondary);
            font-size: 13px;
            line-height: 1.5;
            max-width: 320px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .btn-action {
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
            transition: var(--transition-fast);
            cursor: pointer;
        }
        .btn-action:hover {
            background: var(--primary-soft);
            color: var(--primary);
            border-color: rgba(108, 99, 255, 0.3);
            transform: translateY(-1px);
            box-shadow: var(--shadow-xs);
        }
        .table-container {
            overflow-x: auto;
            width: 100%;
        }
        
        /* Column dimensions and spacing */
        .table-premium th:first-child,
        .table-premium td:first-child {
            width: 90px;
            padding-left: 24px !important;
        }
        .table-premium th:nth-child(2),
        .table-premium td:nth-child(2) {
            width: 200px;
        }
        .table-premium th:nth-child(4),
        .table-premium td:nth-child(4) {
            width: 140px;
        }
        .table-premium th:last-child,
        .table-premium td:last-child {
            width: 100px;
            text-align: center;
            padding-right: 24px !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header -->
    <div class="page-header">
        <div>
            <h1>Categories</h1>
            <div class="breadcrumb-row">
                <a href="Admin_HomePage.aspx">Dashboard</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:10px;"></i></span>
                <span class="current">All Categories</span>
            </div>
        </div>
        <a href="Add_Category.aspx" class="btn-premium"><i class="fa-solid fa-folder-plus"></i> Add Category</a>
    </div>

    <!-- Catalog Card -->
    <div class="card-premium">
        <div class="card-header-premium">
            <div class="ch-title">
                <span class="ch-icon si-orange"><i class="fa-solid fa-layer-group"></i></span>
                Category Catalog
            </div>
            <span style="font-size:12px; color:var(--text-muted);">Manage store categories</span>
        </div>
        <div class="card-body-premium" style="padding: 0;">
            
            <div class="table-container">
                <asp:GridView ID="GV_category" runat="server" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="Category_id" 
                    OnRowEditing="GV_category_RowEditing"
                    CssClass="table-premium"
                    GridLines="None"
                    UseAccessibleHeader="True">
                    
                    <Columns>
                        <%-- Image Column --%>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="imgCategory" runat="server" ImageUrl='<%# Eval("Category_image") %>' CssClass="table-img" AlternateText="Category Image" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <%-- Category Identity Info --%>
                        <asp:TemplateField HeaderText="Category Name">
                            <ItemTemplate>
                                <span class="td-main"><%# Eval("Category_name") %></span>
                                <span class="td-sub">ID: #<%# Eval("Category_id") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Description Column --%>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <div class="desc-truncate" title='<%# Eval("Category_description") %>'>
                                    <%# Eval("Category_description") %>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Availability Status Badge --%>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class='<%# Eval("Category_status").ToString().Trim() == "Available" ? "badge-s bs-success" : "badge-s bs-danger" %>'>
                                    <%# Eval("Category_status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Action Controls --%>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div style="display: flex; gap: 8px; justify-content: center; align-items: center;">
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CssClass="btn-action" ToolTip="Edit Category">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <EmptyDataTemplate>
                        <div style="text-align:center; padding:65px 20px; background: var(--bg-card);">
                            <div style="width:68px;height:68px;background:var(--warning-soft);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 18px;border:2px dashed rgba(217,119,6,0.3);">
                                <i class="fa-solid fa-layer-group" style="font-size:28px; color:var(--warning);"></i>
                            </div>
                            <h5 style="font-weight:700; color:var(--text-primary); margin-bottom:8px;">No Categories Found</h5>
                            <p style="color:var(--text-muted); font-size:14px; margin-bottom:22px;">Create store categories to organize and display items in the catalog.</p>
                            <a href="Add_Category.aspx" class="btn-premium"><i class="fa-solid fa-plus"></i> Add First Category</a>
                        </div>
                    </EmptyDataTemplate>

                </asp:GridView>
            </div>
            
        </div>
    </div>

</asp:Content>

