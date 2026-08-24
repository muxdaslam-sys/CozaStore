<%@ Page Title="Tax Invoice - Coza Store" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="Ecom_Project.User.My_Oders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap');

        /* Screen Wrapper */
        .ecom-bill-screen {
            background-color: #f1f5f9;
            padding: 40px 0 80px 0;
            font-family: 'Plus Jakarta Sans', 'Inter', sans-serif;
            color: #0f172a;
            min-height: 85vh;
        }

        .ecom-bill-container {
            max-width: 880px;
            margin: 0 auto;
            padding: 0 16px;
        }

        /* Screen Top Bar */
        .ecom-bill-topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
            gap: 16px;
        }

        .btn-ecom-back {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 18px;
            font-size: 13px;
            font-weight: 700;
            color: #334155;
            background: #ffffff;
            border: 1.5px solid #cbd5e1;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.2s ease;
            text-decoration: none !important;
            box-shadow: 0 1px 3px rgba(15, 23, 42, 0.04);
        }

        .btn-ecom-back:hover {
            background: #f8fafc;
            color: #0f172a;
            border-color: #94a3b8;
        }

        .btn-ecom-print {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 22px;
            font-size: 13px;
            font-weight: 700;
            color: #ffffff;
            background: #717fe0;
            border: 1.5px solid #717fe0;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.2s ease;
            text-decoration: none !important;
            box-shadow: 0 4px 14px rgba(113, 127, 224, 0.28);
        }

        .btn-ecom-print:hover {
            background: #5b69c7;
            border-color: #5b69c7;
            color: #ffffff;
            box-shadow: 0 6px 18px rgba(113, 127, 224, 0.38);
        }

        /* Professional Invoice Card */
        .ecom-invoice-card {
            background: #ffffff;
            border-radius: 20px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 10px 30px rgba(15, 23, 42, 0.05);
            padding: 48px;
            position: relative;
        }

        @media (max-width: 640px) {
            .ecom-invoice-card {
                padding: 24px;
            }
        }

        /* Invoice Header Section */
        .invoice-brand-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding-bottom: 24px;
            border-bottom: 2px solid #0f172a;
            margin-bottom: 28px;
            gap: 20px;
            flex-wrap: wrap;
        }

        .brand-logo-text {
            font-size: 26px;
            font-weight: 800;
            color: #0f172a;
            letter-spacing: -0.5px;
            margin: 0 0 4px 0;
            line-height: 1;
        }

        .brand-logo-text span {
            color: #717fe0;
        }

        .company-meta-sub {
            font-size: 12px;
            color: #64748b;
            line-height: 1.4;
        }

        .invoice-title-block {
            text-align: right;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            gap: 6px;
        }

        .invoice-heading-label {
            font-size: 20px;
            font-weight: 800;
            color: #0f172a;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .invoice-number-tag {
            font-size: 13px;
            font-weight: 700;
            color: #475569;
        }

        .invoice-number-tag span.num-highlight {
            color: #717fe0;
            font-family: monospace;
            font-size: 14px;
            font-weight: 800;
        }

        .invoice-paid-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #059669;
            background: #ecfdf5;
            border: 1px solid #a7f3d0;
            padding: 4px 12px;
            border-radius: 20px;
            margin-top: 4px;
        }

        /* 2-Column Addresses Section */
        .invoice-addresses-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            margin-bottom: 32px;
        }

        @media (max-width: 640px) {
            .invoice-addresses-grid {
                grid-template-columns: 1fr;
            }
        }

        .address-box {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 20px;
        }

        .address-box-title {
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            color: #64748b;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .address-box-title i {
            color: #717fe0;
        }

        .address-name {
            font-size: 15px;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 6px;
        }

        .address-detail-line {
            font-size: 13px;
            color: #475569;
            line-height: 1.5;
            margin-bottom: 3px;
        }

        /* GridView Table Styling */
        .invoice-items-wrapper {
            margin-bottom: 28px;
            border-radius: 14px;
            overflow: hidden;
            border: 1px solid #e2e8f0;
        }

        .ecom-gridview {
            width: 100%;
            border-collapse: collapse;
            background: #ffffff;
        }

        .ecom-gridview th {
            background: #f8fafc;
            color: #334155;
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            padding: 14px 18px;
            border-bottom: 1px solid #e2e8f0;
            text-align: left;
        }

        .ecom-gridview td {
            padding: 16px 18px;
            font-size: 13px;
            font-weight: 600;
            color: #1e293b;
            border-bottom: 1px solid #f1f5f9;
            vertical-align: middle;
        }

        .ecom-gridview tr:last-child td {
            border-bottom: none;
        }

        .ecom-gridview img {
            width: 48px;
            height: 48px;
            object-fit: cover;
            border-radius: 10px;
            border: 1px solid #e2e8f0;
            background: #f8fafc;
        }

        /* Summary Total Block */
        .invoice-totals-row {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 28px;
        }

        .totals-card {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 20px 24px;
            width: 100%;
            max-width: 360px;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .totals-line {
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 13px;
            font-weight: 600;
            color: #64748b;
        }

        .totals-line.grand-total {
            padding-top: 12px;
            border-top: 2px dashed #cbd5e1;
            font-size: 15px;
            font-weight: 800;
            color: #0f172a;
        }

        .total-amount-display {
            font-size: 20px;
            font-weight: 800;
            color: #717fe0;
        }

        .free-shipping-tag {
            color: #059669;
            font-weight: 700;
            background: #ecfdf5;
            padding: 2px 8px;
            border-radius: 6px;
            font-size: 11px;
        }

        /* Legal Footer Stamp */
        .invoice-legal-footer {
            padding-top: 24px;
            border-top: 1px solid #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            font-size: 12px;
            color: #94a3b8;
        }

        .legal-stamp-text {
            font-weight: 600;
            color: #64748b;
        }

        /* Print Optimization Rules for Single-Page A4 Receipt */
        @page {
            size: A4 portrait;
            margin: 8mm 12mm;
        }

        @media print {
            body, html {
                background: #ffffff !important;
                color: #000000 !important;
                font-size: 12px !important;
                width: 100% !important;
                height: auto !important;
                margin: 0 !important;
                padding: 0 !important;
            }

            header, footer, nav, .ecom-bill-topbar, .bg-img1, .orders-page-section, .chat-overlay-modal, .header-v4, .footer-bg, .wrap-header-mobile {
                display: none !important;
            }

            .ecom-bill-screen {
                background: #ffffff !important;
                padding: 0 !important;
                margin: 0 !important;
                min-height: auto !important;
            }

            .ecom-bill-container {
                max-width: 100% !important;
                width: 100% !important;
                padding: 0 !important;
                margin: 0 !important;
            }

            .ecom-invoice-card {
                box-shadow: none !important;
                border: none !important;
                padding: 0 !important;
                margin: 0 !important;
                background: #ffffff !important;
                page-break-inside: avoid !important;
            }

            .invoice-brand-row {
                padding-bottom: 16px !important;
                margin-bottom: 20px !important;
                border-bottom: 2px solid #000000 !important;
            }

            .brand-logo-text {
                font-size: 22px !important;
                color: #000000 !important;
            }

            .brand-logo-text span {
                color: #717fe0 !important;
            }

            .invoice-heading-label {
                font-size: 18px !important;
            }

            .invoice-addresses-grid {
                gap: 16px !important;
                margin-bottom: 20px !important;
            }

            .address-box {
                padding: 12px 16px !important;
                border: 1px solid #cbd5e1 !important;
                background: #fafafa !important;
            }

            .address-box-title {
                font-size: 10px !important;
                margin-bottom: 6px !important;
            }

            .address-name {
                font-size: 13px !important;
                margin-bottom: 4px !important;
            }

            .address-detail-line {
                font-size: 11px !important;
            }

            .invoice-items-wrapper {
                margin-bottom: 20px !important;
                border: 1px solid #000000 !important;
                border-radius: 0 !important;
            }

            .ecom-gridview th {
                background: #f1f5f9 !important;
                color: #000000 !important;
                padding: 8px 12px !important;
                font-size: 10px !important;
                border-bottom: 1px solid #000000 !important;
            }

            .ecom-gridview td {
                padding: 8px 12px !important;
                font-size: 11px !important;
                border-bottom: 1px solid #e2e8f0 !important;
            }

            .ecom-gridview img {
                width: 36px !important;
                height: 36px !important;
            }

            .invoice-totals-row {
                margin-bottom: 20px !important;
            }

            .totals-card {
                padding: 12px 16px !important;
                border: 1px solid #000000 !important;
                background: #fafafa !important;
            }

            .totals-line {
                font-size: 11px !important;
            }

            .total-amount-display {
                font-size: 16px !important;
                color: #000000 !important;
            }

            .invoice-legal-footer {
                padding-top: 14px !important;
                font-size: 10px !important;
                border-top: 1px solid #ddd !important;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Top Banner -->
    <section class="bg-img1 txt-center p-lr-15 p-tb-60" style="background-image: url('../images/bg-02.jpg');">
        <h2 class="ltext-105 cl0 txt-center font-weight-bold">
            Tax Invoice
        </h2>
        <p class="stext-107 cl7 txt-center m-t-8">
            Official purchase receipt and itemized billing breakdown
        </p>
    </section>

    <div class="ecom-bill-screen">
        <div class="container ecom-bill-container">

            <!-- Top Actions Toolbar -->
            <div class="ecom-bill-topbar">
                <a href="ViewOrders.aspx" class="btn-ecom-back">
                    <i class="fa fa-arrow-left"></i> Return to Orders
                </a>
                <button type="button" onclick="window.print();" class="btn-ecom-print">
                    <i class="fa fa-print"></i> Print Invoice
                </button>
            </div>

            <!-- Main Invoice Card -->
            <div class="ecom-invoice-card">

                <!-- Header Row -->
                <div class="invoice-brand-row">
                    <div>
                        <h1 class="brand-logo-text">COZA <span>STORE</span></h1>
                        <div class="company-meta-sub">
                            Coza Store Retail Inc.<br />
                            Official E-Commerce Receipt
                        </div>
                    </div>

                    <div class="invoice-title-block">
                        <span class="invoice-heading-label">TAX INVOICE</span>
                        <span class="invoice-number-tag">
                            Invoice No: <span class="num-highlight">#<asp:Label ID="lblbillid" runat="server" Text="N/A"></asp:Label></span>
                        </span>
                        <div class="invoice-paid-badge">
                            <i class="fa fa-check-circle"></i> Payment Completed
                        </div>
                    </div>
                </div>

                <!-- Hidden static labels from designer to preserve C# code-behind compatibility -->
                <div style="display: none;">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    <asp:Label ID="Label7" runat="server"></asp:Label>
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                </div>

                <!-- 2-Column Addresses Section -->
                <div class="invoice-addresses-grid">
                    <!-- Customer Billed To -->
                    <div class="address-box">
                        <div class="address-box-title">
                            <i class="fa fa-user"></i> Billed To
                        </div>
                        <div class="address-name">
                            <asp:Label ID="lblname" runat="server" Text="N/A"></asp:Label>
                        </div>
                        <div class="address-detail-line">
                            Email: <asp:Label ID="lblemail" runat="server" Text="N/A"></asp:Label>
                        </div>
                        <div class="address-detail-line">
                            Phone: <asp:Label ID="lblnumber" runat="server" Text="N/A"></asp:Label>
                        </div>
                    </div>

                    <!-- Shipping Address -->
                    <div class="address-box">
                        <div class="address-box-title">
                            <i class="fa fa-truck"></i> Shipped To
                        </div>
                        <div class="address-name">
                            <asp:Label ID="lbladdress" runat="server" Text="N/A"></asp:Label>
                        </div>
                        <div class="address-detail-line">
                            PIN Code: <asp:Label ID="lblpincode" runat="server" Text="N/A"></asp:Label>
                        </div>
                    </div>
                </div>

                <!-- Itemized Order Table -->
                <div class="invoice-items-wrapper">
                    <asp:GridView ID="gvbill" runat="server" AutoGenerateColumns="False" CssClass="ecom-gridview" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Product">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Product_image") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Product_name" HeaderText="Item Details" />
                            <asp:BoundField DataField="Product_price" HeaderText="Unit Price" DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                            <asp:BoundField DataField="SubTotal" HeaderText="Total Amount" DataFormatString="{0:N2}" />
                        </Columns>
                    </asp:GridView>
                </div>

                <!-- Totals Section -->
                <div class="invoice-totals-row">
                    <div class="totals-card">
                        <div class="totals-line">
                            <span>Shipping & Delivery</span>
                            <span class="free-shipping-tag">FREE</span>
                        </div>
                        <div class="totals-line grand-total">
                            <span>Grand Total Paid</span>
                            <span class="total-amount-display">
                                &#8377;<asp:Label ID="lbltotal" runat="server" Text="0.00"></asp:Label>
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Legal Footer Stamp -->
                <div class="invoice-legal-footer">
                    <span class="legal-stamp-text">
                        <i class="fa fa-info-circle"></i> Computer-generated tax invoice. No signature required.
                    </span>
                    <span>Thank you for shopping at Coza Store!</span>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
