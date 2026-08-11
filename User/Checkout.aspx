<%@ Page Title="Checkout - CozaStore" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Ecom_Project.User.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ═══════════════════════════════════════════
           COZASTORE CHECKOUT PAGE REDESIGN
        ═══════════════════════════════════════════ */

        .coza-checkout-wrapper {
            background: linear-gradient(180deg, #f8f9fd 0%, #ffffff 100%);
            padding-top: 45px;
            padding-bottom: 90px;
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            min-height: 85vh;
        }

        .coza-checkout-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* ---------- Step Indicator Stepper ---------- */
        .coza-step-indicator {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 40px;
            gap: 16px;
            flex-wrap: wrap;
        }

        .coza-step-item {
            display: flex;
            align-items: center;
            gap: 10px;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            font-weight: 500;
            color: #94a3b8;
        }

        .coza-step-item.active {
            color: #717fe0;
            font-weight: 700;
        }

        .coza-step-item.completed {
            color: #10b981;
            font-weight: 600;
        }

        .coza-step-badge {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background: #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            font-weight: 700;
            color: #64748b;
            transition: all 0.3s ease;
        }

        .coza-step-item.active .coza-step-badge {
            background: linear-gradient(135deg, #717fe0 0%, #5a67d8 100%);
            color: #ffffff;
            box-shadow: 0 4px 14px rgba(113, 127, 224, 0.4);
        }

        .coza-step-item.completed .coza-step-badge {
            background: #10b981;
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.25);
        }

        .coza-step-line {
            width: 60px;
            height: 2px;
            background: #e2e8f0;
            border-radius: 2px;
        }

        /* ---------- Card Containers ---------- */
        .coza-card {
            background: #ffffff;
            border-radius: 20px;
            border: 1px solid rgba(230, 233, 245, 0.9);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.04);
            padding: 28px;
            margin-bottom: 28px;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .coza-card-header {
            font-size: 17px;
            font-weight: 700;
            color: #1a1a24;
            margin-bottom: 22px;
            display: flex;
            align-items: center;
            gap: 12px;
            padding-bottom: 14px;
            border-bottom: 2px solid #f0f2f7;
            letter-spacing: 0.3px;
        }

        .coza-card-header i {
            color: #717fe0;
            font-size: 20px;
            width: 36px;
            height: 36px;
            border-radius: 10px;
            background: rgba(113, 127, 224, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* ---------- Information Grid Tiles ---------- */
        .info-grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(210px, 1fr));
            gap: 16px;
        }

        .info-card-item {
            background: #f8fafc;
            border-radius: 14px;
            padding: 16px 18px;
            border: 1px solid #eef2f7;
            transition: all 0.25s ease;
        }

        .info-card-item:hover {
            border-color: #717fe0;
            background: #ffffff;
            box-shadow: 0 6px 16px rgba(113, 127, 224, 0.08);
        }

        .info-card-item .asp-label-title {
            font-size: 11px;
            font-weight: 700;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            margin-bottom: 4px;
            display: block;
        }

        .info-card-item .asp-value-text {
            font-size: 14px;
            font-weight: 600;
            color: #1e293b;
            display: block;
            word-break: break-word;
        }

        /* ---------- Payment Method Controls ---------- */
        .coza-form-group {
            margin-bottom: 20px;
        }

        .coza-field-label {
            font-size: 13px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 8px;
            display: block;
        }

        .coza-select-input {
            width: 100%;
            height: 48px;
            border-radius: 12px;
            border: 1.5px solid #cbd5e1;
            padding: 0 16px;
            font-size: 14px;
            font-weight: 500;
            color: #1e293b;
            background-color: #ffffff;
            outline: none;
            transition: all 0.25s ease;
            cursor: pointer;
            box-shadow: 0 2px 6px rgba(0,0,0,0.02);
        }

        .coza-select-input:focus, .coza-select-input:hover {
            border-color: #717fe0;
            box-shadow: 0 0 0 4px rgba(113, 127, 224, 0.12);
        }

        .btn-coza-add-bank {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            height: 44px;
            padding: 0 22px;
            background: #f1f5f9;
            color: #475569;
            border: 1.5px dashed #cbd5e1;
            border-radius: 12px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.25s ease;
            margin-top: 10px;
            text-decoration: none !important;
        }

        .btn-coza-add-bank:hover {
            background: #717fe0;
            color: #ffffff;
            border-style: solid;
            border-color: #717fe0;
            box-shadow: 0 4px 14px rgba(113, 127, 224, 0.3);
        }

        .coza-alert-msg {
            display: block;
            padding: 10px 14px;
            background: #fef2f2;
            border: 1px solid #fecaca;
            color: #ef4444;
            border-radius: 10px;
            font-size: 13px;
            font-weight: 600;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        /* ---------- Bank Account Details Card ---------- */
        .coza-bank-details-panel {
            background: linear-gradient(135deg, #f0f4ff 0%, #e8eeff 100%);
            border: 1.5px solid #c7d2fe;
            border-radius: 16px;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 6px 18px rgba(99, 102, 241, 0.06);
        }

        .coza-bank-details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 16px;
        }

        .coza-bank-item {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .coza-bank-label {
            font-size: 11px;
            font-weight: 700;
            color: #6366f1;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .coza-bank-value {
            font-size: 15px;
            font-weight: 700;
            color: #1e1b4b;
        }

        .coza-bank-balance {
            font-size: 18px;
            font-weight: 800;
            color: #10b981;
        }

        .coza-trust-seal {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #10b981;
            font-size: 13px;
            font-weight: 600;
            margin-top: 22px;
            padding: 12px 18px;
            background: #ecfdf5;
            border-radius: 12px;
            border: 1px solid #a7f3d0;
        }

        /* ---------- Order Items Summary Table ---------- */
        .coza-checkout-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 20px;
        }

        .coza-checkout-table th {
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            color: #64748b;
            padding: 12px;
            border-bottom: 2px solid #e2e8f0;
            background: #f8fafc;
        }

        .coza-checkout-table td {
            padding: 14px 12px;
            border-bottom: 1px solid #f1f5f9;
            vertical-align: middle;
            font-size: 14px;
            color: #334155;
        }

        .coza-checkout-table img {
            border-radius: 10px;
            object-fit: cover;
            box-shadow: 0 4px 10px rgba(0,0,0,0.06);
            border: 1px solid #e2e8f0;
        }

        /* ---------- Summary Total Box ---------- */
        .coza-summary-box {
            background: #f8fafc;
            border-radius: 14px;
            padding: 20px;
            border: 1px solid #e2e8f0;
            margin-top: 18px;
        }

        .coza-summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            font-size: 14px;
            color: #64748b;
            font-weight: 500;
        }

        .coza-summary-row.total-row {
            font-size: 16px;
            font-weight: 700;
            color: #1e293b;
            border-top: 2px dashed #cbd5e1;
            padding-top: 16px;
            margin-top: 12px;
            margin-bottom: 0;
        }

        .rupee-total-amount {
            color: #717fe0;
            font-size: 24px;
            font-weight: 800;
        }

        /* ---------- Action Buttons ---------- */
        .btn-coza-confirm {
            width: 100%;
            height: 52px;
            background: linear-gradient(135deg, #717fe0 0%, #5a67d8 100%);
            color: #ffffff;
            border: none;
            border-radius: 26px;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 20px rgba(113, 127, 224, 0.35);
        }

        .btn-coza-confirm:hover {
            background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
            box-shadow: 0 8px 20px rgba(15, 23, 42, 0.3);
            color: #ffffff;
            transform: translateY(-1px);
        }

        .btn-coza-return {
            width: 100%;
            height: 48px;
            background: transparent;
            color: #717fe0;
            border: 2px solid #717fe0;
            border-radius: 24px;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            cursor: pointer;
            margin-top: 12px;
            transition: all 0.3s ease;
        }

        .btn-coza-return:hover {
            background: #717fe0;
            color: #ffffff;
        }

        /* Toast Notifications */
        .pd-toast-container {
            position: fixed;
            top: 100px;
            right: 24px;
            z-index: 99999;
            display: flex;
            flex-direction: column;
            gap: 12px;
            pointer-events: none;
        }

        .pd-toast {
            position: relative;
            min-width: 320px;
            max-width: 420px;
            background: #ffffff;
            border-radius: 16px;
            padding: 16px 20px 16px 18px;
            box-shadow: 0 20px 40px -10px rgba(0, 0, 0, 0.15), 0 0 0 1px rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
            gap: 14px;
            pointer-events: auto;
            overflow: hidden;
            transform: translateX(calc(100% + 60px));
            opacity: 0;
            transition: transform 0.45s cubic-bezier(0.34,1.56,0.64,1), opacity 0.3s ease;
        }

        .pd-toast.toast-show  { transform: translateX(0); opacity: 1; }
        .pd-toast.toast-hide  { transform: translateX(calc(100% + 60px)); opacity: 0; transition: transform 0.35s ease, opacity 0.25s ease; }

        .pd-toast::before {
            content: '';
            position: absolute;
            left: 0; top: 0; bottom: 0;
            width: 5px;
            border-radius: 16px 0 0 16px;
        }

        .pd-toast.toast-success::before { background: linear-gradient(180deg, #22c55e, #16a34a); }
        .pd-toast.toast-error::before   { background: linear-gradient(180deg, #ef4444, #dc2626); }
        .pd-toast.toast-warning::before { background: linear-gradient(180deg, #f59e0b, #d97706); }

        .pd-toast-icon {
            width: 42px; height: 42px;
            border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-size: 20px; flex-shrink: 0;
        }

        .pd-toast.toast-success .pd-toast-icon { background: rgba(34,197,94,0.12); color: #16a34a; }
        .pd-toast.toast-error   .pd-toast-icon { background: rgba(239,68,68,0.12); color: #dc2626; }
        .pd-toast.toast-warning .pd-toast-icon { background: rgba(245,158,11,0.12); color: #d97706; }

        .pd-toast-body { flex: 1; }
        .pd-toast-title   { font-family: 'Poppins', sans-serif; font-size: 14px; font-weight: 700; color: #222; margin-bottom: 2px; }
        .pd-toast-message { font-family: 'Poppins', sans-serif; font-size: 13px; color: #666; line-height: 1.4; }

        .pd-toast-close {
            position: absolute; top: 14px; right: 14px;
            width: 26px; height: 26px;
            border: none; background: #f3f4f6; border-radius: 8px;
            display: flex; align-items: center; justify-content: center;
            cursor: pointer; color: #999; font-size: 12px;
            transition: all 0.2s; padding: 0;
        }

        .pd-toast-close:hover { background: #e5e7eb; color: #333; }

        .pd-toast-progress {
            position: absolute; bottom: 0; left: 0;
            height: 3px; width: 100%; transform-origin: left;
            border-radius: 0 0 16px 16px;
            animation: toastBar 4s linear forwards;
        }

        .pd-toast.toast-success .pd-toast-progress { background: linear-gradient(90deg, #22c55e, #16a34a); }
        .pd-toast.toast-error   .pd-toast-progress { background: linear-gradient(90deg, #ef4444, #dc2626); }
        .pd-toast.toast-warning .pd-toast-progress { background: linear-gradient(90deg, #f59e0b, #d97706); }

        @keyframes toastBar { from { transform: scaleX(1); } to { transform: scaleX(0); } }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Ajax ScriptManager -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <!-- Asynchronous UpdatePanel to avoid full page reloads -->
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!-- CozaStore Title Banner -->
            <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/bg-01.jpg');">
                <h2 class="ltext-105 cl0 txt-center">
                    Checkout
                </h2>
            </section>

            <div class="coza-checkout-wrapper">
                <div class="coza-checkout-container">

                    <!-- CozaStore Stepper -->
                    <div class="coza-step-indicator">
                        <div class="coza-step-item completed">
                            <span class="coza-step-badge"><i class="fa fa-check"></i></span>
                            <span>Shopping Cart</span>
                        </div>
                        <div class="coza-step-line"></div>
                        <div class="coza-step-item active">
                            <span class="coza-step-badge">2</span>
                            <span>Order Review & Shipping</span>
                        </div>
                        <div class="coza-step-line"></div>
                        <div class="coza-step-item">
                            <span class="coza-step-badge">3</span>
                            <span>Order Confirmation</span>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Left Column: Customer & Payment Details -->
                        <div class="col-lg-7 m-b-30">

                            <!-- Customer & Shipping Information Card -->
                            <div class="coza-card">
                                <div class="coza-card-header">
                                    <i class="fa fa-map-marker"></i>
                                    Shipping & Contact Details
                                </div>

                                <div class="info-grid-container">
                                    <div class="info-card-item">
                                        <asp:Label ID="Label1" runat="server" CssClass="asp-label-title" Text="Full Name"></asp:Label>
                                        <span class="asp-value-text">
                                            <asp:Label ID="lblname" runat="server" Text="N/A"></asp:Label>
                                        </span>
                                    </div>

                                    <div class="info-card-item">
                                        <asp:Label ID="Label6" runat="server" CssClass="asp-label-title" Text="Email Address"></asp:Label>
                                        <span class="asp-value-text">
                                            <asp:Label ID="lblemail" runat="server" Text="N/A"></asp:Label>
                                        </span>
                                    </div>

                                    <div class="info-card-item">
                                        <asp:Label ID="Label2" runat="server" CssClass="asp-label-title" Text="Phone Number"></asp:Label>
                                        <span class="asp-value-text">
                                            <asp:Label ID="lblnumber" runat="server" Text="N/A"></asp:Label>
                                        </span>
                                    </div>

                                    <div class="info-card-item">
                                        <asp:Label ID="Label4" runat="server" CssClass="asp-label-title" Text="PIN Code"></asp:Label>
                                        <span class="asp-value-text">
                                            <asp:Label ID="lblpincode" runat="server" Text="N/A"></asp:Label>
                                        </span>
                                    </div>

                                    <div class="info-card-item" style="grid-column: 1 / -1;">
                                        <asp:Label ID="Label3" runat="server" CssClass="asp-label-title" Text="Delivery Address"></asp:Label>
                                        <span class="asp-value-text">
                                            <asp:Label ID="lbladdress" runat="server" Text="N/A"></asp:Label>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <!-- Payment Method Selection Card -->
                            <div class="coza-card">
                                <div class="coza-card-header">
                                    <i class="fa fa-university"></i>
                                    Payment Method
                                </div>

                                <div class="coza-form-group">
                                    <asp:Label ID="Label11" runat="server" Text="Choose Your Bank Account" CssClass="coza-field-label"></asp:Label>
                                    <asp:DropDownList ID="ddlBankAcc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBankAcc_SelectedIndexChanged" CssClass="coza-select-input">
                                    </asp:DropDownList>
                                    
                                    <asp:Label ID="lblaccmsg" runat="server" Text="Account Number" Visible="False" CssClass="coza-alert-msg"></asp:Label>
                                    
                                    <div>
                                        <asp:Button ID="btnAddNewBank" runat="server" OnClick="btnAddNewBank_Click" Text="+ Add New Bank Account" CssClass="btn-coza-add-bank" />
                                    </div>

                                    <asp:Panel ID="AccountPanel" runat="server" Visible="False" CssClass="coza-bank-details-panel">
                                        <div class="coza-bank-details-grid">
                                            <div class="coza-bank-item">
                                                <asp:Label ID="Label8" runat="server" Text="Account Name" CssClass="coza-bank-label"></asp:Label>
                                                <span class="coza-bank-value">
                                                    <asp:Label ID="accname" runat="server" Text="Label"></asp:Label>
                                                </span>
                                            </div>

                                            <div class="coza-bank-item">
                                                <asp:Label ID="lblacno" runat="server" Text="Account Number" CssClass="coza-bank-label"></asp:Label>
                                                <span class="coza-bank-value">
                                                    <asp:Label ID="accno" runat="server" Text="Label"></asp:Label>
                                                </span>
                                            </div>

                                            <div class="coza-bank-item" style="grid-column: 1 / -1;">
                                                <asp:Label ID="Label10" runat="server" Text="Available Balance" CssClass="coza-bank-label"></asp:Label>
                                                <span class="coza-bank-balance">
                                                    &#8377;<asp:Label ID="accbalance" runat="server" Text="Label"></asp:Label>
                                                </span>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>

                                <div class="coza-trust-seal">
                                    <i class="fa fa-shield"></i>
                                    <span>100% Secure & Encrypted Bank Payment Processing</span>
                                </div>
                            </div>

                        </div>

                        <!-- Right Column: Order Items Summary & Total -->
                        <div class="col-lg-5 m-b-30">
                            <div class="coza-card" style="position: sticky; top: 100px;">
                                <div class="coza-card-header">
                                    <i class="fa fa-shopping-bag"></i>
                                    Order Items Summary
                                </div>

                                <!-- GridView Table -->
                                <div class="table-responsive">
                                    <asp:GridView ID="gvcheckout" runat="server" AutoGenerateColumns="False" 
                                        CssClass="coza-checkout-table" GridLines="None">
                                        <Columns>
                                            <asp:ImageField DataImageUrlField="Product_image" HeaderText="Item">
                                                <ControlStyle Height="70px" Width="60px" />
                                            </asp:ImageField>
                                            <asp:BoundField DataField="Product_name" HeaderText="Product Name" />
                                            <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                                            <asp:BoundField DataField="SubTotal" HeaderText="SubTotal (&#8377;)" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                                <!-- Price Summary Breakdown -->
                                <div class="coza-summary-box">
                                    <div class="coza-summary-row">
                                        <span>Shipping Charge</span>
                                        <span class="badge badge-success px-2 py-1">FREE</span>
                                    </div>
                                    <div class="coza-summary-row">
                                        <span>Estimated GST</span>
                                        <span>Inclusive</span>
                                    </div>
                                    <div class="coza-summary-row total-row">
                                        <asp:Label ID="Label5" runat="server" Text="Total Amount Payable"></asp:Label>
                                        <span class="rupee-total-amount">&#8377;<asp:Label ID="lbltotal" runat="server" Text="0.00"></asp:Label></span>
                                    </div>
                                </div>

                                <!-- Action Buttons -->
                                <div class="m-t-25">
                                    <asp:Button ID="btnconfirm" runat="server" OnClick="btnconfirm_Click" Text="Confirm Order" CssClass="btn-coza-confirm" />
                                    <asp:Button ID="Button1" runat="server" Text="Return to Shopping Cart" PostBackUrl="Shopping-Cart.aspx" CssClass="btn-coza-return" CausesValidation="false" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Toast Notification Container -->
    <div class="pd-toast-container" id="pdToastContainer"></div>

    <script type="text/javascript">
        function showPdToast(title, message, type) {
            type = type || 'error';
            var container = document.getElementById('pdToastContainer');
            if (!container) return;

            var iconMap = {
                success: '<i class="fa fa-check-circle"></i>',
                error: '<i class="fa fa-exclamation-circle"></i>',
                warning: '<i class="fa fa-exclamation-triangle"></i>'
            };

            var toast = document.createElement('div');
            toast.className = 'pd-toast toast-' + type;

            toast.innerHTML =
                '<div class="pd-toast-icon">' + (iconMap[type] || iconMap.error) + '</div>' +
                '<div class="pd-toast-body">' +
                    '<div class="pd-toast-title">' + title + '</div>' +
                    '<div class="pd-toast-message">' + message + '</div>' +
                '</div>' +
                '<button class="pd-toast-close" aria-label="Close" type="button"><i class="fa fa-times"></i></button>' +
                '<div class="pd-toast-progress"></div>';

            container.appendChild(toast);

            requestAnimationFrame(function () {
                requestAnimationFrame(function () { toast.classList.add('toast-show'); });
            });

            toast.querySelector('.pd-toast-close').addEventListener('click', function () {
                dismiss(toast);
            });

            var timer = setTimeout(function () { dismiss(toast); }, 4000);

            toast.addEventListener('mouseenter', function () {
                clearTimeout(timer);
                var bar = toast.querySelector('.pd-toast-progress');
                if (bar) bar.style.animationPlayState = 'paused';
            });

            toast.addEventListener('mouseleave', function () {
                var bar = toast.querySelector('.pd-toast-progress');
                if (bar) bar.style.animationPlayState = 'running';
                timer = setTimeout(function () { dismiss(toast); }, 1500);
            });

            function dismiss(el) {
                el.classList.remove('toast-show');
                el.classList.add('toast-hide');
                el.addEventListener('transitionend', function () {
                    if (el.parentNode) el.parentNode.removeChild(el);
                }, { once: true });
            }
        }
    </script>
</asp:Content>
