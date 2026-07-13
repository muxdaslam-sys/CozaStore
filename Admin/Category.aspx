<%@ Page Title="Categories - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Ecom_Project.Admin.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

    <div class="card-premium">
        <div class="card-header-premium">
            <div class="ch-title">
                <span class="ch-icon si-orange"><i class="fa-solid fa-layer-group"></i></span>
                Category Catalog
            </div>
            <span style="font-size:12px; color:var(--text-muted);">Manage store categories</span>
        </div>
        <div class="card-body-premium">
            <%-- Backend: Bind your GridView or Repeater here --%>
            <div style="text-align:center; padding:55px 20px;">
                <div style="width:68px;height:68px;background:var(--warning-soft);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 18px;border:2px dashed rgba(217,119,6,0.3);">
                    <i class="fa-solid fa-layer-group" style="font-size:28px; color:var(--warning);"></i>
                </div>
                <h5 style="font-weight:700; color:var(--text-primary); margin-bottom:8px;">No Categories Yet</h5>
                <p style="color:var(--text-muted); font-size:14px; margin-bottom:22px;">Place your GridView or Repeater here to display categories from the database.</p>
                <a href="Add_Category.aspx" class="btn-premium"><i class="fa-solid fa-plus"></i> Create First Category</a>
            </div>
        </div>
    </div>

</asp:Content>
