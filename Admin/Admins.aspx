<%@ Page Title="Admins - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admins.aspx.cs" Inherits="Ecom_Project.Admin.Admins" %>

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
        .adm-header-wrap {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 16px;
        }
        .adm-header-wrap h1 {
            font-size: 20px;
            font-weight: 800;
            color: var(--text-primary);
            margin: 0;
        }
        .adm-header-right {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .adm-stat-pill {
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
        
        .btn-add-admin-wrap input[type="submit"],
        .btn-add-admin-wrap input[type="button"],
        .btn-add-admin-wrap button {
            background: linear-gradient(135deg, #6c63ff, #5a52e0);
            color: #ffffff;
            border: none;
            padding: 8px 16px;
            border-radius: var(--radius-md, 8px);
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 3px 10px rgba(108, 99, 255, 0.25);
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .btn-add-admin-wrap input[type="submit"]:hover,
        .btn-add-admin-wrap input[type="button"]:hover,
        .btn-add-admin-wrap button:hover {
            transform: translateY(-1px);
            box-shadow: 0 5px 14px rgba(108, 99, 255, 0.35);
            background: linear-gradient(135deg, #5a52e0, #4834d4);
        }

        .table-compact-container {
            width: 100%;
            overflow-x: auto;
            display: block;
            -webkit-overflow-scrolling: touch;
        }
        .table-compact-fit {
            width: 100% !important;
            min-width: 800px;
            table-layout: fixed;
            border-collapse: collapse;
        }
        .table-compact-fit th,
        .table-compact-fit td {
            padding: 10px 14px !important;
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
        
        /* Role Tag Styling */
        .admin-role-tag {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: linear-gradient(135deg, rgba(108, 99, 255, 0.12), rgba(83, 70, 232, 0.12));
            color: #5346e8;
            border: 1px solid rgba(108, 99, 255, 0.25);
            padding: 4px 10px;
            border-radius: 6px;
            font-size: 11.5px;
            font-weight: 700;
            letter-spacing: 0.3px;
            text-transform: uppercase;
            box-shadow: 0 1px 2px rgba(108, 99, 255, 0.05);
            white-space: nowrap;
        }
        
        /* Column Width Distribution (Sums to 100%) */
        .col-admin    { width: 25%; }
        .col-email    { width: 27%; }
        .col-username { width: 17%; }
        .col-password { width: 15%; }
        .col-role     { width: 16%; }
        
        .truncate-text {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
            max-width: 100%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Compact Page Header & Actions -->
    <div class="adm-header-wrap">
        <div>
            <h1>Admin Directory & Accounts</h1>
            <div class="breadcrumb-row" style="margin-top:2px;">
                <a href="Admin_HomePage.aspx">Dashboard</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:9px;"></i></span>
                <span class="current">Administrators</span>
            </div>
        </div>
        <div class="adm-header-right">
            <div class="adm-stat-pill">
                <i class="fa-solid fa-user-shield" style="color:var(--primary);"></i> Super Admin Privileges
            </div>
            <div class="btn-add-admin-wrap">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="+ Add New Admin" />
            </div>
        </div>
    </div>

    <!-- Admin Directory Card -->
    <div class="card-premium" style="margin-bottom:0;">
        <div class="card-header-premium" style="padding: 12px 20px;">
            <div class="ch-title" style="font-size: 14px;">
                <span class="ch-icon si-purple" style="width:28px;height:28px;font-size:12px;"><i class="fa-solid fa-users-gear"></i></span>
                Administrator Directory
            </div>
            <span style="font-size:12px; color:var(--text-muted);">Manage admin login credentials & system access</span>
        </div>
        <div class="card-body-premium" style="padding: 0;">
            
            <div class="table-compact-container">
                <asp:GridView ID="GV_admin" runat="server" 
                    AutoGenerateColumns="False"
                    CssClass="table-compact-fit"
                    GridLines="None"
                    UseAccessibleHeader="True">
                    
                    <Columns>
                        <%-- Admin Profile & Name --%>
                        <asp:TemplateField HeaderText="Administrator" HeaderStyle-CssClass="col-admin" ItemStyle-CssClass="col-admin">
                            <ItemTemplate>
                                <div style="display: flex; align-items: center; gap: 10px;">
                                    <div style="width: 34px; height: 34px; border-radius: 50%; background: linear-gradient(135deg, #6c63ff, #4834d4); color: #ffffff; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 13px; flex-shrink: 0; box-shadow: 0 2px 8px rgba(108,99,255,0.25);">
                                        <%# Eval("Admin_name") != null && Eval("Admin_name").ToString().Length > 0 ? Eval("Admin_name").ToString().Substring(0, 1).ToUpper() : "A" %>
                                    </div>
                                    <div style="min-width: 0;">
                                        <span class="truncate-text" style="font-weight: 600; color: var(--text-primary);" title='<%# Eval("Admin_name") %>'><%# Eval("Admin_name") %></span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <%-- Admin Email --%>
                        <asp:TemplateField HeaderText="Email Address" HeaderStyle-CssClass="col-email" ItemStyle-CssClass="col-email">
                            <ItemTemplate>
                                <div style="min-width: 0;">
                                    <a href='<%# "mailto:" + Eval("Admin_email") %>' class="truncate-text" style="color: var(--text-primary); text-decoration: none;" title='<%# Eval("Admin_email") %>'>
                                        <i class="fa-regular fa-envelope" style="color: var(--primary); font-size: 11px; margin-right: 4px;"></i><%# Eval("Admin_email") %>
                                    </a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Username --%>
                        <asp:TemplateField HeaderText="Username" HeaderStyle-CssClass="col-username" ItemStyle-CssClass="col-username">
                            <ItemTemplate>
                                <span style="font-family: monospace; font-size: 12px; font-weight: 600; color: var(--primary); background: var(--primary-soft); padding: 3px 8px; border-radius: 6px; border: 1px solid rgba(108, 99, 255, 0.2); display: inline-block;">
                                    <i class="fa-solid fa-user-shield" style="margin-right: 4px; font-size: 10px;"></i><%# Eval("Username") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Password --%>
                        <asp:TemplateField HeaderText="Password" HeaderStyle-CssClass="col-password" ItemStyle-CssClass="col-password">
                            <ItemTemplate>
                                <span style="font-family: monospace; font-weight: 600; color: var(--text-primary); font-size: 12px; background: var(--bg); padding: 3px 8px; border-radius: var(--radius-xs); border: 1px solid var(--border); display: inline-block;">
                                    <%# Eval("Password") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- System Role --%>
                        <asp:TemplateField HeaderText="System Role" HeaderStyle-CssClass="col-role" ItemStyle-CssClass="col-role">
                            <ItemTemplate>
                                <span class="admin-role-tag">
                                    <i class="fa-solid fa-shield-halved" style="font-size: 11px;"></i>Super Admin
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <EmptyDataTemplate>
                        <div style="text-align:center; padding:45px 20px; background: var(--bg-card);">
                            <div style="width:54px;height:54px;background:var(--primary-soft);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 14px;border:2px dashed rgba(108,99,255,0.3);">
                                <i class="fa-solid fa-user-plus" style="font-size:22px; color:var(--primary);"></i>
                            </div>
                            <h5 style="font-weight:700; color:var(--text-primary); margin-bottom:6px; font-size: 15px;">No Admin Accounts Found</h5>
                            <p style="color:var(--text-muted); font-size:13px; margin-bottom:16px;">Create administrator accounts to manage the store catalog and user operations.</p>
                            <div class="btn-add-admin-wrap">
                                <asp:Button ID="btnEmptyAdd" runat="server" OnClick="Button1_Click" Text="+ Add First Admin" />
                            </div>
                        </div>
                    </EmptyDataTemplate>

                </asp:GridView>
            </div>
            
        </div>
    </div>

</asp:Content>



