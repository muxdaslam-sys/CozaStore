<%@ Page Title="Add Admin - CozaStore" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Add_Admin.aspx.cs" Inherits="Ecom_Project.Admin.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-header">
        <div>
            <h1>Add Administrator</h1>
            <div class="breadcrumb-row">
                <a href="Admin_HomePage.aspx">Dashboard</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:10px;"></i></span>
                <span class="current">Add Admin</span>
            </div>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-xl-7 col-lg-9">
            <div class="card-premium">
                <div class="card-header-premium">
                    <div class="ch-title">
                        <span class="ch-icon si-purple"><i class="fa-solid fa-user-shield"></i></span>
                        Register New Admin
                    </div>
                    <span style="font-size:12px; color:var(--text-muted);">All fields required</span>
                </div>
                <div class="card-body-premium">

                    <div class="form-section-title">Personal Details</div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Full Name <span class="req">*</span></label>
                                <asp:TextBox ID="tbname" runat="server" CssClass="form-control-premium" placeholder="e.g. John Doe"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="tbname" ErrorMessage="Full name is required."
                                    CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Email Address <span class="req">*</span></label>
                                <asp:TextBox ID="tbemail" runat="server" CssClass="form-control-premium" placeholder="john@example.com"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ControlToValidate="tbemail" ErrorMessage="Enter a valid email address."
                                    ValidationExpression="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
                                    CssClass="form-validation-error" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>

                    <div class="form-section-title">Login Credentials</div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Username <span class="req">*</span></label>
                                <asp:TextBox ID="tbuna" runat="server" CssClass="form-control-premium" placeholder="e.g. johndoe_admin"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="tbuna" ErrorMessage="Username is required."
                                    CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Password <span class="req">*</span></label>
                                <asp:TextBox ID="tbpwd" runat="server" TextMode="Password" CssClass="form-control-premium" placeholder="Min. 8 characters"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="tbpwd" ErrorMessage="Password is required."
                                    CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div style="display:flex; align-items:center; justify-content:space-between; flex-wrap:wrap; gap:12px; margin-top:8px;">
                        <a href="Admin_HomePage.aspx" class="btn-outline"><i class="fa-solid fa-arrow-left"></i> Cancel</a>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register Admin" CssClass="btn-premium" />
                    </div>

                    <asp:Label ID="Label5" runat="server" visible="false" CssClass="msg-label"></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
