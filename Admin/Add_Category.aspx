<%@ Page Title="Add Category - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Add_Category.aspx.cs" Inherits="Ecom_Project.Admin.Add_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-header">
        <div>
            <h1>Add Category</h1>
            <div class="breadcrumb-row">
                <a href="Admin_HomePage.aspx">Dashboard</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:10px;"></i></span>
                <a href="Category.aspx">Categories</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:10px;"></i></span>
                <span class="current">Add New</span>
            </div>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-xl-6 col-lg-8">
            <div class="card-premium">
                <div class="card-header-premium">
                    <div class="ch-title">
                        <span class="ch-icon si-orange"><i class="fa-solid fa-folder-plus"></i></span>
                        Create Category
                    </div>
                    <span style="font-size:12px; color:var(--text-muted);">All fields required</span>
                </div>
                <div class="card-body-premium">

                    <div class="form-group">
                        <label>Category Name <span class="req">*</span></label>
                        <asp:TextBox ID="Category_name" runat="server" CssClass="form-control-premium" placeholder="e.g. Men's Clothing"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="Category_name"
                            ErrorMessage="Category name is required." CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>Category Image <span class="req">*</span></label>
                        <div class="file-upload-wrap">
                            <i class="fa-solid fa-cloud-arrow-up upload-icon"></i>
                            <div class="upload-text"><strong>Click to upload</strong> or drag &amp; drop<br><small>PNG, JPG, WEBP up to 5MB</small></div>
                            <asp:FileUpload ID="Category_image" runat="server" style="position:absolute;inset:0;opacity:0;cursor:pointer;width:100%;height:100%;" />
                        </div>
                        <asp:RequiredFieldValidator ID="rfvImage" runat="server" ControlToValidate="Category_image"
                            ErrorMessage="Category image is required." CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>Category Description <span class="req">*</span></label>
                        <asp:TextBox ID="Category_discription" runat="server" TextMode="MultiLine" Rows="4"
                            CssClass="form-control-premium" placeholder="e.g. Trendy clothes, shirts and accessories for men" style="height:auto;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ControlToValidate="Category_discription"
                            ErrorMessage="Description is required." CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div style="display:flex; align-items:center; justify-content:space-between; flex-wrap:wrap; gap:12px; margin-top:8px;">
                        <a href="Category.aspx" class="btn-outline"><i class="fa-solid fa-arrow-left"></i> Cancel</a>
                        <asp:Button ID="btn_add" runat="server" Text="Add Category" CssClass="btn-premium" OnClick="btn_add_Click" />
                    </div>

                    <asp:Label ID="lblMsg" runat="server" visible="false" CssClass="msg-label"></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
