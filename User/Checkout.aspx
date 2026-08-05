<%@ Page Title="Checkout - Coza Store" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Ecom_Project.User.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .checkout-wrapper {
            background-color: #f8f9fa;
            padding-top: 50px;
            padding-bottom: 90px;
            font-family: Poppins-Regular, sans-serif;
        }

        /* CozaStore Step Indicator */
        .coza-step-indicator {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 45px;
            gap: 20px;
            flex-wrap: wrap;
        }

        .coza-step-item {
            display: flex;
            align-items: center;
            gap: 10px;
            font-family: Poppins-Medium, sans-serif;
            font-size: 14px;
            color: #888;
        }

        .coza-step-item.active {
            color: #717fe0;
            font-family: Poppins-SemiBold, sans-serif;
        }

        .coza-step-item.completed {
            color: #2ed573;
        }

        .coza-step-badge {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: #eef0f5;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .coza-step-item.active .coza-step-badge {
            background: #717fe0;
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(113, 127, 224, 0.4);
        }

        .coza-step-item.completed .coza-step-badge {
            background: #2ed573;
            color: #ffffff;
        }

        .coza-step-line {
            width: 50px;
            height: 2px;
            background: #eef0f5;
        }

        /* Coza Card Container */
        .coza-card {
            background: #ffffff;
            border-radius: 12px;
            border: 1px solid #e6e6e6;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.04);
            padding: 30px;
            margin-bottom: 30px;
        }

        .coza-card-header {
            font-family: Poppins-Bold, sans-serif;
            font-size: 18px;
            color: #222222;
            margin-bottom: 22px;
            display: flex;
            align-items: center;
            gap: 12px;
            padding-bottom: 14px;
            border-bottom: 2px solid #f4f4f4;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .coza-card-header i {
            color: #717fe0;
            font-size: 22px;
        }

        /* Information Grid */
        .info-grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 18px;
        }

        .info-card-item {
            background: #f9fafc;
            border-radius: 10px;
            padding: 16px 20px;
            border: 1px solid #ececec;
            transition: border-color 0.3s ease;
        }

        .info-card-item:hover {
            border-color: #717fe0;
        }

        .info-card-item .asp-label-title {
            font-family: Poppins-Medium, sans-serif;
            font-size: 12px;
            color: #888888;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 6px;
            display: block;
        }

        .info-card-item .asp-value-text {
            font-family: Poppins-SemiBold, sans-serif;
            font-size: 15px;
            color: #222222;
            display: block;
            word-break: break-word;
        }

        /* Payment Selector Options */
        .payment-methods-list {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .payment-method-box {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 18px 22px;
            border: 1px solid #e6e6e6;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 0;
            background: #ffffff;
        }

        .payment-method-box:hover,
        .payment-method-box.selected {
            border-color: #717fe0;
            background-color: #f7f8fe;
            box-shadow: 0 4px 12px rgba(113, 127, 224, 0.08);
        }

        .payment-box-left {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .payment-box-left input[type="radio"] {
            accent-color: #717fe0;
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .payment-name {
            font-family: Poppins-SemiBold, sans-serif;
            font-size: 15px;
            color: #222222;
        }

        .payment-sub {
            font-family: Poppins-Regular, sans-serif;
            font-size: 12px;
            color: #888888;
            display: block;
            margin-top: 2px;
        }

        .coza-trust-seal {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #2ed573;
            font-size: 13px;
            font-family: Poppins-Medium, sans-serif;
            margin-top: 20px;
            padding: 12px 18px;
            background: #f0fdf4;
            border-radius: 8px;
            border: 1px solid #dcfce7;
        }

        /* Order Items GridView Styling */
        .coza-checkout-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 20px;
        }

        .coza-checkout-table th {
            font-family: Poppins-Bold, sans-serif;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            color: #222222;
            padding: 12px;
            border-bottom: 2px solid #e6e6e6;
            background: #fafafa;
        }

        .coza-checkout-table td {
            padding: 14px 12px;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
            font-family: Poppins-Regular, sans-serif;
            font-size: 14px;
            color: #333333;
        }

        .coza-checkout-table img {
            border-radius: 8px;
            object-fit: cover;
            box-shadow: 0 3px 8px rgba(0,0,0,0.08);
        }

        /* Summary Total Box */
        .coza-summary-box {
            background: #f9fafc;
            border-radius: 10px;
            padding: 22px;
            border: 1px solid #eaeaea;
            margin-top: 20px;
        }

        .coza-summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            font-size: 14px;
            color: #555555;
            font-family: Poppins-Regular, sans-serif;
        }

        .coza-summary-row.total-row {
            font-size: 16px;
            font-family: Poppins-Bold, sans-serif;
            color: #222222;
            border-top: 2px dashed #e0e0e0;
            padding-top: 16px;
            margin-top: 14px;
            margin-bottom: 0;
        }

        .rupee-total-amount {
            color: #717fe0;
            font-size: 24px;
            font-family: Poppins-Bold, sans-serif;
        }

        /* Coza Action Buttons */
        .btn-coza-confirm {
            width: 100%;
            height: 52px;
            background: #717fe0;
            color: #ffffff;
            border: none;
            border-radius: 26px;
            font-family: Poppins-Medium, sans-serif;
            font-size: 14px;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 6px 18px rgba(113, 127, 224, 0.35);
        }

        .btn-coza-confirm:hover {
            background: #222222;
            box-shadow: 0 6px 18px rgba(34, 34, 34, 0.3);
            color: #ffffff;
        }

        .btn-coza-return {
            width: 100%;
            height: 48px;
            background: transparent;
            color: #717fe0;
            border: 2px solid #717fe0;
            border-radius: 24px;
            font-family: Poppins-Medium, sans-serif;
            font-size: 13px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            cursor: pointer;
            margin-top: 14px;
            transition: all 0.3s ease;
        }

        .btn-coza-return:hover {
            background: #717fe0;
            color: #ffffff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- CozaStore Title Banner -->
    <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/bg-01.jpg');">
        <h2 class="ltext-105 cl0 txt-center">
            Checkout
        </h2>
    </section>

    <div class="checkout-wrapper">
        <div class="container">

            <!-- CozaStore Stepper -->
            <div class="coza-step-indicator">
                <div class="coza-step-item completed">
                    <span class="coza-step-badge"><i class="zmdi zmdi-check"></i></span>
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
                            <i class="zmdi zmdi-pin"></i>
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
                            <i class="zmdi zmdi-card"></i>
                            Payment Method
                        </div>

                        <div class="payment-methods-list">
                            <label class="payment-method-box selected">
                                <div class="payment-box-left">
                                    <input type="radio" name="payOption" value="COD" checked="checked" />
                                    <div>
                                        <div class="payment-name">Cash on Delivery (COD)</div>
                                        <span class="payment-sub">Pay in cash or UPI QR upon package delivery</span>
                                    </div>
                                </div>
                                <i class="zmdi zmdi-money fs-24 cl1"></i>
                            </label>

                            <label class="payment-method-box">
                                <div class="payment-box-left">
                                    <input type="radio" name="payOption" value="UPI" />
                                    <div>
                                        <div class="payment-name">UPI / Digital Wallet</div>
                                        <span class="payment-sub">Google Pay, PhonePe, Paytm, BHIM UPI</span>
                                    </div>
                                </div>
                                <i class="zmdi zmdi-smartphone-android fs-24 cl1"></i>
                            </label>

                            <label class="payment-method-box">
                                <div class="payment-box-left">
                                    <input type="radio" name="payOption" value="Card" />
                                    <div>
                                        <div class="payment-name">Credit / Debit Card / NetBanking</div>
                                        <span class="payment-sub">Visa, MasterCard, RuPay & All Indian Banks</span>
                                    </div>
                                </div>
                                <i class="zmdi zmdi-card-giftcard fs-24 cl1"></i>
                            </label>
                        </div>

                        <div class="coza-trust-seal">
                            <i class="zmdi zmdi-shield-security fs-20"></i>
                            <span>🔒 100% Secure & Encrypted Payment Processing</span>
                        </div>
                    </div>

                </div>

                <!-- Right Column: Order Items Summary & Total -->
                <div class="col-lg-5 m-b-30">
                    <div class="coza-card" style="position: sticky; top: 90px;">
                        <div class="coza-card-header">
                            <i class="zmdi zmdi-shopping-cart"></i>
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
                                    <asp:BoundField DataField="SubTotal" HeaderText="SubTotal (₹)" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <!-- Price Summary Breakdown -->
                        <div class="coza-summary-box">
                            <div class="coza-summary-row">
                                <span>Shipping Charge</span>
                                <span class="text-success font-weight-bold">FREE</span>
                            </div>
                            <div class="coza-summary-row">
                                <span>Estimated GST</span>
                                <span>Inclusive</span>
                            </div>
                            <div class="coza-summary-row total-row">
                                <asp:Label ID="Label5" runat="server" Text="Total Amount Payable"></asp:Label>
                                <span>₹<asp:Label ID="lbltotal" runat="server" Text="0.00" CssClass="rupee-total-amount"></asp:Label></span>
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
</asp:Content>
