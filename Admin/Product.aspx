<%@ Page Title="Products - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Ecom_Project.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-header">
        <div>
            <h1>Products</h1>
            <div class="breadcrumb-row">
                <a href="Admin_HomePage.aspx">Dashboard</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:10px;"></i></span>
                <span class="current">All Products</span>
            </div>
        </div>
        <a href="Add_Product.aspx" class="btn-premium"><i class="fa-solid fa-circle-plus"></i> Add Product</a>
    </div>

    <div class="card-premium">
        <div class="card-header-premium">
            <div class="ch-title">
                <span class="ch-icon si-green"><i class="fa-solid fa-bag-shopping"></i></span>
                Product Catalog
            </div>
            <span style="font-size:12px; color:var(--text-muted);">Manage store inventory</span>
        </div>
        <div class="card-body-premium">
            <%-- Backend: Bind your GridView or Repeater here --%>
            <div style="text-align:center; padding:55px 20px;">
                <div style="width:68px;height:68px;background:var(--success-soft);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 18px;border:2px dashed rgba(22,163,74,0.3);">
                    <i class="fa-solid fa-bag-shopping" style="font-size:28px; color:var(--success);"></i>
                </div>
                <h5 style="font-weight:700; color:var(--text-primary); margin-bottom:8px;">No Products Yet</h5>
                <p style="color:var(--text-muted); font-size:14px; margin-bottom:22px;">Bind your GridView or Repeater here to display catalog items from the database.</p>
                <a href="Add_Product.aspx" class="btn-premium"><i class="fa-solid fa-plus"></i> Add First Product</a>
            </div>
        </div>
    </div>

</asp:Content>
