<%@ Page Title="Tax Invoice - Coza Store" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="Ecom_Project.User.My_Oders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap');

        /* ════════════════════════════════════════════════
           ANIMATIONS
        ════════════════════════════════════════════════ */
        @keyframes billFadeUp {
            from { opacity: 0; transform: translateY(24px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        @keyframes shimmerLine {
            0%   { background-position: -400px 0; }
            100% { background-position: 400px 0; }
        }

        /* ════════════════════════════════════════════════
           PAGE WRAPPER
        ════════════════════════════════════════════════ */
        .bill-page-wrapper {
            background: #f8fafc;
            padding: 50px 0 100px 0;
            font-family: 'Plus Jakarta Sans', 'Poppins', -apple-system, sans-serif;
            color: #0f172a;
            min-height: 80vh;
        }

        .bill-container {
            max-width: 980px;
            margin: 0 auto;
        }

        /* ════════════════════════════════════════════════
           CARD COMPONENT
        ════════════════════════════════════════════════ */
        .bill-card {
            background: #ffffff;
            border-radius: 20px;
            border: 1px solid rgba(230, 233, 245, 0.9);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            padding: 28px 32px;
            margin-bottom: 24px;
            animation: billFadeUp 0.5s ease both;
            transition: box-shadow 0.3s ease, border-color 0.3s ease;
        }

        .bill-card:hover {
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.06);
            border-color: #cbd5e1;
        }

        .bill-card:nth-child(1) { animation-delay: 0s; }
        .bill-card:nth-child(2) { animation-delay: 0.08s; }
        .bill-card:nth-child(3) { animation-delay: 0.16s; }
        .bill-card:nth-child(4) { animation-delay: 0.24s; }

        .bill-card-header {
            font-size: 16px;
            font-weight: 700;
            color: #1a1a24;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            padding-bottom: 14px;
            border-bottom: 2px solid #f0f2f7;
            letter-spacing: 0.3px;
        }

        .bill-card-header i {
            color: #717fe0;
            font-size: 18px;
            width: 36px;
            height: 36px;
            border-radius: 10px;
            background: rgba(113, 127, 224, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        /* ════════════════════════════════════════════════
           CARD 1 — INVOICE HEADER
        ════════════════════════════════════════════════ */
        .bill-card.bill-header-card {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            border: none;
            padding: 32px 36px;
            position: relative;
            overflow: hidden;
        }

        .bill-card.bill-header-card::before {
            content: '';
            position: absolute;
            top: -60%;
            right: -15%;
            width: 320px;
            height: 320px;
            background: radial-gradient(circle, rgba(113, 127, 224, 0.12) 0%, transparent 70%);
            border-radius: 50%;
            pointer-events: none;
        }

        .bill-card.bill-header-card::after {
            content: '';
            position: absolute;
            bottom: -50%;
            left: -10%;
            width: 260px;
            height: 260px;
            background: radial-gradient(circle, rgba(56, 189, 248, 0.08) 0%, transparent 70%);
            border-radius: 50%;
            pointer-events: none;
        }

        .bill-topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            position: relative;
            z-index: 1;
        }

        .bill-brand-block {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .bill-brand-name {
            font-size: 28px;
            font-weight: 800;
            color: #ffffff;
            letter-spacing: -0.5px;
            margin: 0;
        }

        .bill-brand-name span {
            color: #717fe0;
        }

        .bill-doc-label {
            font-size: 11px;
            font-weight: 700;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 1.5px;
        }

        .bill-meta-right {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .bill-order-pill {
            background: rgba(255, 255, 255, 0.1);
            color: #ffffff;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 0.5px;
            padding: 8px 18px;
            border-radius: 30px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            border: 1px solid rgba(255, 255, 255, 0.12);
            backdrop-filter: blur(8px);
        }

        .bill-order-pill .pill-id {
            color: #38bdf8;
            font-weight: 800;
        }

        .bill-status-pill {
            background: rgba(16, 185, 129, 0.15);
            color: #34d399;
            font-size: 12px;
            font-weight: 700;
            padding: 6px 14px;
            border-radius: 20px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            border: 1px solid rgba(52, 211, 153, 0.25);
        }

        /* ════════════════════════════════════════════════
           CARD 2 — CUSTOMER INFO GRID
        ════════════════════════════════════════════════ */
        .bill-info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(210px, 1fr));
            gap: 14px;
        }

        .bill-info-tile {
            background: #f8fafc;
            border-radius: 14px;
            padding: 16px 18px;
            border: 1px solid #eef2f7;
            transition: all 0.25s ease;
            position: relative;
        }

        .bill-info-tile:hover {
            border-color: #717fe0;
            background: #ffffff;
            box-shadow: 0 6px 16px rgba(113, 127, 224, 0.08);
            transform: translateY(-1px);
        }

        .bill-info-tile.full-span {
            grid-column: 1 / -1;
        }

        .bill-tile-label {
            font-size: 10.5px;
            font-weight: 700;
            color: #94a3b8;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            margin-bottom: 5px;
            display: block;
        }

        .bill-tile-value {
            font-size: 14.5px;
            font-weight: 600;
            color: #1e293b;
            display: block;
            word-break: break-word;
            line-height: 1.4;
        }

        /* ════════════════════════════════════════════════
           CARD 3 — ITEMS TABLE
        ════════════════════════════════════════════════ */
        .bill-items-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border: 1px solid #eef2f7;
            border-radius: 14px;
            overflow: hidden;
        }

        .bill-items-table th {
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            color: #64748b;
            padding: 14px 16px;
            border-bottom: 2px solid #e2e8f0;
            background: #f8fafc;
            text-align: left;
        }

        .bill-items-table td {
            padding: 16px;
            border-bottom: 1px solid #f1f5f9;
            vertical-align: middle;
            font-size: 14px;
            font-weight: 600;
            color: #334155;
            background: #ffffff;
            transition: background 0.15s ease;
        }

        .bill-items-table tr:hover td {
            background: #fafbfe;
        }

        .bill-items-table tr:last-child td {
            border-bottom: none;
        }

        .bill-items-table img {
            border-radius: 10px;
            object-fit: cover;
            box-shadow: 0 3px 8px rgba(0,0,0,0.06);
            border: 1px solid #e2e8f0;
        }

        /* ════════════════════════════════════════════════
           CARD 4 — PAYMENT SUMMARY
        ════════════════════════════════════════════════ */
        .bill-summary-box {
            background: #f8fafc;
            border-radius: 14px;
            padding: 20px 22px;
            border: 1px solid #e2e8f0;
        }

        .bill-summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            font-size: 14px;
            color: #64748b;
            font-weight: 500;
        }

        .bill-summary-row .free-tag {
            color: #10b981;
            font-weight: 700;
        }

        .bill-summary-row.total-row {
            font-size: 16px;
            font-weight: 700;
            color: #1e293b;
            border-top: 2px dashed #cbd5e1;
            padding-top: 16px;
            margin-top: 12px;
            margin-bottom: 0;
        }

        .bill-rupee-total {
            color: #717fe0;
            font-size: 24px;
            font-weight: 800;
        }

        /* ════════════════════════════════════════════════
           ACTION BUTTONS
        ════════════════════════════════════════════════ */
        .bill-actions-group {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 14px;
            margin-top: 30px;
            flex-wrap: wrap;
            animation: billFadeUp 0.5s ease 0.32s both;
        }

        .btn-bill-print {
            height: 50px;
            padding: 0 30px;
            background: linear-gradient(135deg, #717fe0 0%, #5a67d8 100%);
            color: #ffffff !important;
            border: none;
            border-radius: 14px;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 8px 22px rgba(113, 127, 224, 0.3);
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .btn-bill-print:hover {
            background: linear-gradient(135deg, #5a67d8 0%, #4f46e5 100%);
            box-shadow: 0 12px 28px rgba(113, 127, 224, 0.45);
            transform: translateY(-2px);
        }

        .btn-bill-shop {
            height: 50px;
            padding: 0 30px;
            background: #ffffff;
            color: #717fe0 !important;
            border: 2px solid #d8dcf0;
            border-radius: 14px;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            text-decoration: none !important;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .btn-bill-shop:hover {
            background: #717fe0;
            color: #ffffff !important;
            border-color: #717fe0;
            box-shadow: 0 8px 22px rgba(113, 127, 224, 0.3);
            transform: translateY(-2px);
        }

        /* ════════════════════════════════════════════════
           RESPONSIVE
        ════════════════════════════════════════════════ */
        @media (max-width: 768px) {
            .bill-card { padding: 22px 20px; }
            .bill-card.bill-header-card { padding: 26px 22px; }
            .bill-brand-name { font-size: 22px; }
            .bill-topbar { gap: 14px; }
            .bill-info-grid { grid-template-columns: 1fr 1fr; gap: 10px; }
            .bill-items-table th, .bill-items-table td { padding: 12px; font-size: 13px; }
        }

        @media (max-width: 480px) {
            .bill-info-grid { grid-template-columns: 1fr; }
        }

        /* ════════════════════════════════════════════════
           1-PAGE PRINT MEDIA
        ════════════════════════════════════════════════ */
        @media print {
            @page {
                size: A4 portrait;
                margin: 8mm 12mm;
            }

            body, html {
                background: #fff !important;
                margin: 0 !important;
                padding: 0 !important;
            }

            * {
                animation: none !important;
                transition: none !important;
            }

            header, footer, nav, .top-bar, .bg-img1, .bill-actions-group, .my-account-wrap {
                display: none !important;
            }

            .bill-page-wrapper {
                padding: 0 !important;
                background: transparent !important;
            }

            .container {
                max-width: 100% !important;
                width: 100% !important;
                padding: 0 !important;
                margin: 0 !important;
            }

            .bill-card {
                border: none !important;
                box-shadow: none !important;
                padding: 0 0 14px 0 !important;
                margin-bottom: 14px !important;
                page-break-inside: avoid !important;
                border-radius: 0 !important;
            }

            .bill-card.bill-header-card {
                background: #ffffff !important;
                padding: 0 0 14px 0 !important;
                border-bottom: 2px solid #000 !important;
            }

            .bill-card.bill-header-card::before,
            .bill-card.bill-header-card::after {
                display: none !important;
            }

            .bill-brand-name {
                font-size: 20px !important;
                color: #000 !important;
            }

            .bill-brand-name span {
                color: #000 !important;
            }

            .bill-doc-label {
                color: #555 !important;
            }

            .bill-order-pill {
                background: #f1f5f9 !important;
                color: #000 !important;
                border: 1px solid #999 !important;
                padding: 4px 12px !important;
                font-size: 11px !important;
            }

            .bill-order-pill .pill-id {
                color: #000 !important;
            }

            .bill-status-pill {
                background: #ecfdf5 !important;
                color: #166534 !important;
                border: 1px solid #86efac !important;
                font-size: 10px !important;
                padding: 3px 10px !important;
            }

            .bill-card-header {
                margin-bottom: 10px !important;
                padding-bottom: 6px !important;
                font-size: 13px !important;
            }

            .bill-card-header i {
                width: 24px !important;
                height: 24px !important;
                font-size: 13px !important;
            }

            .bill-info-grid {
                gap: 6px !important;
            }

            .bill-info-tile {
                padding: 6px 10px !important;
                border: 1px solid #cbd5e1 !important;
                border-radius: 6px !important;
            }

            .bill-tile-label {
                font-size: 9px !important;
                margin-bottom: 1px !important;
            }

            .bill-tile-value {
                font-size: 11.5px !important;
            }

            .bill-items-table {
                border: 1px solid #ccc !important;
                border-radius: 0 !important;
            }

            .bill-items-table th {
                padding: 5px 8px !important;
                font-size: 10px !important;
                border-bottom: 2px solid #000 !important;
            }

            .bill-items-table td {
                padding: 5px 8px !important;
                font-size: 11px !important;
            }

            .bill-items-table img {
                height: 32px !important;
                width: 26px !important;
                box-shadow: none !important;
            }

            .bill-summary-box {
                padding: 8px 12px !important;
                border: 1px solid #cbd5e1 !important;
                border-radius: 6px !important;
            }

            .bill-summary-row {
                font-size: 11px !important;
                margin-bottom: 4px !important;
            }

            .bill-summary-row.total-row {
                font-size: 13px !important;
                padding-top: 6px !important;
                margin-top: 6px !important;
            }

            .bill-rupee-total {
                font-size: 16px !important;
                color: #000 !important;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header Banner -->
    <section class="bg-img1 txt-center p-lr-15 p-tb-70" style="background-image: url('../images/bg-02.jpg');">
        <h2 class="ltext-105 cl0 txt-center font-weight-bold">
            Tax Invoice
        </h2>
    </section>

    <div class="bill-page-wrapper">
        <div class="container bill-container">

            <!-- ── Card 1: Invoice Header (Dark) ── -->
            <div class="bill-card bill-header-card">
                <div class="bill-topbar">
                    <div class="bill-brand-block">
                        <h1 class="bill-brand-name">COZA <span>STORE</span></h1>
                        <span class="bill-doc-label">Tax Invoice</span>
                    </div>
                    <div class="bill-meta-right">
                        <div class="bill-order-pill">
                            ORDER <span class="pill-id">#<asp:Label ID="lblbillid" runat="server" Text="N/A"></asp:Label></span>
                        </div>
                        <div class="bill-status-pill">
                            <i class="fa fa-check-circle"></i> Paid
                        </div>
                    </div>
                </div>
            </div>

            <!-- ── Card 2: Customer Details ── -->
            <div class="bill-card">
                <div class="bill-card-header">
                    <i class="fa fa-user"></i> Customer Details
                    <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Visible="false"></asp:Label>
                </div>
                <div class="bill-info-grid">
                    <div class="bill-info-tile">
                        <span class="bill-tile-label">Customer Name</span>
                        <span class="bill-tile-value">
                            <asp:Label ID="lblname" runat="server" Text="N/A"></asp:Label>
                        </span>
                    </div>
                    <div class="bill-info-tile">
                        <span class="bill-tile-label">Email Address</span>
                        <span class="bill-tile-value">
                            <asp:Label ID="lblemail" runat="server" Text="N/A"></asp:Label>
                        </span>
                    </div>
                    <div class="bill-info-tile">
                        <span class="bill-tile-label">Phone Number</span>
                        <span class="bill-tile-value">
                            <asp:Label ID="lblnumber" runat="server" Text="N/A"></asp:Label>
                        </span>
                    </div>
                    <div class="bill-info-tile">
                        <span class="bill-tile-label">PIN Code</span>
                        <span class="bill-tile-value">
                            <asp:Label ID="lblpincode" runat="server" Text="N/A"></asp:Label>
                        </span>
                    </div>
                    <div class="bill-info-tile full-span">
                        <span class="bill-tile-label">Delivery Address</span>
                        <span class="bill-tile-value">
                            <asp:Label ID="lbladdress" runat="server" Text="N/A"></asp:Label>
                        </span>
                    </div>
                </div>
            </div>

            <!-- ── Card 3: Order Items ── -->
            <div class="bill-card">
                <div class="bill-card-header">
                    <i class="fa fa-shopping-bag"></i> Order Items
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="gvbill" runat="server" AutoGenerateColumns="False" 
                        CssClass="bill-items-table" GridLines="None">
                        <Columns>
                            <asp:ImageField DataImageUrlField="Product_image" HeaderText="Item">
                                <ControlStyle Height="55px" Width="45px" />
                            </asp:ImageField>
                            <asp:BoundField DataField="Product_name" HeaderText="Product Name" />
                            <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                            <asp:BoundField DataField="SubTotal" HeaderText="SubTotal (&#8377;)" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- ── Card 4: Payment Summary ── -->
            <div class="bill-card">
                <div class="bill-card-header">
                    <i class="fa fa-credit-card"></i> Payment Summary
                </div>
                <div class="bill-summary-box">
                    <div class="bill-summary-row">
                        <span>Shipping</span>
                        <span class="free-tag">FREE</span>
                    </div>
                    <div class="bill-summary-row">
                        <span>GST & Taxes</span>
                        <span>Inclusive</span>
                    </div>
                    <div class="bill-summary-row total-row">
                        <asp:Label ID="Label5" runat="server" Text="Grand Total"></asp:Label>
                        <span class="bill-rupee-total">&#8377;<asp:Label ID="lbltotal" runat="server" Text="0.00"></asp:Label></span>
                    </div>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="bill-actions-group">
                <button type="button" class="btn-bill-print" onclick="window.print();">
                    <i class="fa fa-print"></i> Print Invoice
                </button>
                <a href="Product.aspx" class="btn-bill-shop">
                    <i class="fa fa-shopping-bag"></i> Continue Shopping
                </a>
            </div>

        </div>
    </div>
</asp:Content>
