<%@ Page Title="Product Details - CozaStore" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Product-Details.aspx.cs" Inherits="Ecom_Project.User.Product_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ═══════════════════════════════════════════
           PRODUCT DETAILS — PREMIUM UI REDESIGN
           CozaStore Modern Edition
        ═══════════════════════════════════════════ */

        /* ---------- Page Background & Navbar Clearance ---------- */
        .pd-page {
            background: linear-gradient(180deg, #f8f9fd 0%, #ffffff 100%);
            padding: 140px 0 90px; /* 140px clears the fixed header-v4 navigation bar completely */
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            min-height: 100vh;
        }

        /* ---------- Main Grid ---------- */
        .pd-grid {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 24px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            align-items: start;
        }

        /* ═══════════════════════════════════════════
           LEFT COLUMN — IMAGE GALLERY SHOWCASE
        ═══════════════════════════════════════════ */
        .pd-gallery {
            position: sticky;
            top: 140px;
        }

        .pd-img-frame {
            background: #ffffff;
            border-radius: 24px;
            border: 1px solid rgba(230, 233, 245, 0.9);
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.05), 0 4px 12px rgba(113, 127, 224, 0.04);
            overflow: hidden;
            padding: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 540px;
            position: relative;
            transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
        }

        .pd-img-frame:hover {
            box-shadow: 0 28px 55px rgba(113, 127, 224, 0.14), 0 8px 20px rgba(0, 0, 0, 0.06);
            border-color: rgba(113, 127, 224, 0.35);
        }

        /* Status Ribbon */
        .pd-ribbon {
            position: absolute;
            top: 24px;
            left: 24px;
            background: linear-gradient(135deg, #e6f9f0 0%, #d1f7e4 100%);
            color: #059669;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.6px;
            text-transform: uppercase;
            padding: 7px 16px;
            border-radius: 30px;
            display: flex;
            align-items: center;
            gap: 7px;
            z-index: 2;
            box-shadow: 0 4px 12px rgba(5, 150, 105, 0.12);
        }

        .pd-ribbon i { 
            font-size: 13px; 
            color: #10b981;
        }

        .pd-main-image {
            width: 100%;
            height: 480px;
            object-fit: contain;
            border-radius: 16px;
            transition: transform 0.5s cubic-bezier(0.25, 1, 0.5, 1);
            filter: drop-shadow(0 10px 15px rgba(0,0,0,0.03));
        }

        .pd-img-frame:hover .pd-main-image {
            transform: scale(1.04);
        }

        /* ═══════════════════════════════════════════
           RIGHT COLUMN — PRODUCT INFORMATION
        ═══════════════════════════════════════════ */
        .pd-info {
            display: flex;
            flex-direction: column;
        }

        /* Section label tags */
        .pd-section-tag {
            font-family: 'Poppins', sans-serif;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 1.8px;
            text-transform: uppercase;
            color: #717fe0;
            background: rgba(113, 127, 224, 0.1);
            padding: 5px 14px;
            border-radius: 6px;
            display: inline-block;
            margin-bottom: 10px;
            width: fit-content;
        }

        /* Product Name */
        .pd-product-name {
            font-family: 'Poppins', sans-serif;
            font-size: 34px;
            font-weight: 700;
            color: #1a1a24;
            line-height: 1.25;
            margin: 4px 0 22px;
            letter-spacing: -0.4px;
        }

        /* Description */
        .pd-desc-block {
            margin-bottom: 24px;
        }

        .pd-desc-text {
            font-family: 'Poppins', sans-serif;
            font-size: 15px;
            line-height: 1.8;
            color: #555566;
            margin: 4px 0 0;
        }

        /* Separator */
        .pd-sep {
            border: none;
            border-top: 1px solid #edf0f7;
            margin: 22px 0;
        }

        /* ---------- Price Card ---------- */
        .pd-price-card {
            background: linear-gradient(135deg, #f7f8ff 0%, #eef0fc 100%);
            border: 1px solid rgba(113, 127, 224, 0.2);
            border-radius: 18px;
            padding: 22px 28px;
            margin-bottom: 28px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 14px;
            box-shadow: 0 8px 24px rgba(113, 127, 224, 0.08);
        }

        .pd-price-left {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .pd-price-amount {
            display: flex;
            align-items: baseline;
            gap: 4px;
        }

        .pd-rupee {
            font-family: 'Poppins', sans-serif;
            font-size: 24px;
            font-weight: 700;
            color: #717fe0;
        }

        .pd-price-num {
            font-family: 'Poppins', sans-serif;
            font-size: 38px;
            font-weight: 800;
            color: #1a1a24;
            letter-spacing: -1px;
            line-height: 1;
        }

        .pd-price-tag {
            font-size: 12px;
            color: #666677;
            font-weight: 500;
            background: #ffffff;
            padding: 6px 14px;
            border-radius: 20px;
            border: 1px solid rgba(0, 0, 0, 0.06);
        }

        /* ---------- Quantity Block ---------- */
        .pd-qty-block {
            margin-bottom: 28px;
            background: #ffffff;
            border: 1px solid #edf0f7;
            border-radius: 18px;
            padding: 20px 24px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.02);
        }

        .pd-qty-row {
            display: flex;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
            margin-top: 8px;
        }

        .pd-qty-pill {
            display: inline-flex;
            align-items: center;
            border: 2px solid #e2e8f0;
            border-radius: 50px;
            background: #ffffff;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .pd-qty-pill:focus-within,
        .pd-qty-pill:hover {
            border-color: #717fe0;
            box-shadow: 0 0 0 4px rgba(113, 127, 224, 0.15);
        }

        .pd-qty-btn {
            width: 48px;
            height: 48px;
            border: none;
            background: transparent;
            font-size: 20px;
            font-weight: 700;
            color: #2d3748;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .pd-qty-btn:hover {
            background: #717fe0;
            color: #ffffff;
        }

        .pd-qty-btn:active { 
            transform: scale(0.92); 
        }

        .pd-qty-input {
            width: 64px;
            height: 48px;
            border: none;
            border-left: 1px solid #e2e8f0;
            border-right: 1px solid #e2e8f0;
            background: #f8fafc;
            text-align: center;
            font-family: 'Poppins', sans-serif;
            font-size: 18px;
            font-weight: 700;
            color: #1a202c;
            outline: none;
            -moz-appearance: textfield;
        }

        .pd-qty-input::-webkit-inner-spin-button,
        .pd-qty-input::-webkit-outer-spin-button { 
            -webkit-appearance: none; 
        }

        /* Total Price Display Chip */
        .pd-total-chip {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: linear-gradient(135deg, #ffffff 0%, #f4f6fc 100%);
            border: 2px solid #717fe0;
            padding: 10px 22px;
            border-radius: 50px;
            box-shadow: 0 4px 14px rgba(113, 127, 224, 0.18);
        }

        .pd-total-label {
            font-family: 'Poppins', sans-serif;
            font-size: 12px;
            font-weight: 700;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.6px;
        }

        .pd-total-amount {
            font-family: 'Poppins', sans-serif;
            font-size: 22px;
            font-weight: 800;
            color: #717fe0;
        }

        /* ---------- Server Message Area ---------- */
        .pd-msg-area {
            min-height: 28px;
            margin-bottom: 16px;
        }

        .pd-msg-text {
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 600;
            padding: 8px 16px;
            border-radius: 8px;
            display: inline-block;
        }

        /* ---------- Add To Cart & Navigation Actions ---------- */
        .pd-action-group {
            display: flex;
            flex-direction: column;
            gap: 14px;
            margin-bottom: 28px;
        }

        /* Vibrant High-Impact CTA Button */
        .pd-cart-btn {
            width: 100%;
            height: 60px;
            border: none;
            border-radius: 16px;
            background: linear-gradient(135deg, #717fe0 0%, #5b69db 100%);
            color: #ffffff;
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            font-weight: 700;
            letter-spacing: 1.2px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.35s cubic-bezier(0.25, 0.8, 0.25, 1);
            box-shadow: 0 10px 25px rgba(113, 127, 224, 0.38);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        .pd-cart-btn:hover {
            background: linear-gradient(135deg, #5b69db 0%, #4856c9 100%);
            box-shadow: 0 16px 36px rgba(113, 127, 224, 0.55);
            transform: translateY(-3px);
        }

        .pd-cart-btn:active {
            transform: translateY(-1px);
            box-shadow: 0 8px 20px rgba(113, 127, 224, 0.4);
        }

        .pd-nav-btn-row {
            display: flex;
            gap: 14px;
        }

        .pd-continue-btn {
            flex: 1;
            height: 50px;
            border: 2px solid #222222;
            border-radius: 14px;
            background: #222222;
            color: #ffffff !important;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.6px;
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
            box-shadow: 0 8px 20px rgba(113, 127, 224, 0.3);
        }

        .pd-viewcart-btn {
            flex: 1;
            height: 50px;
            border: 2px solid #717fe0;
            border-radius: 14px;
            background: rgba(113, 127, 224, 0.06);
            color: #717fe0 !important;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            text-decoration: none !important;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.3s ease;
        }

        .pd-viewcart-btn:hover {
            background: #717fe0;
            color: #ffffff !important;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(113, 127, 224, 0.35);
        }

        /* ---------- Feature Badges ---------- */
        .pd-features {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 14px;
            margin-top: 10px;
        }

        .pd-feature-item {
            background: #ffffff;
            border: 1px solid #edf0f7;
            border-radius: 16px;
            padding: 18px 14px;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.02);
        }

        .pd-feature-item:hover {
            border-color: rgba(113, 127, 224, 0.4);
            box-shadow: 0 8px 24px rgba(113, 127, 224, 0.15);
            transform: translateY(-3px);
        }

        .pd-feature-item i {
            font-size: 24px;
            color: #717fe0;
            display: block;
            margin-bottom: 8px;
        }

        .pd-feature-item span {
            font-family: 'Poppins', sans-serif;
            font-size: 12px;
            font-weight: 600;
            color: #4a5568;
            line-height: 1.45;
            display: block;
        }

        /* ═══════════════════════════════════════════
           TOAST NOTIFICATIONS (UNTOUCHED / PRESERVED)
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
        @media (max-width: 992px) {
            .pd-page { padding: 110px 0 70px; }
            .pd-grid {
                grid-template-columns: 1fr;
                gap: 35px;
            }

            .pd-gallery { position: static; }
            .pd-img-frame { min-height: 400px; }
            .pd-main-image { height: 380px; }
            .pd-product-name { font-size: 28px; }
            .pd-price-num { font-size: 32px; }
        }

        @media (max-width: 576px) {
            .pd-page { padding: 95px 0 60px; }
            .pd-grid { padding: 0 16px; }
            .pd-img-frame { min-height: 300px; padding: 18px; }
            .pd-main-image { height: 280px; }
            .pd-product-name { font-size: 24px; }
            .pd-features { grid-template-columns: 1fr; }
            .pd-nav-btn-row { flex-direction: column; }
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

                <!-- ═══ Two-Column Product Grid ═══ -->
                <div class="pd-grid">

                    <!-- LEFT — Large Product Image Showcase -->
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
         * Preserved original toast functionality
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
