<%@ Page Title="Add Product - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Add_Product.aspx.cs" Inherits="Ecom_Project.Admin.Add_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-header">
        <div>
            <h1>Add Product</h1>
            <div class="breadcrumb-row">
                <a href="Admin_HomePage.aspx">Dashboard</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:10px;"></i></span>
                <a href="Product.aspx">Products</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:10px;"></i></span>
                <span class="current">Add New</span>
            </div>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-xl-8 col-lg-10">
            <div class="card-premium">
                <div class="card-header-premium">
                    <div class="ch-title">
                        <span class="ch-icon si-green"><i class="fa-solid fa-circle-plus"></i></span>
                        Add Store Product
                    </div>
                    <span style="font-size:12px; color:var(--text-muted);">All fields required</span>
                </div>
                <div class="card-body-premium">

                    <div class="form-section-title">Product Identity</div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Product Name <span class="req">*</span></label>
                                <asp:TextBox ID="Product_name" runat="server" CssClass="form-control-premium" placeholder="e.g. Classic Denim Shirt"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvProdName" runat="server" ControlToValidate="Product_name"
                                    ErrorMessage="Product name is required." CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Select Category <span class="req">*</span></label>
                                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control-premium">
                                    <asp:ListItem Value="0" Text="-- Choose a Category --"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory"
                                    InitialValue="0" ErrorMessage="Please select a category."
                                    CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="form-section-title">Pricing &amp; Stock</div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Price (&#8377;) <span class="req">*</span></label>
                                <asp:TextBox ID="Product_price" runat="server" CssClass="form-control-premium" placeholder="0.00"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="Product_price"
                                    ErrorMessage="Price is required." CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvPrice" runat="server" ControlToValidate="Product_price"
                                    Operator="DataTypeCheck" Type="Double" ErrorMessage="Enter a valid price."
                                    CssClass="form-validation-error" Display="Dynamic"></asp:CompareValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Stock Quantity <span class="req">*</span></label>
                                <asp:TextBox ID="Product_stock" runat="server" TextMode="Number" CssClass="form-control-premium" placeholder="0"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="Product_stock"
                                    ErrorMessage="Stock quantity is required." CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="form-section-title">Media &amp; Description</div>

                    <div class="form-group">
                        <label>Product Image <span class="req">*</span></label>
                        <div class="file-upload-wrap">
                            <i class="fa-solid fa-image upload-icon"></i>
                            <div class="upload-text"><strong>Click to upload</strong> or drag &amp; drop<br><small>PNG, JPG, WEBP up to 5MB</small></div>
                            <asp:FileUpload ID="Product_image" runat="server" style="position:absolute;inset:0;opacity:0;cursor:pointer;width:100%;height:100%;" />
                        </div>
                        <asp:RequiredFieldValidator ID="rfvProdImg" runat="server" ControlToValidate="Product_image"
                            ErrorMessage="Product image is required." CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>Product Description <span class="req">*</span></label>
                        <asp:TextBox ID="Product_discription" runat="server" TextMode="MultiLine" Rows="4"
                            CssClass="form-control-premium" placeholder="Detailed product specifications, sizes, materials..." style="height:auto;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ControlToValidate="Product_discription"
                            ErrorMessage="Description is required." CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div style="display:flex; align-items:center; justify-content:space-between; flex-wrap:wrap; gap:12px; margin-top:8px;">
                        <a href="Product.aspx" class="btn-outline"><i class="fa-solid fa-arrow-left"></i> Cancel</a>
                        <asp:Button ID="btn_add" runat="server" Text="Add Product" CssClass="btn-premium" OnClick="btn_add_Click" />
                    </div>

                    <asp:Label ID="lblMsg" runat="server" visible="false" CssClass="msg-label"></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
