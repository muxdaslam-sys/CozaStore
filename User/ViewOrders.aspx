<%@ Page Title="My Orders - Coza Store" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ViewOrders.aspx.cs" Inherits="Ecom_Project.User.ViewOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap');

        /* Base Page Setup */
        .orders-page-section {
            background-color: #f1f5f9;
            padding: 50px 0 100px 0;
            font-family: 'Plus Jakarta Sans', 'Poppins', sans-serif;
            color: #0f172a;
            min-height: 80vh;
        }

        .orders-container {
            max-width: 1040px;
            margin: 0 auto;
        }

        /* Order Card Component */
        .ecom-order-card {
            background: #ffffff;
            border-radius: 20px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 20px rgba(15, 23, 42, 0.04);
            margin-bottom: 30px;
            overflow: hidden;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .ecom-order-card:hover {
            box-shadow: 0 12px 35px rgba(15, 23, 42, 0.09);
            border-color: #cbd5e1;
            transform: translateY(-2px);
        }

        /* Card Top Header */
        .ecom-card-header {
            background: #ffffff;
            padding: 22px 28px;
            border-bottom: 1px solid #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 18px;
        }

        .ecom-header-left {
            display: flex;
            align-items: center;
            gap: 24px;
            flex-wrap: wrap;
        }

        .meta-group {
            display: flex;
            flex-direction: column;
            gap: 3px;
        }

        .meta-label {
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            color: #94a3b8;
            line-height: 1;
        }

        .meta-value-text {
            font-size: 14px;
            font-weight: 700;
            color: #0f172a;
        }

        .order-id-tag {
            background: #0f172a;
            color: #ffffff;
            font-size: 13px;
            font-weight: 800;
            padding: 6px 16px;
            border-radius: 30px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 12px rgba(15, 23, 42, 0.15);
        }

        .order-id-tag .id-highlight {
            color: #38bdf8;
        }

        .status-badge-paid {
            background: #f0fdf4;
            color: #16a34a;
            font-size: 12.5px;
            font-weight: 700;
            padding: 5px 14px;
            border-radius: 20px;
            border: 1px solid #bbf7d0;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .status-dot {
            width: 7px;
            height: 7px;
            border-radius: 50%;
            background: #16a34a;
            box-shadow: 0 0 0 3px rgba(22, 163, 74, 0.2);
        }

        /* Card Action Buttons */
        .ecom-header-right {
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .btn-invoice-style {
            background: linear-gradient(135deg, #717fe0 0%, #5a67d8 100%);
            color: #ffffff !important;
            font-size: 13.5px;
            font-weight: 700;
            padding: 11px 22px;
            border-radius: 12px;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 4px 14px rgba(113, 127, 224, 0.32);
            transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
            text-decoration: none;
        }

        .btn-invoice-style:hover {
            background: linear-gradient(135deg, #5a67d8 0%, #4338ca 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(113, 127, 224, 0.48);
        }

        .btn-chat-style {
            background: #ffffff;
            color: #334155 !important;
            font-size: 13.5px;
            font-weight: 700;
            padding: 10px 20px;
            border-radius: 12px;
            border: 1.5px solid #cbd5e1;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .btn-chat-style:hover {
            background: #f8fafc;
            border-color: #717fe0;
            color: #717fe0 !important;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(15, 23, 42, 0.08);
        }

        /* Products Body List */
        .ecom-card-body {
            padding: 24px 28px;
            background: #ffffff;
        }

        .ecom-product-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 20px;
            background: #f8fafc;
            border-radius: 16px;
            border: 1px solid #e2e8f0;
            margin-bottom: 14px;
            transition: all 0.2s ease;
        }

        .ecom-product-item:last-child {
            margin-bottom: 0;
        }

        .ecom-product-item:hover {
            border-color: #cbd5e1;
            background: #ffffff;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
        }

        .product-media-wrap {
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .product-img-box {
            width: 72px;
            height: 72px;
            border-radius: 16px;
            object-fit: cover;
            border: 1px solid #e2e8f0;
            background: #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.04);
        }

        .product-details-wrap {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .product-name-heading {
            font-size: 15.5px;
            font-weight: 700;
            color: #0f172a;
            line-height: 1.3;
        }

        .product-qty-badge {
            font-size: 12.5px;
            font-weight: 600;
            color: #64748b;
            background: #ffffff;
            padding: 4px 12px;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            display: inline-block;
            width: fit-content;
        }

        /* Empty State */
        .empty-state-card {
            background: #ffffff;
            border-radius: 24px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 10px 35px rgba(15, 23, 42, 0.04);
            padding: 70px 30px;
            text-align: center;
            max-width: 520px;
            margin: 30px auto 0 auto;
        }

        .empty-icon-orb {
            width: 95px;
            height: 95px;
            background: linear-gradient(135deg, #e0e7ff 0%, #eef2ff 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 24px auto;
            color: #717fe0;
            font-size: 40px;
            box-shadow: 0 10px 25px rgba(99, 102, 241, 0.18);
        }

        .empty-state-heading {
            font-size: 24px;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 8px;
        }

        .empty-state-sub {
            font-size: 14.5px;
            color: #64748b !important;
            display: block;
            margin-bottom: 30px;
        }

        .btn-explore-catalog {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: linear-gradient(135deg, #717fe0 0%, #5a67d8 100%);
            color: #ffffff !important;
            font-weight: 700;
            font-size: 14.5px;
            padding: 14px 34px;
            border-radius: 14px;
            text-decoration: none !important;
            box-shadow: 0 8px 22px rgba(99, 102, 241, 0.35);
            transition: all 0.25s ease;
        }

        .dl-reset-table {
            width: 100%;
            border-collapse: collapse;
        }

        .dl-reset-table > tbody > tr > td {
            padding: 0;
            border: none;
            display: block;
            width: 100%;
        }

        /* NEW MODERN FLOATING CHAT WIDGET WITH PROPER CLOSE BUTTON */
        .chat-overlay-modal {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 99999;
        }

        .chat-window-card {
            width: 410px;
            height: 550px;
            max-height: 82vh;
            background: #ffffff;
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(15, 23, 42, 0.25);
            border: 1px solid #e2e8f0;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            animation: chatSlideUp 0.35s cubic-bezier(0.16, 1, 0.3, 1);
        }

        @keyframes chatSlideUp {
            from { opacity: 0; transform: translateY(40px) scale(0.95); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        /* Chat Header with Clear Close Button */
        .chat-header-bar {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            padding: 18px 22px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            color: #ffffff;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
        }

        .header-profile-flex {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .header-avatar-badge {
            width: 44px;
            height: 44px;
            border-radius: 14px;
            background: linear-gradient(135deg, #717fe0 0%, #5a67d8 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            font-size: 20px;
            box-shadow: 0 4px 14px rgba(113, 127, 224, 0.4);
            position: relative;
        }

        .online-dot-indicator {
            position: absolute;
            bottom: -2px;
            right: -2px;
            width: 12px;
            height: 12px;
            background: #22c55e;
            border: 2px solid #0f172a;
            border-radius: 50%;
        }

        .header-text-group {
            display: flex;
            flex-direction: column;
        }

        .chat-support-heading {
            font-size: 16px;
            font-weight: 800;
            color: #ffffff;
            margin: 0;
            line-height: 1.2;
        }

        .chat-welcome-sub {
            font-size: 12px;
            color: #94a3b8;
            display: block;
            margin-top: 2px;
        }

        /* STYLISH CLOSE BUTTON WITH EXPLICIT TEXT */
        .chat-close-text-btn {
            background: rgba(255, 255, 255, 0.15) !important;
            color: #ffffff !important;
            border: 1px solid rgba(255, 255, 255, 0.25) !important;
            border-radius: 20px !important;
            padding: 7px 18px !important;
            font-size: 12.5px !important;
            font-weight: 700 !important;
            font-family: 'Plus Jakarta Sans', 'Poppins', sans-serif !important;
            cursor: pointer !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            transition: all 0.25s ease !important;
            outline: none !important;
            line-height: 1 !important;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15) !important;
            letter-spacing: 0.3px !important;
        }

        .chat-close-text-btn:hover {
            background: #ef4444 !important;
            border-color: #ef4444 !important;
            color: #ffffff !important;
            transform: translateY(-1px) scale(1.03) !important;
            box-shadow: 0 4px 14px rgba(239, 68, 68, 0.4) !important;
        }

        /* Chat Body Messages */
        .chat-stream-body {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            background: #f8fafc;
            display: flex;
            flex-direction: column;
        }

        .chat-message-item {
            margin-bottom: 16px;
        }

        .bubble-flex-row {
            display: flex;
            width: 100%;
            margin-bottom: 8px;
        }

        .flex-user-right {
            justify-content: flex-end;
        }

        .flex-admin-left {
            justify-content: flex-start;
        }

        .chat-message-bubble {
            max-width: 82%;
            padding: 12px 17px;
            border-radius: 18px;
            font-size: 14px;
            line-height: 1.45;
            box-shadow: 0 2px 10px rgba(15, 23, 42, 0.04);
        }

        .bubble-user-gradient {
            background: linear-gradient(135deg, #717fe0 0%, #5a67d8 100%);
            color: #ffffff;
            border-bottom-right-radius: 4px;
        }

        .bubble-admin-card {
            background: #ffffff;
            color: #0f172a;
            border: 1px solid #e2e8f0;
            border-bottom-left-radius: 4px;
        }

        .bubble-sender-title {
            font-size: 10px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            margin-bottom: 4px;
            opacity: 0.85;
        }

        /* Chat Footer & Input */
        .chat-footer-bar {
            padding: 16px 20px;
            background: #ffffff;
            border-top: 1px solid #e2e8f0;
        }

        .input-pill-container {
            display: flex;
            align-items: center;
            gap: 10px;
            background: #f1f5f9;
            border-radius: 30px;
            padding: 5px 6px 5px 18px;
            border: 1.5px solid #e2e8f0;
            transition: all 0.2s ease;
        }

        .input-pill-container:focus-within {
            border-color: #717fe0;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(113, 127, 224, 0.15);
        }

        .chat-text-box {
            border: none !important;
            background: transparent !important;
            flex: 1;
            font-size: 14px;
            outline: none !important;
            color: #0f172a;
            box-shadow: none !important;
        }

        .btn-send-message {
            background: linear-gradient(135deg, #717fe0 0%, #5a67d8 100%);
            color: #ffffff !important;
            border: none;
            border-radius: 20px;
            padding: 10px 22px;
            font-size: 13.5px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 4px 12px rgba(113, 127, 224, 0.35);
        }

        .btn-send-message:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 16px rgba(113, 127, 224, 0.5);
            background: linear-gradient(135deg, #5a67d8 0%, #4338ca 100%);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <!-- Hero Banner -->
            <section class="bg-img1 txt-center p-lr-15 p-tb-70" style="background-image: url('../images/bg-02.jpg');">
                <h2 class="ltext-105 cl0 txt-center font-weight-bold">
                    My Orders
                </h2>
            </section>

            <!-- Main Orders Content -->
            <div class="orders-page-section">
                <div class="container orders-container">

                    <!-- Outer DataList for Order Cards -->
                    <asp:DataList ID="DL_outer" runat="server" OnItemDataBound="DL_outer_ItemDataBound" CssClass="dl-reset-table">
                        <ItemTemplate>
                            <div class="ecom-order-card">

                                <!-- Order Card Header Bar -->
                                <div class="ecom-card-header">
                                    <div class="ecom-header-left">
                                        <div class="order-id-tag">
                                            <span>ORDER</span>
                                            <span class="id-highlight">#<asp:Label ID="lbl_order_group_id" runat="server" Text='<%# Eval("OrderGroupID") %>'></asp:Label></span>
                                        </div>

                                        <div class="meta-group">
                                            <span class="meta-label">Date Placed</span>
                                            <span class="meta-value-text">
                                                <i class="fa fa-calendar-o text-primary mr-1"></i>
                                                <asp:Label ID="lbl_order_date" runat="server" Text='<%# Eval("Order_Date", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                            </span>
                                        </div>

                                        <div class="meta-group">
                                            <span class="meta-label">Total Amount</span>
                                            <span class="meta-value-text">
                                                &#8377;<asp:Label ID="lbl_total_amount" runat="server" Text='<%# Eval("SubTotal") %>'></asp:Label>
                                            </span>
                                        </div>

                                        <div class="status-badge-paid">
                                            <span class="status-dot"></span>Paid
                                        </div>
                                    </div>

                                    <div class="ecom-header-right">
                                        <asp:Button ID="btn_viewBill"
                                            runat="server"
                                            OnClick="btn_viewBill_Click"
                                            Text="View Invoice"
                                            CssClass="btn-invoice-style"
                                            CommandArgument='<%# Eval("OrderGroupID") %>' />

                                        <asp:Button ID="btn_feedback" 
                                            runat="server" 
                                            OnClick="btn_feedback_Click" 
                                            CommandArgument='<%# Eval("OrderGroupID") %>' 
                                            Text="Feedback / Chat" 
                                            CssClass="btn-chat-style" />
                                    </div>
                                </div>

                                <!-- Order Card Body (Products) -->
                                <div class="ecom-card-body">
                                    <asp:DataList ID="DL_inner" runat="server" CssClass="dl-reset-table">
                                        <ItemTemplate>
                                            <div class="ecom-product-item">
                                                <div class="product-media-wrap">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Product_image") %>' CssClass="product-img-box" />
                                                    <div class="product-details-wrap">
                                                        <span class="product-name-heading">
                                                            <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("Product_name") %>'></asp:Label>
                                                        </span>
                                                        <span class="product-qty-badge">Quantity:
                                                            <asp:Label ID="lbl_quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                    <!-- Empty State Container when no orders exist -->
                    <div id="empty-state-wrapper">
                        <asp:Label ID="lbl_msg" runat="server" Visible="False"></asp:Label>
                    </div>

                    <!-- FLOATING LIVE CHAT WIDGET WITH EXPLICIT TEXT CLOSE BUTTON -->
                    <asp:Panel ID="Panel1" runat="server" CssClass="chat-overlay-modal" Visible="False">
                        <div class="chat-window-card">
                            
                            <!-- Chat Header Bar -->
                            <div class="chat-header-bar">
                                <div class="header-profile-flex">
                                    <div class="header-avatar-badge">
                                        <i class="fa fa-comments"></i>
                                        <span class="online-dot-indicator"></span>
                                    </div>
                                    <div class="header-text-group">
                                        <h5 class="chat-support-heading">Order Support</h5>
                                        <span class="chat-welcome-sub">
                                            <asp:Label ID="lbl_welcome" runat="server"></asp:Label>
                                        </span>
                                    </div>
                                </div>
                                
                                <!-- STYLISH CLOSE BUTTON WITH EXPLICIT TEXT -->
                                <asp:Button ID="btn_close" runat="server" OnClick="btn_close_click" Text="Close Chat" CssClass="chat-close-text-btn" />
                            </div>

                            <!-- Chat Messages Stream Body -->
                            <div class="chat-stream-body">
                                <asp:DataList ID="DL_chat" runat="server" CssClass="dl-reset-table w-100">
                                    <ItemTemplate>
                                        <div class="chat-message-item">
                                            <!-- User Message -->
                                            <div class="bubble-flex-row flex-user-right">
                                                <div class="chat-message-bubble bubble-user-gradient">
                                                    <div class="bubble-sender-title">
                                                        <asp:Label ID="lbl_you" runat="server">You</asp:Label>
                                                    </div>
                                                    <div>
                                                        <asp:Label ID="lbl_user" runat="server" Text='<%# Eval("Feedback_message") %>'></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Admin Reply -->
                                            <div class="bubble-flex-row flex-admin-left">
                                                <div class="chat-message-bubble bubble-admin-card">
                                                    <div class="bubble-sender-title">
                                                        <asp:Label ID="lbl_you0" runat="server">Admin Support</asp:Label>
                                                    </div>
                                                    <div>
                                                        <asp:Label ID="lbl_admin" runat="server"
                                                            Text='<%# string.IsNullOrEmpty(Convert.ToString(Eval("Feedback_reply"))) ? "We will reply soon." : Convert.ToString(Eval("Feedback_reply")) %>'>
                                                        </asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>

                            <!-- Chat Input Footer Bar -->
                            <div class="chat-footer-bar">
                                <div class="input-pill-container">
                                    <asp:TextBox ID="tb_msg" runat="server" CssClass="chat-text-box" placeholder="Type your message here..."></asp:TextBox>
                                    <asp:Button ID="btn_send" runat="server" OnClick="btn_send_Click" Text="Send" CssClass="btn-send-message" />
                                </div>
                                <asp:HiddenField ID="hf_ordergroupid" runat="server" />
                            </div>

                        </div>
                    </asp:Panel>

                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Script to render empty state layout if lbl_msg is visible -->
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            var msgLabel = document.getElementById("<%= lbl_msg.ClientID %>");
            if (msgLabel && msgLabel.innerText.trim() !== "") {
                var container = document.getElementById("empty-state-wrapper");
                if (container) {
                    var msgText = msgLabel.innerText;
                    container.innerHTML = `
                        <div class="empty-state-card">
                            <div class="empty-icon-orb">
                                <i class="fa fa-shopping-bag"></i>
                            </div>
                            <h3 class="empty-state-heading">No Orders Yet</h3>
                            <p class="empty-state-sub">${msgText}</p>
                            <a href="Product.aspx" class="btn-explore-catalog">
                                <i class="fa fa-shopping-cart"></i> Start Shopping
                            </a>
                        </div>
                    `;
                }
            }
        });
    </script>
</asp:Content>
