<%@ Page Title="User Management - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="Ecom_Project.Admin.UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .badge-s::before {
            display: none !important;
            content: none !important;
            width: 0 !important;
            height: 0 !important;
            margin: 0 !important;
        }
        
        /* Compact Single-Page Fitting Table Layout */
        .um-header-wrap {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 16px;
        }
        .um-header-wrap h1 {
            font-size: 20px;
            font-weight: 800;
            color: var(--text-primary);
            margin: 0;
        }
        .um-stats-pills {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .um-stat-pill {
            background: #ffffff;
            border: 1px solid var(--border);
            padding: 5px 12px;
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
            min-width: 860px;
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
        
        /* Column Width Distribution (Sums to 100%) */
        .col-customer { width: 22%; }
        .col-contact  { width: 23%; }
        .col-location { width: 20%; }
        .col-status   { width: 11%; }
        .col-actions  { width: 24%; }
        
        .truncate-text {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
            max-width: 100%;
        }
        
        /* Compact Action Buttons */
        .btn-sm-suspend {
            background-color: #fef2f2;
            color: #ef4444;
            border: 1px solid #fca5a5;
            padding: 5px 12px;
            border-radius: 6px;
            font-size: 11.5px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.15s ease;
            white-space: nowrap;
            flex-shrink: 0;
            display: inline-block;
        }
        .btn-sm-suspend:hover {
            background-color: #ef4444;
            color: #ffffff;
            border-color: #dc2626;
        }
        .btn-sm-access {
            background-color: #f0fdf4;
            color: #16a34a;
            border: 1px solid #86efac;
            padding: 5px 12px;
            border-radius: 6px;
            font-size: 11.5px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.15s ease;
            white-space: nowrap;
            flex-shrink: 0;
            display: inline-block;
        }
        .btn-sm-access:hover {
            background-color: #16a34a;
            color: #ffffff;
            border-color: #15803d;
        }
        .actions-wrap {
            display: flex;
            gap: 8px;
            align-items: center;
            justify-content: flex-start;
            flex-wrap: nowrap;
            width: 100%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Compact Page Header & Quick Metrics -->
    <div class="um-header-wrap">
        <div>
            <h1>User Directory & Management</h1>
            <div class="breadcrumb-row" style="margin-top:2px;">
                <a href="Admin_HomePage.aspx">Dashboard</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:9px;"></i></span>
                <span class="current">User Directory</span>
            </div>
        </div>
        <div class="um-stats-pills">
            <div class="um-stat-pill">
                <i class="fa-solid fa-users" style="color:var(--primary);"></i> Customer Directory
            </div>
            <div class="um-stat-pill">
                <i class="fa-solid fa-shield-halved" style="color:#16a34a;"></i> Live Access Control
            </div>
        </div>
    </div>

    <!-- Main Table Container -->
    <div class="card-premium" style="margin-bottom:0;">
        <div class="card-header-premium" style="padding: 12px 20px;">
            <div class="ch-title" style="font-size: 14px;">
                <span class="ch-icon si-orange" style="width:28px;height:28px;font-size:12px;"><i class="fa-solid fa-users"></i></span>
                Registered Users Catalog
            </div>
            <span style="font-size:12px; color:var(--text-muted);">Manage customer permissions & access</span>
        </div>
        <div class="card-body-premium" style="padding: 0;">
            
            <div class="table-compact-container">
                <asp:GridView ID="GV_User" runat="server" 
                    AutoGenerateColumns="False"
                    CssClass="table-compact-fit"
                    GridLines="None"
                    UseAccessibleHeader="True">
                    
                    <Columns>
                        <%-- Customer Info --%>
                        <asp:TemplateField HeaderText="Customer" HeaderStyle-CssClass="col-customer" ItemStyle-CssClass="col-customer">
                            <ItemTemplate>
                                <div style="display: flex; align-items: center; gap: 10px;">
                                    <div style="width: 34px; height: 34px; border-radius: 50%; background: linear-gradient(135deg, #06b6d4, #3b82f6); color: #ffffff; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 13px; flex-shrink: 0;">
                                        <%# Eval("User_name") != null && Eval("User_name").ToString().Length > 0 ? Eval("User_name").ToString().Substring(0, 1).ToUpper() : "U" %>
                                    </div>
                                    <div style="min-width: 0;">
                                        <span class="truncate-text" style="font-weight: 600; color: var(--text-primary);" title='<%# Eval("User_name") %>'><%# Eval("User_name") %></span>
                                        <span style="font-size: 11px; color: var(--text-muted); display: block;">ID: #<%# Eval("User_id") %> | Age: <%# Eval("User_age") %></span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Contact Information --%>
                        <asp:TemplateField HeaderText="Contact Info" HeaderStyle-CssClass="col-contact" ItemStyle-CssClass="col-contact">
                            <ItemTemplate>
                                <div style="min-width: 0;">
                                    <a href='<%# "mailto:" + Eval("User_email") %>' class="truncate-text" style="color: var(--text-primary); text-decoration: none;" title='<%# Eval("User_email") %>'>
                                        <i class="fa-regular fa-envelope" style="color: var(--primary); font-size: 11px; margin-right: 4px;"></i><%# Eval("User_email") %>
                                    </a>
                                    <span style="font-size: 11.5px; color: var(--text-secondary); display: block; margin-top: 1px;">
                                        <i class="fa-solid fa-phone" style="color: #10b981; font-size: 10px; margin-right: 4px;"></i><%# Eval("User_phone") %>
                                    </span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Address & Pincode --%>
                        <asp:TemplateField HeaderText="Address & Location" HeaderStyle-CssClass="col-location" ItemStyle-CssClass="col-location">
                            <ItemTemplate>
                                <div style="min-width: 0;">
                                    <span class="truncate-text" title='<%# Eval("User_address") %>'>
                                        <i class="fa-solid fa-location-dot" style="color: var(--warning); margin-right: 4px; font-size: 11px;"></i><%# Eval("User_address") %>
                                    </span>
                                    <span style="font-size: 11px; color: var(--text-muted); display: block;">PIN: <%# Eval("User_pincode") %></span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Status --%>
                        <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="col-status" ItemStyle-CssClass="col-status">
                            <ItemTemplate>
                                <span class='<%# Eval("User_status") != null && Eval("User_status").ToString().Trim().Equals("Active", StringComparison.OrdinalIgnoreCase) ? "badge-s bs-success" : "badge-s bs-danger" %>' style="font-size: 10.5px; padding: 3px 8px;">
                                    <%# Eval("User_status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Actions --%>
                        <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="col-actions" ItemStyle-CssClass="col-actions">
                            <ItemTemplate>
                                <div class="actions-wrap">
                                    <asp:Button ID="btn_sus" runat="server" CommandArgument='<%# Eval("User_id") %>' OnClick="btn_sus_Click" Text="Suspend" CssClass="btn-sm-suspend" ToolTip="Suspend User" />
                                    <asp:Button ID="btn_access" runat="server" CommandArgument='<%# Eval("User_id") %>' OnClick="btn_access_Click" Text="Grand Access" CssClass="btn-sm-access" ToolTip="Grant Access" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <EmptyDataTemplate>
                        <div style="text-align:center; padding:45px 20px; background: var(--bg-card);">
                            <div style="width:54px;height:54px;background:rgba(245,158,11,0.15);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 14px;border:2px dashed rgba(245,158,11,0.3);">
                                <i class="fa-solid fa-users-slash" style="font-size:22px; color:#f59e0b;"></i>
                            </div>
                            <h5 style="font-weight:700; color:var(--text-primary); margin-bottom:6px; font-size: 15px;">No Registered Users Found</h5>
                            <p style="color:var(--text-muted); font-size:13px; margin:0;">Customer accounts will appear here once users register on the online store.</p>
                        </div>
                    </EmptyDataTemplate>

                </asp:GridView>
            </div>
            
        </div>
    </div>

</asp:Content>



