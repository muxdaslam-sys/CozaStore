<%@ Page Title="Order Invoice - Coza Store" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="Ecom_Project.User.My_Oders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap');

        .invoice-luxury-wrapper {
            background: linear-gradient(180deg, #f4f5fa 0%, #f9fafc 100%);
            padding-top: 50px;
            padding-bottom: 90px;
            font-family: 'Plus Jakarta Sans', 'Poppins', sans-serif;
            color: #1e293b;
        }

        /* Order Confirmed Banner Card */
        .confirmed-header-card {
            background: #ffffff;
            border-radius: 20px;
            border: 1px solid rgba(226, 232, 240, 0.9);
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.03);
            padding: 40px 30px;
            text-align: center;
            margin-bottom: 35px;
        }

        .confirmed-icon-circle {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #dcfce7 0%, #f0fdf4 100%);
            border: 2px solid #22c55e;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px auto;
            color: #16a34a;
            font-size: 40px;
            box-shadow: 0 8px 24px rgba(34, 197, 94, 0.25);
        }

        .confirmed-title {
            font-size: 26px;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }

        .confirmed-sub {
            font-size: 15px;
            color: #64748b;
            margin-bottom: 0;
        }

        /* Main Invoice Card Container */
        .invoice-main-card {
            background: #ffffff;
            border-radius: 24px;
            border: 1px solid rgba(226, 232, 240, 0.9);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.04);
            padding: 45px;
            margin-bottom: 35px;
        }

        .invoice-brand-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 28px;
            border-bottom: 2px solid #f1f5f9;
            margin-bottom: 32px;
            flex-wrap: wrap;
            gap: 20px;
        }

        .brand-logo-heading {
            font-size: 26px;
            font-weight: 800;
            color: #0f172a;
            letter-spacing: -0.5px;
        }

        .brand-logo-heading span {
            color: #6366f1;
        }

        .invoice-order-badge {
            background: #f4f3ff;
            color: #6366f1;
            font-size: 14px;
            font-weight: 700;
            padding: 8px 18px;
            border-radius: 12px;
            border: 1px solid #e0e7ff;
            display: inline-block;
        }

        /* Customer Info Grid */
        .invoice-customer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 18px;
            margin-bottom: 35px;
        }

        .invoice-field-pill {
            background: #f8fafc;
            border-radius: 14px;
            padding: 18px 20px;
            border: 1px solid #f1f5f9;
        }

        .invoice-field-label {
            font-size: 11px;
            font-weight: 800;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            margin-bottom: 6px;
            display: block;
        }

        .invoice-field-value {
            font-size: 15px;
            font-weight: 700;
            color: #0f172a;
            display: block;
            word-break: break-word;
        }

        /* GridView Table Styling */
        .invoice-gridview-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 25px;
        }

        .invoice-gridview-table th {
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #64748b;
            padding: 14px;
            border-bottom: 2px solid #f1f5f9;
            background: #f8fafc;
        }

        .invoice-gridview-table td {
            padding: 16px 14px;
            border-bottom: 1px solid #f1f5f9;
            vertical-align: middle;
            font-size: 14px;
            font-weight: 600;
            color: #1e293b;
        }

        .invoice-gridview-table img {
            border-radius: 10px;
            object-fit: cover;
            box-shadow: 0 4px 10px rgba(0,0,0,0.06);
        }

        /* Balanced 2-Column Invoice Footer */
        .invoice-footer-grid {
            display: grid;
            grid-template-columns: 1.2fr 1fr;
            gap: 25px;
            margin-top: 30px;
            align-items: stretch;
        }

        @media (max-width: 768px) {
            .invoice-footer-grid {
                grid-template-columns: 1fr;
            }
        }

        .invoice-notes-card {
            background: #f8fafc;
            border-radius: 16px;
            padding: 24px;
            border: 1px solid #e2e8f0;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .notes-heading {
            font-size: 14px;
            font-weight: 800;
            color: #0f172a;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .notes-list {
            font-size: 13px;
            color: #64748b;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .notes-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: #f0fdf4;
            color: #16a34a;
            font-size: 12px;
            font-weight: 700;
            padding: 8px 14px;
            border-radius: 8px;
            border: 1px solid #bbf7d0;
        }

        .invoice-totals-box {
            background: #ffffff;
            border-radius: 16px;
            padding: 24px;
            border: 2px solid #6366f1;
            box-shadow: 0 8px 24px rgba(99, 102, 241, 0.08);
        }

        .totals-item-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            font-size: 14px;
            color: #64748b;
            font-weight: 500;
        }

        .totals-item-row.grand-paid-row {
            font-size: 16px;
            font-weight: 800;
            color: #0f172a;
            border-top: 2px dashed #cbd5e1;
            padding-top: 16px;
            margin-top: 14px;
            margin-bottom: 0;
        }

        .grand-rupee-text {
            color: #6366f1;
            font-size: 26px;
            font-weight: 800;
        }

        /* Action Buttons */
        .invoice-button-group {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 16px;
            flex-wrap: wrap;
            margin-top: 35px;
        }

        .btn-invoice-action-print {
            padding: 0 32px;
            height: 52px;
            background: #0f172a;
            color: #ffffff;
            border: none;
            border-radius: 14px;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 6px 18px rgba(15, 23, 42, 0.25);
        }

        .btn-invoice-action-print:hover {
            background: #6366f1;
            color: #ffffff;
            transform: translateY(-2px);
        }

        .btn-invoice-action-shop {
            padding: 0 32px;
            height: 52px;
            background: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%);
            color: #ffffff;
            border: none;
            border-radius: 14px;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            box-shadow: 0 8px 22px rgba(99, 102, 241, 0.38);
        }

        .btn-invoice-action-shop:hover {
            background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%);
            color: #ffffff;
            transform: translateY(-2px);
        }

        /* Print formatting */
        @media print {
            header, footer, .top-bar, .bg-img1, .invoice-button-group, .confirmed-header-card {
                display: none !important;
            }
            .invoice-main-card {
                box-shadow: none !important;
                border: none !important;
                padding: 0 !important;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header Banner using clean bg-02 photoshoot banner -->
    <section class="bg-img1 txt-center p-lr-15 p-tb-70" style="background-image: url('../images/bg-02.jpg');">
        <h2 class="ltext-105 cl0 txt-center font-weight-bold">
            Order Tax Invoice
        </h2>
    </section>

    <div class="invoice-luxury-wrapper">
        <div class="container">

            <!-- Success Confirmed Banner -->
            <div class="confirmed-header-card">
                <div class="confirmed-icon-circle">
                    <i class="zmdi zmdi-check"></i>
                </div>
                <h3 class="confirmed-title">Order Confirmed Successfully!</h3>
                <p class="confirmed-sub">Thank you for shopping with Coza Store. Below is your official tax receipt.</p>
            </div>

            <!-- Main Invoice Card -->
            <div class="invoice-main-card">
                
                <!-- Invoice Brand Header -->
                <div class="invoice-brand-row">
                    <div class="brand-logo-heading">
                        COZA <span>STORE</span>
                    </div>
                    <div>
                        <div class="invoice-order-badge">
                            Order Group ID: #<asp:Label ID="lblbillid" runat="server" Text="N/A"></asp:Label>
                        </div>
                    </div>
                </div>

                <!-- Customer Details Grid -->
                <div class="invoice-customer-grid">
                    <div class="invoice-field-pill">
                        <asp:Label ID="Label1" runat="server" CssClass="invoice-field-label" Text="Customer Name"></asp:Label>
                        <span class="invoice-field-value">
                            <asp:Label ID="lblname" runat="server" Text="N/A"></asp:Label>
                        </span>
                    </div>

                    <div class="invoice-field-pill">
                        <asp:Label ID="Label7" runat="server" CssClass="invoice-field-label" Text="Email Address"></asp:Label>
                        <span class="invoice-field-value">
                            <asp:Label ID="lblemail" runat="server" Text="N/A"></asp:Label>
                        </span>
                    </div>

                    <div class="invoice-field-pill">
                        <asp:Label ID="Label2" runat="server" CssClass="invoice-field-label" Text="Phone Number"></asp:Label>
                        <span class="invoice-field-value">
                            <asp:Label ID="lblnumber" runat="server" Text="N/A"></asp:Label>
                        </span>
                    </div>

                    <div class="invoice-field-pill">
                        <asp:Label ID="Label4" runat="server" CssClass="invoice-field-label" Text="PIN Code"></asp:Label>
                        <span class="invoice-field-value">
                            <asp:Label ID="lblpincode" runat="server" Text="N/A"></asp:Label>
                        </span>
                    </div>

                    <div class="invoice-field-pill" style="grid-column: 1 / -1;">
                        <asp:Label ID="Label3" runat="server" CssClass="invoice-field-label" Text="Delivery Address"></asp:Label>
                        <span class="invoice-field-value">
                            <asp:Label ID="lbladdress" runat="server" Text="N/A"></asp:Label>
                        </span>
                    </div>
                </div>

                <!-- GridView Items Table -->
                <div class="table-responsive">
                    <asp:GridView ID="gvbill" runat="server" AutoGenerateColumns="False" 
                        CssClass="invoice-gridview-table" GridLines="None">
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

                <!-- Balanced 2-Column Invoice Footer -->
                <div class="invoice-footer-grid">
                    
                    <!-- Left: Order Notes & Shipping Status -->
                    <div class="invoice-notes-card">
                        <div>
                            <div class="notes-heading">
                                <i class="zmdi zmdi-info-outline fs-18"></i> Delivery & Support Information
                            </div>
                            <ul style="list-style: none; padding-left: 0; margin-bottom: 15px;">
                                <li style="margin-bottom: 8px; font-size: 13px; color: #64748b; display: flex; align-items: center; gap: 8px;"><i class="zmdi zmdi-truck text-primary fs-16"></i> Expected Delivery: <strong style="color: #1e293b;">3 - 5 Business Days</strong></li>
                                <li style="margin-bottom: 8px; font-size: 13px; color: #64748b; display: flex; align-items: center; gap: 8px;"><i class="zmdi zmdi-shield-check text-success fs-16"></i> Standard Express Shipping (Tracked & Insured)</li>
                                <li style="margin-bottom: 0; font-size: 13px; color: #64748b; display: flex; align-items: center; gap: 8px;"><i class="zmdi zmdi-email text-primary fs-16"></i> Need help? Email us at <strong style="color: #1e293b;">support@cozastore.com</strong></li>
                            </ul>
                        </div>
                        <div>
                            <div class="notes-badge">
                                <i class="zmdi zmdi-shield-check"></i> Verified Official Tax Invoice
                            </div>
                        </div>
                    </div>

                    <!-- Right: Price Breakdown Box -->
                    <div class="invoice-totals-box">
                        <div class="totals-item-row">
                            <span>Shipping Charge</span>
                            <span class="text-success font-weight-bold">FREE</span>
                        </div>
                        <div class="totals-item-row">
                            <span>GST & Taxes</span>
                            <span>Inclusive</span>
                        </div>
                        <div class="totals-item-row grand-paid-row">
                            <asp:Label ID="Label5" runat="server" Text="Grand Total Paid"></asp:Label>
                            <span>&#8377;<asp:Label ID="lbltotal" runat="server" Text="0.00" CssClass="grand-rupee-text"></asp:Label></span>
                        </div>
                    </div>

                </div>

                <!-- Action Buttons -->
                <div class="invoice-button-group">
                    <button type="button" class="btn-invoice-action-print" onclick="window.print();">
                        <i class="fa fa-print"></i> Print Invoice
                    </button>
                    <a href="Product.aspx" class="btn-invoice-action-shop">
                        <i class="fa fa-shopping-bag"></i> Continue Shopping
                    </a>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
