<%@ Page Title="Shopping Cart - CozaStore" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Shopping-Cart.aspx.cs" Inherits="Ecom_Project.User.Shopping_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ═══════════════════════════════════════════
           COZASTORE SHOPPING CART — MATCHES WEBSITE
        ═══════════════════════════════════════════ */

        .coza-cart-wrapper {
            background: #f8f9fc;
            padding-top: 100px; /* Clears fixed header-v4 navigation bar */
            padding-bottom: 80px;
            font-family: 'Poppins', sans-serif;
            min-height: 85vh;
        }

        /* CozaStore Hero Breadcrumb Banner */
        .coza-hero-strip {
            background: #222222;
            padding: 30px 0;
            margin-bottom: 40px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.06);
        }

        .coza-hero-inner {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .coza-hero-title {
            font-family: 'Poppins', sans-serif;
            font-size: 22px;
            font-weight: 700;
            color: #ffffff;
            margin: 0;
            letter-spacing: 0.5px;
        }

        .coza-breadcrumb {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 13px;
        }

        .coza-breadcrumb a {
            color: rgba(255,255,255,0.65);
            text-decoration: none;
            transition: color 0.25s ease;
        }

        .coza-breadcrumb a:hover {
            color: #ffffff;
        }

        .coza-breadcrumb .sep {
            color: rgba(255,255,255,0.3);
            font-size: 11px;
        }

        .coza-breadcrumb .current {
            color: #717fe0;
            font-weight: 600;
        }

        /* Cart Grid Layout */
        .coza-cart-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .coza-cart-grid {
            display: grid;
            grid-template-columns: 1fr 380px;
            gap: 30px;
            align-items: start;
        }

        @media (max-width: 992px) {
            .coza-cart-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Left Main Cart Section */
        .coza-cart-card {
            background: #ffffff;
            border-radius: 16px;
            border: 1px solid #eef0f6;
            box-shadow: 0 10px 30px rgba(0,0,0,0.03);
            padding: 28px;
        }

        .coza-cart-card-title {
            font-size: 18px;
            font-weight: 700;
            color: #222222;
            margin: 0 0 20px;
            padding-bottom: 14px;
            border-bottom: 2px solid #f0f2f5;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .coza-cart-card-title i {
            color: #717fe0;
            margin-right: 8px;
        }

        /* Cart Item Row */
        .coza-cart-item {
            display: flex;
            gap: 24px;
            padding: 24px 0;
            border-bottom: 1px solid #f0f2f5;
            align-items: center;
            transition: background 0.2s ease;
        }

        .coza-cart-item:last-child {
            border-bottom: none;
        }

        /* Product Image (Large 200px x 200px) */
        .coza-cart-img-wrap {
            width: 200px !important;
            min-width: 200px !important;
            height: 200px !important;
            border-radius: 14px !important;
            border: 1px solid #eef0f6 !important;
            background: #ffffff !important;
            padding: 10px !important;
            flex-shrink: 0 !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            box-shadow: 0 4px 14px rgba(0,0,0,0.03) !important;
            overflow: hidden !important;
            transition: transform 0.25s ease, border-color 0.25s ease !important;
        }

        .coza-cart-item:hover .coza-cart-img-wrap {
            border-color: #717fe0 !important;
            transform: translateY(-2px) !important;
        }

        .coza-cart-img-wrap img {
            max-width: 100% !important;
            max-height: 100% !important;
            width: auto !important;
            height: auto !important;
            object-fit: contain !important;
            display: block !important;
            margin: 0 auto !important;
        }

        /* Item Info Section */
        .coza-cart-info {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .coza-product-name {
            font-size: 17px;
            font-weight: 700;
            color: #222222;
            margin: 0;
            line-height: 1.3;
        }

        .coza-product-desc {
            font-size: 13px;
            color: #777777;
            margin: 0;
            line-height: 1.4;
        }

        .coza-stock-tag {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 12px;
            font-weight: 600;
            color: #e53e3e;
            background: #fff5f5;
            border: 1px solid #fed7d7;
            padding: 3px 10px;
            border-radius: 20px;
            width: fit-content;
            margin-top: 4px;
        }

        /* Quantity & Action Row */
        .coza-action-bar {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-top: 12px;
        }

        .coza-qty-pill {
            display: inline-flex;
            align-items: center;
            border: 2px solid #e6e6e6;
            border-radius: 40px;
            background: #ffffff;
            overflow: hidden;
            transition: border-color 0.25s ease;
        }

        .coza-qty-pill:hover {
            border-color: #717fe0;
        }

        .coza-qty-btn {
            width: 34px;
            height: 34px;
            border: none;
            background: transparent;
            font-size: 16px;
            font-weight: 700;
            color: #333;
            cursor: pointer;
            transition: background 0.2s, color 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .coza-qty-btn:hover {
            background: #717fe0;
            color: #ffffff;
        }

        .coza-qty-input {
            width: 40px;
            height: 34px;
            border: none;
            border-left: 1px solid #e6e6e6;
            border-right: 1px solid #e6e6e6;
            background: #fafafa;
            text-align: center;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            font-weight: 700;
            color: #222222;
            outline: none;
        }

        /* Delete Button Link */
        .coza-delete-btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 13px;
            font-weight: 600;
            color: #ef4444;
            background: #fff5f5;
            border: 1px solid #fee2e2;
            padding: 6px 14px;
            border-radius: 20px;
            text-decoration: none !important;
            transition: all 0.25s ease;
            cursor: pointer;
        }

        .coza-delete-btn:hover {
            background: #ef4444;
            color: #ffffff;
            border-color: #ef4444;
            transform: translateY(-1px);
        }

        /* Item Price Column */
        .coza-cart-price-col {
            text-align: right;
            min-width: 110px;
        }

        .coza-price-val {
            font-size: 19px;
            font-weight: 700;
            color: #222222;
        }

        .coza-price-val span {
            color: #717fe0;
            font-size: 16px;
            margin-right: 2px;
        }

        /* Sidebar Summary Card */
        .coza-summary-card {
            background: #ffffff;
            border-radius: 16px;
            border: 1px solid #eef0f6;
            box-shadow: 0 10px 30px rgba(0,0,0,0.03);
            padding: 26px;
            position: sticky;
            top: 110px;
        }

        .coza-summary-title {
            font-size: 18px;
            font-weight: 700;
            color: #222222;
            margin: 0 0 20px;
            padding-bottom: 14px;
            border-bottom: 2px solid #f0f2f5;
        }

        .coza-summary-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 14px;
            font-size: 14px;
            color: #666666;
        }

        .coza-summary-total {
            margin-top: 20px;
            padding-top: 16px;
            border-top: 2px dashed #eef0f6;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .coza-summary-total-label {
            font-size: 16px;
            font-weight: 700;
            color: #222222;
        }

        .coza-summary-total-val {
            font-size: 26px;
            font-weight: 800;
            color: #717fe0;
        }

        /* CozaStore Main Action Button */
        .coza-checkout-btn {
            width: 100%;
            height: 50px;
            border: none;
            border-radius: 30px;
            background: #222222;
            color: #ffffff;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            cursor: pointer;
            margin-top: 22px;
            transition: all 0.3s ease;
            box-shadow: 0 6px 18px rgba(34,34,34,0.15);
        }

        .coza-checkout-btn:hover {
            background: #717fe0;
            box-shadow: 0 10px 25px rgba(113,127,224,0.35);
            transform: translateY(-2px);
        }

        /* Alert Banners */
        .coza-alert-banner {
            margin-top: 15px;
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            background: #fff5f5;
            color: #c53030;
            border: 1px solid #feb2b2;
            display: block;
        }

        /* Large Empty Cart Banner (Neutral & Premium - No Red) */
        .coza-empty-cart-banner {
            background: #ffffff;
            border: 2px dashed #e2e8f0;
            border-radius: 16px;
            padding: 55px 30px;
            text-align: center;
            font-family: 'Poppins', sans-serif;
            font-size: 22px;
            font-weight: 700;
            color: #222222;
            margin: 20px 0;
            box-shadow: 0 4px 15px rgba(0,0,0,0.02);
            display: block;
            width: 100%;
        }

        .coza-empty-cart-banner::before {
            content: "\f07a"; /* FontAwesome Shopping Cart Icon */
            font-family: 'FontAwesome';
            font-size: 54px;
            color: #717fe0;
            display: block;
            margin-bottom: 14px;
            font-weight: normal;
        }

        /* Toast Container */
        .pd-toast-container {
            position: fixed;
            top: 100px;
            right: 28px;
            z-index: 999999;
            display: flex;
            flex-direction: column;
            gap: 12px;
            pointer-events: none;
        }

        .pd-toast {
            pointer-events: all;
            display: flex;
            align-items: flex-start;
            gap: 14px;
            min-width: 330px;
            max-width: 420px;
            padding: 18px 20px;
            border-radius: 16px;
            background: #fff;
            box-shadow: 0 15px 40px rgba(0,0,0,0.14);
            position: relative;
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

        @media (max-width: 768px) {
            .coza-cart-item {
                flex-direction: column;
                align-items: flex-start;
            }
            .coza-cart-img-wrap {
                width: 140px;
                height: 140px;
                margin: 0 auto;
            }
            .coza-cart-price-col {
                text-align: left;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%-- ScriptManager on top --%>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <%-- UpdatePanel wraps everything so button clicks don't reload full page --%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="coza-cart-wrapper">


                <!-- Main Content Container -->
                <div class="coza-cart-container">
                    <div class="coza-cart-grid">

                        <!-- Left Column: Cart Items List -->
                        <div class="coza-cart-card">
                            <div class="coza-cart-card-title">
                                <span><i class="fa fa-shopping-bag"></i> Cart Items</span>
                            </div>

                            <%-- DataList for Cart Items --%>
                            <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" CssClass="w-100">
                                <ItemTemplate>
                                    <div class="coza-cart-item">

                                        <!-- Product Image (120px x 120px) -->
                                        <div class="coza-cart-img-wrap">
                                            <asp:Image ID="imgp" runat="server" ImageUrl='<%# ResolveUrl(Eval("Product_image").ToString()) %>' AlternateText="Product Image" />
                                        </div>

                                        <!-- Product Details & Controls -->
                                        <div class="coza-cart-info">
                                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("Product_name") %>' CssClass="coza-product-name"></asp:Label>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Product_description") %>' CssClass="coza-product-desc"></asp:Label>
                                            
                                            <div class="coza-stock-tag">
                                                <i class="fa fa-cubes"></i> Only <%# Eval("Product_stock") %> left in stock
                                            </div>

                                            <!-- Qty & Delete Row -->
                                            <div class="coza-action-bar">
                                                <div class="coza-qty-pill">
                                                    <asp:Button ID="btnminus" runat="server" OnClick="btnminus_Click" Text="&#8722;" CssClass="coza-qty-btn" ToolTip="Decrease Quantity" />
                                                    <asp:TextBox ID="txtbQty" runat="server" ReadOnly="True" Text='<%# Eval("Quantity") %>' CssClass="coza-qty-input"></asp:TextBox>
                                                    <asp:Button ID="btnplus" runat="server" OnClick="btnplus_Click" Text="+" CssClass="coza-qty-btn" ToolTip="Increase Quantity" />
                                                </div>

                                                <!-- Delete Button -->
                                                <asp:Button ID="btndelete" runat="server" OnClick="btndelete_Click" CommandArgument='<%# Eval("Product_id") %>' Text="Remove" CssClass="coza-delete-btn" ToolTip="Remove product from cart" />
                                            </div>
                                        </div>

                                        <!-- Item Price -->
                                        <div class="coza-cart-price-col">
                                            <div class="coza-price-val">
                                                <span>&#x20B9;</span><asp:Label ID="lblprice" runat="server" Text='<%# Eval("Product_price") %>'></asp:Label>
                                            </div>
                                        </div>

                                        <%-- Hidden fields --%>
                                        <asp:HiddenField ID="hfpname" runat="server" Value='<%# Eval("Product_name") %>' />
                                        <asp:HiddenField ID="hfstock" runat="server" Value='<%# Eval("Product_stock") %>' />
                                        <asp:HiddenField ID="hfpid" runat="server" Value='<%# Eval("Product_id") %>' />
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>

                            <%-- Server Messages --%>
                            <div>
                                <asp:Label ID="lblcartmsg" runat="server" Text="Label" Visible="False" CssClass="coza-empty-cart-banner"></asp:Label>
                                <asp:Label ID="lblstockmsg" runat="server" Text="Label" Visible="False" CssClass="coza-empty-cart-banner"></asp:Label>
                            </div>
                        </div>

                        <!-- Right Sidebar Order Summary -->
                        <div class="coza-summary-card">
                            <h3 class="coza-summary-title">Cart Summary</h3>

                            <div class="coza-summary-row">
                                <span>Shipping</span>
                                <span style="color:#22c55e; font-weight:600;"><i class="fa fa-truck"></i> Free Shipping</span>
                            </div>

                            <div class="coza-summary-total">
                                <asp:Label ID="Label5" runat="server" Text="Total Amount" CssClass="coza-summary-total-label"></asp:Label>
                                <div class="coza-summary-total-val">
                                    <span>&#x20B9;</span><asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>

                            <asp:Button ID="Button1" runat="server" Text="Proceed to Checkout" CssClass="coza-checkout-btn" />

                            <div style="margin-top:20px; text-align:center; font-size:12px; color:#888;">
                                <i class="fa fa-shield" style="color:#717fe0; margin-right:5px;"></i> Safe &amp; Secure Checkout
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

