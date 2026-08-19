<%@ Page Title="My Orders - Coza Store" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ViewOrders.aspx.cs" Inherits="Ecom_Project.User.ViewOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap');

        /* Modern Page Container */
        .order-page-root {
            background-color: #f9fafb;
            padding: 48px 0 96px 0;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, sans-serif;
            color: #101828;
            min-height: 85vh;
        }

        .order-page-container {
            max-width: 960px;
            margin: 0 auto;
            padding: 0 16px;
        }

        /* Reset ASP.NET DataList default table structure */
        .dl-reset-table,
        .dl-reset-table table,
        .dl-reset-table tbody,
        .dl-reset-table tr,
        .dl-reset-table td {
            display: block !important;
            width: 100% !important;
            border: none !important;
            padding: 0 !important;
            margin: 0 !important;
            background: transparent !important;
        }

        /* Title Area */
        .order-header-area {
            margin-bottom: 32px;
        }

        .order-header-title {
            font-size: 30px;
            font-weight: 800;
            color: #101828;
            letter-spacing: -0.02em;
            margin-bottom: 6px;
        }

        .order-header-sub {
            font-size: 15px;
            color: #475467;
            margin: 0;
        }

        /* Order Card */
        .order-card-root {
            background: #ffffff;
            border: 1px solid #eaecf0;
            border-radius: 16px;
            box-shadow: 0 1px 3px rgba(16, 24, 40, 0.04), 0 1px 2px rgba(16, 24, 40, 0.02);
            margin-bottom: 24px;
            overflow: hidden;
            transition: all 0.2s ease-in-out;
        }

        .order-card-root:hover {
            border-color: #d0d5dd;
            box-shadow: 0 4px 16px rgba(16, 24, 40, 0.08);
        }

        /* Card Header Bar */
        .order-card-header {
            background: #fcfcfd;
            padding: 20px 24px;
            border-bottom: 1px solid #eaecf0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 16px;
        }

        .order-meta-group {
            display: flex;
            align-items: center;
            gap: 32px;
            flex-wrap: wrap;
        }

        .meta-unit {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .meta-unit-label {
            font-size: 12px;
            font-weight: 600;
            color: #475467;
            text-transform: uppercase;
            letter-spacing: 0.04em;
        }

        .meta-unit-val {
            font-size: 14px;
            font-weight: 700;
            color: #101828;
        }

        .meta-unit-val.val-id {
            font-family: monospace;
            font-size: 15px;
            color: #717fe0;
            font-weight: 800;
        }

        .meta-unit-val.val-price {
            font-size: 16px;
            font-weight: 800;
            color: #101828;
        }

        .order-card-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        /* Minimalist Buttons */
        .btn-modern-secondary {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 8px 16px;
            font-size: 13px;
            font-weight: 600;
            color: #344054;
            background: #ffffff;
            border: 1px solid #d0d5dd;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.15s ease;
            text-decoration: none !important;
            height: 38px;
            line-height: 1;
            box-shadow: 0 1px 2px rgba(16, 24, 40, 0.05);
        }

        .btn-modern-secondary:hover {
            background: #f9fafb;
            color: #182230;
            border-color: #98a2b3;
        }

        .btn-modern-primary {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 8px 18px;
            font-size: 13px;
            font-weight: 600;
            color: #ffffff;
            background: #717fe0;
            border: 1px solid #717fe0;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.15s ease;
            text-decoration: none !important;
            height: 38px;
            line-height: 1;
            box-shadow: 0 1px 2px rgba(16, 24, 40, 0.05);
        }

        .btn-modern-primary:hover {
            background: #5b69c7;
            border-color: #5b69c7;
            color: #ffffff;
        }

        /* Items Section */
        .order-card-body {
            padding: 0 24px;
        }

        .item-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 0;
            border-bottom: 1px solid #f2f4f7;
            gap: 16px;
        }

        .item-row:last-child {
            border-bottom: none;
        }

        .item-left-block {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .item-img {
            width: 72px;
            height: 72px;
            object-fit: cover;
            border-radius: 10px;
            border: 1px solid #eaecf0;
            background: #f9fafb;
            flex-shrink: 0;
        }

        .item-details {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .item-title {
            font-size: 15px;
            font-weight: 600;
            color: #101828;
            line-height: 1.3;
        }

        .item-qty-tag {
            font-size: 13px;
            font-weight: 500;
            color: #475467;
        }

        /* Empty State */
        .empty-state-root {
            background: #ffffff;
            border: 1px solid #eaecf0;
            border-radius: 16px;
            padding: 64px 24px;
            text-align: center;
            max-width: 500px;
            margin: 48px auto;
            box-shadow: 0 1px 3px rgba(16, 24, 40, 0.04);
        }

        .empty-icon-wrap {
            width: 64px;
            height: 64px;
            border-radius: 50%;
            background: #f2f4f7;
            color: #475467;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin: 0 auto 16px auto;
        }

        .empty-title {
            font-size: 18px;
            font-weight: 700;
            color: #101828;
            margin-bottom: 6px;
        }

        .empty-desc {
            font-size: 14px;
            color: #475467;
            margin-bottom: 24px;
        }

        /* Support Chat Modal */
        .chat-drawer-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(16, 24, 40, 0.45);
            backdrop-filter: blur(4px);
            z-index: 99999;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .chat-drawer-card {
            background: #ffffff;
            width: 100%;
            max-width: 500px;
            height: 580px;
            max-height: 90vh;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(16, 24, 40, 0.2);
            display: flex;
            flex-direction: column;
            overflow: hidden;
            animation: chatFadeUp 0.25s cubic-bezier(0.16, 1, 0.3, 1);
        }

        @keyframes chatFadeUp {
            from {
                opacity: 0;
                transform: translateY(16px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .chat-drawer-header {
            padding: 18px 24px;
            border-bottom: 1px solid #eaecf0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #ffffff;
        }

        .chat-header-title {
            font-size: 16px;
            font-weight: 700;
            color: #101828;
            margin: 0 0 2px 0;
        }

        .chat-header-sub {
            font-size: 13px;
            color: #475467;
            margin: 0;
            display: block;
        }

        .chat-drawer-close {
            background: #fee2e2;
            color: #ef4444;
            border: 1px solid #fca5a5;
            font-size: 12px;
            font-weight: 600;
            padding: 5px 12px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.15s ease;
        }

        .chat-drawer-close:hover {
            background: #ef4444;
            color: #ffffff;
        }

        .chat-drawer-body {
            flex: 1;
            padding: 20px;
            background: #f9fafb;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .chat-msg-row {
            display: flex;
            width: 100%;
            margin-bottom: 10px;
        }

        .chat-msg-right {
            justify-content: flex-end;
        }

        .chat-msg-left {
            justify-content: flex-start;
        }

        .chat-bubble {
            max-width: 82%;
            padding: 12px 16px;
            border-radius: 14px;
            font-size: 14px;
            line-height: 1.45;
            word-wrap: break-word;
        }

        .bubble-user {
            background: #717fe0;
            color: #ffffff;
            border-bottom-right-radius: 2px;
            box-shadow: 0 2px 8px rgba(113, 127, 224, 0.2);
        }

        .bubble-admin {
            background: #ffffff;
            color: #101828;
            border: 1px solid #eaecf0;
            border-bottom-left-radius: 2px;
            box-shadow: 0 1px 3px rgba(16, 24, 40, 0.04);
        }

        .chat-drawer-footer {
            padding: 16px 20px;
            background: #ffffff;
            border-top: 1px solid #eaecf0;
        }

        .chat-input-wrap {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .chat-input-field {
            flex: 1;
            height: 42px;
            background: #ffffff;
            border: 1px solid #d0d5dd;
            border-radius: 10px;
            padding: 0 14px;
            font-size: 14px;
            color: #101828;
            outline: none;
        }

        .chat-input-field:focus {
            border-color: #717fe0;
            box-shadow: 0 0 0 3px rgba(113, 127, 224, 0.12);
        }

        .btn-chat-submit {
            height: 42px;
            padding: 0 18px;
            background: #717fe0;
            color: #ffffff;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            font-size: 13px;
            cursor: pointer;
            transition: background 0.15s ease;
        }

        .btn-chat-submit:hover {
            background: #5b69c7;
        }

        .chat-validation-msg {
            font-size: 12px;
            font-weight: 600;
            color: #ef4444 !important;
            margin-top: 6px;
            display: block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="order-page-root">
                <div class="container order-page-container">

                    <!-- Header -->
                    <div class="order-header-area">
                        <h1 class="order-header-title">Order History</h1>
                        <p class="order-header-sub">Check the status of recent orders, view invoices, and contact support.</p>
                    </div>

                    <!-- Orders DataList -->
                    <asp:DataList ID="DL_outer" runat="server" OnItemDataBound="DL_outer_ItemDataBound" RepeatLayout="Flow" CssClass="dl-reset-table">
                        <ItemTemplate>
                            <div class="order-card-root">

                                <!-- Order Header -->
                                <div class="order-card-header">
                                    <div class="order-meta-group">
                                        <div class="meta-unit">
                                            <span class="meta-unit-label">Order</span>
                                            <span class="meta-unit-val val-id">#<asp:Label ID="lbl_order_group_id" runat="server" Text='<%# Eval("OrderGroupID") %>'></asp:Label></span>
                                        </div>

                                        <div class="meta-unit">
                                            <span class="meta-unit-label">Date Placed</span>
                                            <span class="meta-unit-val">
                                                <asp:Label ID="lbl_order_date" runat="server" Text='<%# Eval("Order_Date", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                            </span>
                                        </div>

                                        <div class="meta-unit">
                                            <span class="meta-unit-label">Total Amount</span>
                                            <span class="meta-unit-val val-price">
                                                &#8377;<asp:Label ID="lbl_total_amount" runat="server" Text='<%# Eval("SubTotal") %>'></asp:Label>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="order-card-actions">
                                        <asp:Button ID="btn_viewBill"
                                            runat="server"
                                            Text="View Invoice"
                                            CommandArgument='<%# Eval("OrderGroupID") %>'
                                            OnClick="btn_viewBill_Click"
                                            CssClass="btn-modern-secondary" />

                                        <asp:Button ID="btn_feedback" 
                                            runat="server" 
                                            Text="Support" 
                                            CommandArgument='<%# Eval("OrderGroupID") %>'
                                            OnClick="btn_feedback_Click" 
                                            CssClass="btn-modern-primary" />
                                    </div>
                                </div>

                                <!-- Items List -->
                                <div class="order-card-body">
                                    <asp:DataList ID="DL_inner" runat="server" RepeatLayout="Flow" CssClass="dl-reset-table">
                                        <ItemTemplate>
                                            <div class="item-row">
                                                <div class="item-left-block">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Product_image") %>' CssClass="item-img" />
                                                    <div class="item-details">
                                                        <span class="item-title">
                                                            <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("Product_name") %>'></asp:Label>
                                                        </span>
                                                        <span class="item-qty-tag">
                                                            Quantity: <asp:Label ID="lbl_quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
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

                    <!-- Empty State -->
                    <asp:Panel ID="pnl_empty_state" runat="server">
                        <asp:Label ID="lbl_msg" runat="server" Visible="False">
                            <div class="empty-state-root">
                                <div class="empty-icon-wrap">
                                    <i class="fa fa-shopping-bag"></i>
                                </div>
                                <h3 class="empty-title">No orders yet</h3>
                                <p class="empty-desc">When you place orders, they will appear here.</p>
                                <a href="uindex.aspx" class="btn-modern-primary">
                                    Browse Shop
                                </a>
                            </div>
                        </asp:Label>
                    </asp:Panel>

                </div>
            </div>

            <!-- Support / Live Chat Modal -->
            <asp:Panel ID="Panel1" runat="server" CssClass="chat-drawer-overlay" Visible="False">
                <div class="chat-drawer-card">
                    <!-- Drawer Header -->
                    <div class="chat-drawer-header">
                        <div>
                            <h5 class="chat-header-title">Order Support</h5>
                            <asp:Label ID="lbl_welcome" runat="server" CssClass="chat-header-sub"></asp:Label>
                        </div>
                        <asp:Button ID="btn_close" runat="server" OnClick="btn_close_click" Text="Close" CssClass="chat-drawer-close" />
                    </div>

                    <!-- Chat Body Stream -->
                    <div class="chat-drawer-body" id="chatStreamBody">
                        <asp:DataList ID="DL_chat" runat="server" RepeatLayout="Flow" CssClass="dl-reset-table">
                            <ItemTemplate>
                                <!-- User Message -->
                                <%# !string.IsNullOrEmpty(Convert.ToString(Eval("Feedback_message"))) ? @"
                                <div class='chat-msg-row chat-msg-right'>
                                    <div class='chat-bubble bubble-user'>" + Eval("Feedback_message") + @"</div>
                                </div>" : "" %>

                                <!-- Admin Reply Message -->
                                <%# !string.IsNullOrEmpty(Convert.ToString(Eval("Feedback_reply"))) ? @"
                                <div class='chat-msg-row chat-msg-left'>
                                    <div class='chat-bubble bubble-admin'>" + Eval("Feedback_reply") + @"</div>
                                </div>" : "" %>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>

                    <!-- Chat Footer -->
                    <div class="chat-drawer-footer">
                        <div class="chat-input-wrap">
                            <asp:TextBox ID="tb_msg" runat="server" CssClass="chat-input-field" placeholder="Write a message..." ValidationGroup="ChatValidation"></asp:TextBox>
                            <asp:Button ID="btn_send" runat="server" OnClick="btn_send_Click" Text="Send" CssClass="btn-chat-submit" ValidationGroup="ChatValidation" UseSubmitBehavior="false" />
                        </div>
                        <asp:RequiredFieldValidator ID="rfv_msg" runat="server" ControlToValidate="tb_msg" ValidationGroup="ChatValidation" ErrorMessage="Please enter a message before sending." Display="Dynamic" CssClass="chat-validation-msg" ForeColor="#EF4444"></asp:RequiredFieldValidator>
                        <asp:HiddenField ID="hf_ordergroupid" runat="server" />
                    </div>
                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function scrollToChatBottom() {
            var chatBody = document.getElementById("chatStreamBody");
            if (chatBody) {
                chatBody.scrollTop = chatBody.scrollHeight;
            }
        }

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm) {
            prm.add_endRequest(function () {
                scrollToChatBottom();
            });
        }
    </script>
</asp:Content>
