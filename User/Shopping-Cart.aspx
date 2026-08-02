<%@ Page Title="Shopping Cart - CozaStore" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Shopping-Cart.aspx.cs" Inherits="Ecom_Project.User.Shopping_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ═══════════════════════════════════════════
           COZASTORE SHOPPING CART — MODERN UI REDESIGN
        ═══════════════════════════════════════════ */

        /* ---------- Page Wrapper & Clearance ---------- */
        .coza-cart-wrapper {
            background: linear-gradient(180deg, #f8f9fd 0%, #ffffff 100%);
            padding-top: 50px; /* 50px top padding below header-v4 */
            padding-bottom: 90px;
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            min-height: 85vh;
        }

        .coza-cart-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 24px;
        }

        .coza-cart-grid {
            display: grid;
            grid-template-columns: 1fr 380px;
            gap: 36px;
            align-items: start;
        }

        /* ═══════════════════════════════════════════
           LEFT COLUMN — CART ITEMS LIST (DATALIST)
        ═══════════════════════════════════════════ */
        .coza-cart-card {
            background: #ffffff;
            border-radius: 20px;
            border: 1px solid rgba(230, 233, 245, 0.9);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.04);
            padding: 28px;
        }

        .coza-cart-card-title {
            font-size: 20px;
            font-weight: 700;
            color: #1a1a24;
            margin: 0 0 24px;
            padding-bottom: 16px;
            border-bottom: 2px solid #f0f2f7;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .coza-cart-card-title i {
            color: #717fe0;
            margin-right: 10px;
        }

        /* Column Header Strip */
        .coza-cart-table-head {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 16px;
            padding: 12px 18px;
            background: #f8fafc;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 1px;
            color: #64748b;
            text-transform: uppercase;
            margin-bottom: 12px;
        }

        .coza-cart-table-head span:nth-child(2),
        .coza-cart-table-head span:nth-child(3),
        .coza-cart-table-head span:nth-child(4) {
            text-align: center;
        }

        /* Cart Item Row */
        .coza-cart-item {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 16px;
            padding: 24px 12px;
            border-bottom: 1px solid #f0f2f7;
            align-items: center;
            transition: background 0.25s ease;
        }

        .coza-cart-item:last-child {
            border-bottom: none;
        }

        /* Product Left Details */
        .coza-product-col {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .coza-cart-img-wrap {
            width: 110px !important;
            min-width: 110px !important;
            height: 110px !important;
            border-radius: 16px !important;
            border: 1px solid #edf0f7 !important;
            background: #ffffff !important;
            padding: 8px !important;
            flex-shrink: 0 !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            box-shadow: 0 4px 14px rgba(0,0,0,0.03) !important;
            overflow: hidden !important;
            transition: all 0.3s ease !important;
        }

        .coza-cart-item:hover .coza-cart-img-wrap {
            border-color: #717fe0 !important;
            box-shadow: 0 8px 20px rgba(113, 127, 224, 0.15) !important;
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

        .coza-cart-info {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .coza-product-name {
            font-size: 16px;
            font-weight: 700;
            color: #1a1a24;
            margin: 0;
            line-height: 1.35;
        }

        .coza-product-desc {
            font-size: 13px;
            color: #64748b;
            margin: 0;
            line-height: 1.4;
        }

        .coza-stock-tag {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 11px;
            font-weight: 600;
            color: #d97706;
            background: #fffbe6;
            border: 1px solid #fef3c7;
            padding: 3px 10px;
            border-radius: 20px;
            width: fit-content;
            margin-top: 4px;
        }

        /* Unit Price Column */
        .coza-cart-price-col {
            text-align: center;
        }

        .coza-price-val {
            font-size: 18px;
            font-weight: 700;
            color: #1a1a24;
            display: flex;
            align-items: baseline;
            justify-content: center;
            gap: 3px;
        }

        .coza-price-rupee {
            color: #717fe0;
            font-size: 15px;
            font-weight: 700;
        }

        .coza-price-unit {
            font-size: 11px;
            font-weight: 500;
            color: #94a3b8;
            margin-left: 2px;
        }

        /* Quantity Column */
        .coza-qty-col {
            display: flex;
            justify-content: center;
        }

        .coza-qty-pill {
            display: inline-flex;
            align-items: center;
            border: 2px solid #e2e8f0;
            border-radius: 40px;
            background: #ffffff;
            overflow: hidden;
            transition: all 0.25s ease;
        }

        .coza-qty-pill:hover,
        .coza-qty-pill:focus-within {
            border-color: #717fe0;
            box-shadow: 0 0 0 3px rgba(113, 127, 224, 0.12);
        }

        .coza-qty-btn {
            width: 36px;
            height: 36px;
            border: none;
            background: transparent;
            font-size: 16px;
            font-weight: 700;
            color: #334155;
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

        .coza-qty-btn:active {
            transform: scale(0.92);
        }

        .coza-qty-input {
            width: 42px;
            height: 36px;
            border: none;
            border-left: 1px solid #e2e8f0;
            border-right: 1px solid #e2e8f0;
            background: #f8fafc;
            text-align: center;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            font-weight: 700;
            color: #1e293b;
            outline: none;
        }

        /* Action Column (Remove Button) */
        .coza-action-col {
            text-align: center;
        }

        .coza-delete-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            font-size: 12px;
            font-weight: 600;
            color: #ef4444;
            background: #fff5f5;
            border: 1px solid #fee2e2;
            padding: 8px 14px;
            border-radius: 20px;
            text-decoration: none !important;
            transition: all 0.25s ease;
            cursor: pointer;
        }

        .coza-delete-btn:hover {
            background: #ef4444;
            color: #ffffff;
            border-color: #ef4444;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.25);
        }

        /* ═══════════════════════════════════════════
           RIGHT COLUMN — ORDER SUMMARY SIDEBAR
        ═══════════════════════════════════════════ */
        .coza-summary-card {
            background: #ffffff;
            border-radius: 20px;
            border: 1px solid rgba(230, 233, 245, 0.9);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.04);
            padding: 28px;
            position: sticky;
            top: 140px;
        }

        .coza-summary-title {
            font-size: 20px;
            font-weight: 700;
            color: #1a1a24;
            margin: 0 0 22px;
            padding-bottom: 16px;
            border-bottom: 2px solid #f0f2f7;
        }

        .coza-summary-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 16px;
            font-size: 14px;
            color: #64748b;
        }

        .coza-summary-total {
            margin-top: 22px;
            padding-top: 18px;
            border-top: 2px dashed #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .coza-summary-total-label {
            font-size: 16px;
            font-weight: 700;
            color: #1a1a24;
        }

        .coza-summary-total-val {
            font-size: 28px;
            font-weight: 800;
            color: #717fe0;
            display: flex;
            align-items: baseline;
            gap: 2px;
        }

        /* Vibrant Brand Checkout CTA Button */
        .coza-checkout-btn {
            width: 100%;
            height: 56px;
            border: none;
            border-radius: 16px;
            background: linear-gradient(135deg, #717fe0 0%, #5b69db 100%);
            color: #ffffff;
            font-family: 'Poppins', sans-serif;
            font-size: 15px;
            font-weight: 700;
            letter-spacing: 1.2px;
            text-transform: uppercase;
            cursor: pointer;
            margin-top: 24px;
            transition: all 0.35s cubic-bezier(0.25, 0.8, 0.25, 1);
            box-shadow: 0 10px 25px rgba(113, 127, 224, 0.38);
        }

        .coza-checkout-btn:hover {
            background: linear-gradient(135deg, #5b69db 0%, #4856c9 100%);
            box-shadow: 0 16px 36px rgba(113, 127, 224, 0.55);
            transform: translateY(-3px);
        }

        .coza-checkout-btn:active {
            transform: translateY(-1px);
            box-shadow: 0 8px 20px rgba(113, 127, 224, 0.4);
        }

        /* Secondary Continue Shopping Button */
        .coza-continue-shopping-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            width: 100%;
            height: 48px;
            margin-top: 12px;
            border: 2px solid #e2e8f0;
            border-radius: 14px;
            background: #ffffff;
            color: #475569 !important;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            text-decoration: none !important;
            transition: all 0.3s ease;
        }

        .coza-continue-shopping-btn:hover {
            background: #f8fafc;
            border-color: #717fe0;
            color: #717fe0 !important;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(113, 127, 224, 0.15);
        }

        /* Empty Cart State */
        .coza-empty-cart-banner {
            background: #ffffff;
            border: 2px dashed #cbd5e1;
            border-radius: 20px;
            padding: 60px 30px;
            text-align: center;
            font-family: 'Poppins', sans-serif;
            font-size: 22px;
            font-weight: 700;
            color: #1e293b;
            margin: 20px 0;
            box-shadow: 0 4px 20px rgba(0,0,0,0.02);
            display: block;
            width: 100%;
        }

        .coza-empty-cart-banner::before {
            content: "\f07a"; /* FontAwesome Shopping Cart Icon */
            font-family: 'FontAwesome';
            font-size: 56px;
            color: #717fe0;
            display: block;
            margin-bottom: 16px;
            font-weight: normal;
        }

        /* ═══════════════════════════════════════════
           TOAST NOTIFICATIONS (UNTOUCHED / PRESERVED)
        ═══════════════════════════════════════════ */
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

        /* ═══════════════════════════════════════════
           RESPONSIVE BREAKPOINTS
        ═══════════════════════════════════════════ */
        @media (max-width: 992px) {
            .coza-cart-grid {
                grid-template-columns: 1fr;
                gap: 30px;
            }

            .coza-summary-card { position: static; }
        }

        @media (max-width: 768px) {
            .coza-cart-wrapper { padding-top: 35px; }
            .pd-toast-container { top: 90px; right: 16px; left: 16px; }
            .pd-toast { min-width: unset; width: 100%; max-width: 100%; }

            .coza-cart-table-head { display: none; }

            .coza-cart-item {
                grid-template-columns: 1fr;
                gap: 16px;
                padding: 20px 0;
            }

            .coza-product-col {
                flex-direction: column;
                text-align: center;
            }

            .coza-cart-img-wrap {
                width: 140px !important;
                height: 140px !important;
            }

            .coza-cart-price-col,
            .coza-qty-col,
            .coza-action-col {
                text-align: center;
                justify-content: center;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%# Eval("Product_stock") %>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <%-- Hidden fields --%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="coza-cart-wrapper">

                <!-- Main Content Container -->
                <div class="coza-cart-container">
                    <div class="coza-cart-grid">

                        <!-- Left Column: Cart Items List -->
                        <div class="coza-cart-card">
                            <div class="coza-cart-card-title">
                                <span><i class="fa fa-shopping-bag"></i> Shopping Cart Items</span>
                            </div>

                            <!-- Column Header Strip -->
                            <div class="coza-cart-table-head">
                                <span>Item Details</span>
                                <span>Unit Price</span>
                                <span>Quantity</span>
                                <span>Action</span>
                            </div>

                            <%-- DataList for Cart Items --%>
                            <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" CssClass="w-100">
                                <ItemTemplate>
                                    <div class="coza-cart-item">

                                        <!-- Product Image & Description Column -->
                                        <div class="coza-product-col">
                                            <div class="coza-cart-img-wrap">
                                                <asp:Image ID="imgp" runat="server" ImageUrl='<%# ResolveUrl(Eval("Product_image").ToString()) %>' AlternateText="Product Image" />
                                            </div>

                                            <div class="coza-cart-info">
                                                <asp:Label ID="lblname" runat="server" Text='<%# Eval("Product_name") %>' CssClass="coza-product-name"></asp:Label>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Product_description") %>' CssClass="coza-product-desc" Visible="false"></asp:Label>
                                                
                                                <div class="coza-stock-tag">
                                                    <i class="fa fa-cubes"></i> Only <%# Eval("Product_stock") %> left in stock
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Unit Price Column -->
                                        <div class="coza-cart-price-col">
                                            <div class="coza-price-val">
                                                <span class="coza-price-rupee">&#x20B9;</span>
                                                <asp:Label ID="lblprice" runat="server" Text='<%# Eval("Product_price") %>'></asp:Label>
                                                <span class="coza-price-unit">/ Item</span>
                                            </div>
                                        </div>

                                        <!-- Quantity Selector Column -->
                                        <div class="coza-qty-col">
                                            <div class="coza-qty-pill">
                                                <asp:Button ID="btnminus" runat="server" OnClick="btnminus_Click" Text="&#8722;" CssClass="coza-qty-btn" ToolTip="Decrease Quantity" />
                                                <asp:TextBox ID="txtbQty" runat="server" ReadOnly="True" Text='<%# Eval("Quantity") %>' CssClass="coza-qty-input"></asp:TextBox>
                                                <asp:Button ID="btnplus" runat="server" OnClick="btnplus_Click" Text="+" CssClass="coza-qty-btn" ToolTip="Increase Quantity" />
                                            </div>
                                        </div>

                                        <!-- Action Column (Remove Button) -->
                                        <div class="coza-action-col">
                                            <asp:Button ID="btndelete" runat="server" OnClick="btndelete_Click" CommandArgument='<%# Eval("Product_id") %>' Text="Remove" CssClass="coza-delete-btn" ToolTip="Remove product from cart" />
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
                                <span style="color:#10b981; font-weight:600;"><i class="fa fa-truck"></i> Free Shipping</span>
                            </div>

                            <div class="coza-summary-total">
                                <asp:Label ID="Label5" runat="server" Text="Total Amount" CssClass="coza-summary-total-label"></asp:Label>
                                <div class="coza-summary-total-val">
                                    <span style="font-size:20px; font-weight:700;">&#x20B9;</span>
                                    <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>

                            <asp:Button ID="btncheckout" runat="server" Text="Proceed to Checkout" CssClass="coza-checkout-btn" OnClick="btncheckout_Click" />

                            <a href="Product.aspx" class="coza-continue-shopping-btn">
                                <i class="fa fa-shopping-bag"></i> Continue Shopping
                            </a>

                            <div style="margin-top:20px; text-align:center; font-size:12px; color:#64748b;">
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
        /**
         * showPdToast(title, message, type)
         * Preserved original toast notification script
         */
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
