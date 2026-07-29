<%@ Page Title="Product Details - CozaStore" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Product-Details.aspx.cs" Inherits="Ecom_Project.User.Product_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ═══════════════════════════════════════════
           PRODUCT DETAILS — FULL REDESIGN
           CozaStore India Edition
        ═══════════════════════════════════════════ */

        /* ---------- Page Background ---------- */
        .pd-page {
            background: #f7f8fc;
            padding: 0 0 80px;
        }

        /* ---------- Hero Breadcrumb Strip ---------- */
        .pd-hero-strip {
            background: #222;
            padding: 28px 0;
            margin-bottom: 45px;
        }

        .pd-hero-inner {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .pd-hero-title {
            font-family: 'Poppins', sans-serif;
            font-size: 20px;
            font-weight: 600;
            color: #fff;
            margin: 0;
            letter-spacing: 0.5px;
        }

        .pd-breadcrumb {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 13px;
        }

        .pd-breadcrumb a {
            color: rgba(255,255,255,0.6);
            text-decoration: none;
            transition: color 0.25s;
        }

        .pd-breadcrumb a:hover { color: #fff; }

        .pd-breadcrumb .sep {
            color: rgba(255,255,255,0.3);
            font-size: 10px;
        }

        .pd-breadcrumb .current {
            color: #717fe0;
            font-weight: 600;
        }

        /* ---------- Main Grid ---------- */
        .pd-grid {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            align-items: start;
        }

        /* ═══════════════════════════════════════════
           LEFT COLUMN — IMAGE GALLERY
        ═══════════════════════════════════════════ */
        .pd-gallery {
            position: sticky;
            top: 30px;
        }

        .pd-img-frame {
            background: #fff;
            border-radius: 20px;
            border: 1px solid #eee;
            box-shadow: 0 8px 30px rgba(0,0,0,0.06);
            overflow: hidden;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 560px;
            position: relative;
            transition: box-shadow 0.3s;
        }

        .pd-img-frame:hover {
            box-shadow: 0 12px 40px rgba(113,127,224,0.12);
        }

        /* Status ribbon */
        .pd-ribbon {
            position: absolute;
            top: 20px;
            left: 20px;
            background: #e8faf0;
            color: #00a86b;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.8px;
            text-transform: uppercase;
            padding: 5px 14px;
            border-radius: 6px;
            display: flex;
            align-items: center;
            gap: 5px;
            z-index: 2;
        }

        .pd-ribbon i { font-size: 13px; }

        .pd-main-image {
            width: 100%;
            height: 500px;
            object-fit: contain;
            border-radius: 12px;
            transition: transform 0.4s cubic-bezier(0.25,0.8,0.25,1);
        }

        .pd-main-image:hover {
            transform: scale(1.03);
        }

        /* ═══════════════════════════════════════════
           RIGHT COLUMN — PRODUCT INFORMATION
        ═══════════════════════════════════════════ */
        .pd-info {
            display: flex;
            flex-direction: column;
            gap: 0;
        }

        /* Section label (NAME, DESCRIPTION, PRICE) */
        .pd-section-tag {
            font-family: 'Poppins', sans-serif;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #717fe0;
            background: rgba(113,127,224,0.08);
            padding: 4px 12px;
            border-radius: 4px;
            display: inline-block;
            margin-bottom: 8px;
            width: fit-content;
        }

        /* Product Name */
        .pd-product-name {
            font-family: 'Poppins', sans-serif;
            font-size: 32px;
            font-weight: 700;
            color: #222;
            line-height: 1.25;
            margin: 0 0 20px;
            letter-spacing: -0.3px;
        }

        /* Description */
        .pd-desc-block {
            margin-bottom: 24px;
        }

        .pd-desc-text {
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            line-height: 1.8;
            color: #666;
            margin: 0;
        }

        /* Separator */
        .pd-sep {
            border: none;
            border-top: 1px solid #eee;
            margin: 20px 0;
        }

        /* ---------- Price Block ---------- */
        .pd-price-card {
            background: linear-gradient(135deg, #fafbff 0%, #f0f2ff 100%);
            border: 1px solid rgba(113,127,224,0.15);
            border-radius: 14px;
            padding: 20px 24px;
            margin-bottom: 28px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
        }

        .pd-price-left {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .pd-price-amount {
            display: flex;
            align-items: baseline;
            gap: 3px;
        }

        .pd-rupee {
            font-family: 'Poppins', sans-serif;
            font-size: 22px;
            font-weight: 700;
            color: #717fe0;
        }

        .pd-price-num {
            font-family: 'Poppins', sans-serif;
            font-size: 36px;
            font-weight: 800;
            color: #222;
            letter-spacing: -1px;
            line-height: 1;
        }

        .pd-price-tag {
            font-size: 11px;
            color: #999;
            font-weight: 500;
        }

        /* ---------- Quantity ---------- */
        .pd-qty-block {
            margin-bottom: 24px;
        }

        .pd-qty-row {
            display: flex;
            align-items: center;
            gap: 16px;
            flex-wrap: wrap;
        }

        .pd-qty-pill {
            display: inline-flex;
            align-items: center;
            border: 2px solid #e5e5e5;
            border-radius: 50px;
            background: #fff;
            overflow: hidden;
            transition: border-color 0.3s;
        }

        .pd-qty-pill:focus-within {
            border-color: #717fe0;
            box-shadow: 0 0 0 3px rgba(113,127,224,0.1);
        }

        .pd-qty-btn {
            width: 48px;
            height: 48px;
            border: none;
            background: transparent;
            font-size: 22px;
            font-weight: 700;
            color: #333;
            cursor: pointer;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .pd-qty-btn:hover {
            background: #717fe0;
            color: #fff;
        }

        .pd-qty-btn:active { transform: scale(0.9); }

        .pd-qty-input {
            width: 60px;
            height: 48px;
            border: none;
            border-left: 1px solid #e5e5e5;
            border-right: 1px solid #e5e5e5;
            background: #fafafa;
            text-align: center;
            font-family: 'Poppins', sans-serif;
            font-size: 17px;
            font-weight: 700;
            color: #222;
            outline: none;
            -moz-appearance: textfield;
        }

        .pd-qty-input::-webkit-inner-spin-button,
        .pd-qty-input::-webkit-outer-spin-button { -webkit-appearance: none; }

        /* ---------- Total Chip ---------- */
        .pd-total-chip {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: #fff;
            border: 2px solid #717fe0;
            padding: 10px 20px;
            border-radius: 50px;
        }

        .pd-total-label {
            font-family: 'Poppins', sans-serif;
            font-size: 12px;
            font-weight: 600;
            color: #888;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .pd-total-amount {
            font-family: 'Poppins', sans-serif;
            font-size: 20px;
            font-weight: 800;
            color: #717fe0;
        }

        /* ---------- Message ---------- */
        .pd-msg-area {
            min-height: 30px;
            margin-bottom: 18px;
        }

        .pd-msg-text {
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 600;
            padding: 8px 16px;
            border-radius: 8px;
            display: inline-block;
        }

        /* ---------- Add to Cart Button ---------- */
        .pd-cart-btn {
            width: 100%;
            height: 58px;
            border: none;
            border-radius: 14px;
            background: #222;
            color: #fff;
            font-family: 'Poppins', sans-serif;
            font-size: 15px;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.25,0.8,0.25,1);
            box-shadow: 0 8px 20px rgba(34,34,34,0.18);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        .pd-cart-btn:hover {
            background: #717fe0;
            box-shadow: 0 12px 28px rgba(113,127,224,0.35);
            transform: translateY(-2px);
        }

        /* ---------- Navigation Action Buttons ---------- */
        .pd-action-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-bottom: 24px;
        }

        .pd-nav-btn-row {
            display: flex;
            gap: 12px;
        }

        .pd-continue-btn {
            flex: 1;
            height: 48px;
            border: 2px solid #222222;
            border-radius: 12px;
            background: #222222;
            color: #ffffff !important;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            text-decoration: none !important;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.3s ease;
        }

        .pd-continue-btn:hover {
            background: #717fe0;
            border-color: #717fe0;
            color: #ffffff !important;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(113, 127, 224, 0.25);
        }

        .pd-viewcart-btn {
            flex: 1;
            height: 48px;
            border: 2px solid #e6e6e6;
            border-radius: 12px;
            background: #ffffff;
            color: #222222 !important;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            text-decoration: none !important;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.3s ease;
        }

        .pd-viewcart-btn:hover {
            background: #f8f9fa;
            border-color: #717fe0;
            color: #717fe0 !important;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.06);
        }

        @media (max-width: 500px) {
            .pd-nav-btn-row {
                flex-direction: column;
            }
        }

        .pd-cart-btn:active {
            transform: translateY(0);
            box-shadow: 0 4px 12px rgba(113,127,224,0.2);
        }

        /* ---------- Feature Highlights ---------- */
        .pd-features {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 12px;
            margin-top: 28px;
        }

        .pd-feature-item {
            background: #fff;
            border: 1px solid #eee;
            border-radius: 12px;
            padding: 16px 12px;
            text-align: center;
            transition: all 0.25s;
        }

        .pd-feature-item:hover {
            border-color: #717fe0;
            box-shadow: 0 4px 15px rgba(113,127,224,0.1);
            transform: translateY(-2px);
        }

        .pd-feature-item i {
            font-size: 22px;
            color: #717fe0;
            display: block;
            margin-bottom: 8px;
        }

        .pd-feature-item span {
            font-family: 'Poppins', sans-serif;
            font-size: 11px;
            font-weight: 600;
            color: #555;
            line-height: 1.4;
            display: block;
        }

        /* ═══════════════════════════════════════════
           TOAST NOTIFICATIONS (Edit Category Style)
        ═══════════════════════════════════════════ */
        .pd-toast-container {
            position: fixed;
            top: 28px;
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
        .pd-toast.toast-hide  { transform: translateX(calc(100% + 60px)); opacity: 0;
                                transition: transform 0.35s ease, opacity 0.25s ease; }

        .pd-toast::before {
            content: '';
            position: absolute;
            left: 0; top: 0; bottom: 0;
            width: 5px;
            border-radius: 16px 0 0 16px;
        }

        .pd-toast.toast-success::before { background: linear-gradient(180deg, #22c55e, #16a34a); }
        .pd-toast.toast-error::before   { background: linear-gradient(180deg, #ef4444, #dc2626); }

        .pd-toast-icon {
            width: 42px; height: 42px;
            border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-size: 20px; flex-shrink: 0;
        }

        .pd-toast.toast-success .pd-toast-icon { background: rgba(34,197,94,0.12); color: #16a34a; }
        .pd-toast.toast-error   .pd-toast-icon { background: rgba(239,68,68,0.12); color: #dc2626; }

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

        @keyframes toastBar { from { transform: scaleX(1); } to { transform: scaleX(0); } }

        /* ═══════════════════════════════════════════
           RESPONSIVE BREAKPOINTS
        ═══════════════════════════════════════════ */
        @media (max-width: 900px) {
            .pd-grid {
                grid-template-columns: 1fr;
                gap: 25px;
            }

            .pd-gallery { position: static; }

            .pd-img-frame { min-height: 350px; }
            .pd-main-image { height: 320px; }

            .pd-product-name { font-size: 26px; }
            .pd-price-num { font-size: 30px; }

            .pd-hero-inner { flex-direction: column; gap: 8px; text-align: center; }

            .pd-features { grid-template-columns: 1fr 1fr 1fr; }
        }

        @media (max-width: 500px) {
            .pd-features { grid-template-columns: 1fr; }
            .pd-info { padding: 0; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%-- ScriptManager on top of everything --%>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <%-- UpdatePanel wraps all controls — no full page reload --%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="pd-page">

                <!-- ═══ Dark Hero Breadcrumb Bar ═══ -->
                <div class="pd-hero-strip">
                    <div class="pd-hero-inner">
                        <h2 class="pd-hero-title">Product Details</h2>
                        <div class="pd-breadcrumb">
                            <a href="uindex.aspx">Home</a>
                            <span class="sep"><i class="fa fa-angle-right"></i></span>
                            <a href="Product.aspx">Shop</a>
                            <span class="sep"><i class="fa fa-angle-right"></i></span>
                            <span class="current">Details</span>
                        </div>
                    </div>
                </div>

                <!-- ═══ Two-Column Product Grid ═══ -->
                <div class="pd-grid">

                    <!-- LEFT — Large Product Image -->
                    <div class="pd-gallery">
                        <div class="pd-img-frame">
                            <span class="pd-ribbon"><i class="fa fa-check-circle"></i> In Stock</span>
                            <asp:Image ID="Image1" runat="server" CssClass="pd-main-image" AlternateText="Product Image" />
                        </div>
                    </div>

                    <!-- RIGHT — Product Information & Actions -->
                    <div class="pd-info">

                        <%-- Product Name --%>
                        <asp:Label ID="lbl1" runat="server" Text="Name" CssClass="pd-section-tag"></asp:Label>
                        <h1 class="pd-product-name">
                            <asp:Label ID="lblpname" runat="server" Text=""></asp:Label>
                        </h1>

                        <%-- Product Description --%>
                        <div class="pd-desc-block">
                            <asp:Label ID="lbl2" runat="server" Text="Discription" CssClass="pd-section-tag"></asp:Label>
                            <p class="pd-desc-text">
                                <asp:Label ID="lblpdis" runat="server" Text=""></asp:Label>
                            </p>
                        </div>

                        <hr class="pd-sep" />

                        <%-- Product Price --%>
                        <div class="pd-price-card">
                            <div class="pd-price-left">
                                <asp:Label ID="lbl3" runat="server" Text="Price" CssClass="pd-section-tag" style="margin-bottom:4px;"></asp:Label>
                                <div class="pd-price-amount">
                                    <span class="pd-rupee">&#x20B9;</span>
                                    <asp:Label ID="lblpprice" runat="server" Text="0" CssClass="pd-price-num"></asp:Label>
                                </div>
                            </div>
                            <span class="pd-price-tag">Inclusive of all taxes</span>
                        </div>

                        <%-- Quantity Selector --%>
                        <div class="pd-qty-block">
                            <span class="pd-section-tag" style="margin-bottom:10px;">Quantity</span>
                            <div class="pd-qty-row">
                                <div class="pd-qty-pill">
                                    <asp:Button ID="btnminus" runat="server" Text="&#8722;" OnClick="btnminus_Click" CssClass="pd-qty-btn" ToolTip="Decrease" />
                                    <asp:TextBox ID="txtbstock" runat="server" TextMode="Number" Text="1" CssClass="pd-qty-input"></asp:TextBox>
                                    <asp:Button ID="btnplus" runat="server" Text="+" OnClick="btnplus_Click" CssClass="pd-qty-btn" ToolTip="Increase" />
                                </div>

                                <%-- Total Price Display --%>
                                <div class="pd-total-chip">
                                    <asp:Label ID="lbltotaltext" runat="server" Text="Total Price: " CssClass="pd-total-label"></asp:Label>
                                    <span class="pd-rupee" style="font-size:16px;">&#x20B9;</span>
                                    <asp:Label ID="lbltotal" runat="server" Text="0" CssClass="pd-total-amount"></asp:Label>
                                </div>
                            </div>
                        </div>

                        <%-- Server Message Label --%>
                        <div class="pd-msg-area">
                            <asp:Label ID="lblmsg" runat="server" Text="" CssClass="pd-msg-text"></asp:Label>
                        </div>

                        <%-- Hidden Stock Value --%>
                        <asp:HiddenField ID="hft" runat="server" />

                        <%-- Add To Cart & Navigation Buttons --%>
                        <div class="pd-action-group">
                            <asp:Button ID="btnaddtocart" runat="server" Text="Add To Cart" OnClick="btnaddtocart_Click" CssClass="pd-cart-btn" />
                            
                            <div class="pd-nav-btn-row">
                                <a href="Product.aspx" class="pd-continue-btn">
                                    <i class="fa fa-shopping-bag"></i> Continue Shopping
                                </a>
                                <a href="Shopping-Cart.aspx" class="pd-viewcart-btn">
                                    <i class="fa fa-shopping-cart"></i> View Cart
                                </a>
                            </div>
                        </div>

                        <%-- Trust & Feature Badges --%>
                        <div class="pd-features">
                            <div class="pd-feature-item">
                                <i class="fa fa-truck"></i>
                                <span>Free Delivery<br />Across India</span>
                            </div>
                            <div class="pd-feature-item">
                                <i class="fa fa-shield"></i>
                                <span>100% Original<br />Products</span>
                            </div>
                            <div class="pd-feature-item">
                                <i class="fa fa-refresh"></i>
                                <span>Easy 7-Day<br />Returns</span>
                            </div>
                        </div>

                    </div>

                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Toast Notification Container (outside UpdatePanel) -->
    <div class="pd-toast-container" id="pdToastContainer"></div>

    <script type="text/javascript">
        /**
         * showPdToast(title, message, type)
         * type: 'success' | 'error'
         * Mirrors the Admin Edit Category toast popup style
         */
        function showPdToast(title, message, type) {
            type = type || 'success';
            var container = document.getElementById('pdToastContainer');
            if (!container) return;

            var iconMap = {
                success: '<i class="fa fa-check-circle"></i>',
                error: '<i class="fa fa-exclamation-circle"></i>'
            };

            var toast = document.createElement('div');
            toast.className = 'pd-toast toast-' + type;

            toast.innerHTML =
                '<div class="pd-toast-icon">' + (iconMap[type] || iconMap.success) + '</div>' +
                '<div class="pd-toast-body">' +
                    '<div class="pd-toast-title">' + title + '</div>' +
                    '<div class="pd-toast-message">' + message + '</div>' +
                '</div>' +
                '<button class="pd-toast-close" aria-label="Close"><i class="fa fa-times"></i></button>' +
                '<div class="pd-toast-progress"></div>';

            container.appendChild(toast);

            // Slide in
            requestAnimationFrame(function () {
                requestAnimationFrame(function () { toast.classList.add('toast-show'); });
            });

            // Close button
            toast.querySelector('.pd-toast-close').addEventListener('click', function () {
                dismiss(toast);
            });

            // Auto dismiss after 4 seconds
            var timer = setTimeout(function () { dismiss(toast); }, 4000);

            // Pause on hover
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
