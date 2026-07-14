<%@ Page Title="Edit Category - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Edit_Category.aspx.cs" Inherits="Ecom_Project.Admin.Edit_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .current-image-card {
            display: flex;
            align-items: center;
            gap: 16px;
            padding: 12px 16px;
            background: var(--bg);
            border: 1px solid var(--border);
            border-radius: var(--radius-md);
            margin-bottom: 12px;
            transition: var(--transition-fast);
        }
        .current-image-card:hover {
            border-color: var(--primary-light);
            background: rgba(108, 99, 255, 0.02);
        }
        .current-image-preview {
            height: 68px;
            width: 68px;
            object-fit: cover;
            border-radius: var(--radius-sm);
            border: 2px solid var(--bg-card);
            box-shadow: var(--shadow-xs);
        }
        .preview-badge {
            font-size: 10px;
            font-weight: 700;
            background: var(--info-soft);
            color: var(--info);
            padding: 2px 6px;
            border-radius: 10px;
            margin-top: 4px;
            display: inline-block;
        }
        .status-dropdown {
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header & Breadcrumbs -->
    <div class="page-header">
        <div>
            <h1>Edit Category</h1>
            <div class="breadcrumb-row">
                <a href="Admin_HomePage.aspx">Dashboard</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:10px;"></i></span>
                <a href="Category.aspx">Categories</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:10px;"></i></span>
                <span class="current">Edit Category</span>
            </div>
        </div>
    </div>

    <!-- Edit Form Container -->
    <div class="row justify-content-center">
        <div class="col-xl-6 col-lg-8">
            <div class="card-premium">
                <div class="card-header-premium">
                    <div class="ch-title">
                        <span class="ch-icon si-orange"><i class="fa-solid fa-pen-to-square"></i></span>
                        Edit Category Details
                    </div>
                    <span style="font-size:12px; color:var(--text-muted);">Modify properties & save</span>
                </div>
                <div class="card-body-premium">

                    <!-- Category Name Field -->
                    <div class="form-group">
                        <label>Category Name <span class="req">*</span></label>
                        <asp:TextBox ID="Category_name" ReadOnly="True" runat="server" CssClass="form-control-premium" placeholder="e.g. Women's Fashion"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="Category_name"
                            ErrorMessage="Category name is required." CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                    </div>

                    <!-- Current Category Image Showcase -->
                    <div class="form-group">
                        <label>Current Image</label>
                        <div class="current-image-card">
                            <asp:Image ID="imgCurrent" runat="server" CssClass="current-image-preview" AlternateText="No Image Found" />
                            <div>
                                <span style="font-size:13px; font-weight:600; color:var(--text-primary); display:block;">Active Category Banner</span>
                                <span style="font-size:11px; color:var(--text-muted); display:block;">This image is currently displayed in the shop navigation.</span>
                            </div>
                        </div>
                    </div>

                    <!-- Upload New Image Field -->
                    <div class="form-group">
                        <label>Upload New Image</label>
                        <div class="file-upload-wrap">
                            <i class="fa-solid fa-cloud-arrow-up upload-icon"></i>
                            <div class="upload-text">
                                <strong>Click to replace image</strong> or drag &amp; drop<br>
                                <small>PNG, JPG, WEBP up to 5MB</small>
                            </div>
                            <asp:FileUpload ID="Category_image" runat="server" ClientIDMode="Static" style="position:absolute;inset:0;opacity:0;cursor:pointer;width:100%;height:100%;" />
                        </div>
                        <span style="font-size:11px; color:var(--text-muted); margin-top:5px; display:block;">
                            <i class="fa-solid fa-circle-info" style="margin-right:2px;"></i> Leave blank if you don't want to change the image.
                        </span>
                        
                        <!-- Client-side Interactive Live Upload Preview -->
                        <div id="newImagePreviewContainer" style="display:none; margin-top:12px;">
                            <div class="current-image-card" style="border-color: var(--info-soft); background: var(--info-soft); background-opacity: 0.16;">
                                <img id="newImgPreview" class="current-image-preview" src="#" alt="New Image Preview" />
                                <div>
                                    <span style="font-size:13px; font-weight:600; color:var(--text-primary); display:block;">New Selected Image</span>
                                    <span class="preview-badge">Ready to Upload</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Category Description Field -->
                    <div class="form-group">
                        <label>Category Description <span class="req">*</span></label>
                        <asp:TextBox ID="Category_discription" runat="server" TextMode="MultiLine" Rows="4"
                            CssClass="form-control-premium" placeholder="Enter a description of this category..." style="height:auto;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ControlToValidate="Category_discription"
                            ErrorMessage="Description is required." CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Category Availability Status Dropdown -->
                    <div class="form-group">
                        <label>Availability Status <span class="req">*</span></label>
                        <asp:DropDownList ID="Category_status" runat="server" CssClass="form-control-premium status-dropdown">
                            <asp:ListItem Value="Available" Text="Available"></asp:ListItem>
                            <asp:ListItem Value="Not Available" Text="Not Available"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="Category_status"
                            ErrorMessage="Status selection is required." CssClass="form-validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Form Navigation / Submission Actions -->
                    <div style="display:flex; align-items:center; justify-content:space-between; flex-wrap:wrap; gap:12px; margin-top:28px; border-top:1px solid var(--border); padding-top:20px;">
                        <a href="Category.aspx" class="btn-outline"><i class="fa-solid fa-arrow-left"></i> Cancel</a>
                        <asp:Button ID="btn_update" runat="server" Text="Save Changes" CssClass="btn-premium" OnClick="btn_update_Click" />
                    </div>

                    <!-- Message Feedback Label -->
                    <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="msg-label" style="display:block; margin-top:15px; text-align:center;"></asp:Label>

                </div>
            </div>
        </div>
    </div>

    <!-- Live Preview Script -->
    <script type="text/javascript">
        (function () {
            var fileInput = document.getElementById('Category_image');
            var previewContainer = document.getElementById('newImagePreviewContainer');
            var previewImg = document.getElementById('newImgPreview');

            if (fileInput) {
                fileInput.addEventListener('change', function () {
                    if (this.files && this.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            previewImg.src = e.target.result;
                            previewContainer.style.display = 'block';
                        };
                        reader.readAsDataURL(this.files[0]);
                    } else {
                        previewContainer.style.display = 'none';
                    }
                });
            }
        })();
    </script>

</asp:Content>

