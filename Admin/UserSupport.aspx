<%@ Page Title="User Support & Feedback - CozaStore Admin" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserSupport.aspx.cs" Inherits="Ecom_Project.Admin.UserSupport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Header Layout */
        .us-header-wrap {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 20px;
        }
        .us-header-wrap h1 {
            font-size: 22px;
            font-weight: 800;
            color: var(--text-primary, #1e293b);
            margin: 0;
        }
        .us-stats-pills {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .us-stat-pill {
            background: #ffffff;
            border: 1px solid var(--border, #e2e8f0);
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12.5px;
            font-weight: 600;
            color: var(--text-secondary, #64748b);
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.04);
        }

        /* Table Styling */
        .table-compact-container {
            width: 100%;
            overflow-x: auto;
            display: block;
        }
        .table-compact-fit {
            width: 100% !important;
            border-collapse: collapse;
        }
        .table-compact-fit th,
        .table-compact-fit td {
            padding: 12px 16px !important;
            vertical-align: middle;
            font-size: 13px;
        }
        .table-compact-fit th {
            background: #f8fafc;
            color: var(--text-secondary, #64748b);
            font-weight: 700;
            font-size: 11.5px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid var(--border, #e2e8f0);
        }
        .table-compact-fit tr {
            border-bottom: 1px solid var(--border, #e2e8f0);
            transition: background 0.15s ease;
        }
        .table-compact-fit tr:hover {
            background: #f8fafc;
        }

        /* Buttons */
        .btn-reply-action {
            background: linear-gradient(135deg, #4f46e5, #6366f1);
            color: #ffffff;
            border: none;
            padding: 6px 14px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 2px 6px rgba(79, 70, 229, 0.25);
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .btn-reply-action:hover {
            background: linear-gradient(135deg, #4338ca, #4f46e5);
            transform: translateY(-1px);
            box-shadow: 0 4px 10px rgba(79, 70, 229, 0.35);
        }
        .btn-mail-action {
            background: #f1f5f9;
            color: #475569;
            border: 1px solid #cbd5e1;
            padding: 6px 12px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.15s ease;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .btn-mail-action:hover {
            background: #e2e8f0;
            color: #1e293b;
        }

        /* Side Cards (Chat & Email) */
        .side-panel-card {
            background: #ffffff;
            border-radius: 12px;
            border: 1px solid var(--border, #e2e8f0);
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            display: flex;
            flex-direction: column;
            width: 440px;
            max-width: 100%;
            overflow: hidden;
            margin-bottom: 20px;
        }
        .panel-card-header {
            padding: 14px 18px;
            background: #f8fafc;
            border-bottom: 1px solid var(--border, #e2e8f0);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .panel-card-header .panel-title {
            font-weight: 700;
            font-size: 14px;
            color: var(--text-primary, #1e293b);
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .btn-close-panel {
            background: #fee2e2;
            color: #ef4444;
            border: 1px solid #fca5a5;
            padding: 4px 10px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.15s ease;
        }
        .btn-close-panel:hover {
            background: #ef4444;
            color: #ffffff;
        }

        /* Chat Body & Messages */
        .chat-body-scroll {
            height: 280px;
            padding: 16px;
            overflow-y: auto;
            background: #fafafa;
        }
        .chat-datalist {
            width: 100%;
        }
        .chat-thread-item {
            margin-bottom: 16px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        
        /* Message Bubbles */
        .msg-row-user {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            max-width: 85%;
        }
        .msg-avatar-user {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: linear-gradient(135deg, #0284c7, #38bdf8);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 700;
            flex-shrink: 0;
        }
        .msg-bubble-user {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            border-top-left-radius: 2px;
            padding: 10px 14px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.03);
        }
        .msg-user-name {
            font-size: 11px;
            font-weight: 700;
            color: #0284c7;
            margin-bottom: 4px;
            display: block;
        }
        .msg-user-text {
            font-size: 13px;
            color: #334155;
            line-height: 1.4;
        }

        .msg-row-admin {
            display: flex;
            align-items: flex-start;
            justify-content: flex-end;
            gap: 10px;
            max-width: 85%;
            margin-left: auto;
        }
        .msg-avatar-admin {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: linear-gradient(135deg, #16a34a, #22c55e);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 700;
            flex-shrink: 0;
        }
        .msg-bubble-admin {
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
            border-radius: 12px;
            border-top-right-radius: 2px;
            padding: 10px 14px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.03);
        }
        .msg-admin-name {
            font-size: 11px;
            font-weight: 700;
            color: #16a34a;
            margin-bottom: 4px;
            display: block;
            text-align: right;
        }
        .msg-admin-text {
            font-size: 13px;
            color: #14532d;
            line-height: 1.4;
        }

        /* Chat Input Footer */
        .chat-footer {
            padding: 14px 16px;
            background: #ffffff;
            border-top: 1px solid var(--border, #e2e8f0);
        }
        .chat-input-row {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .chat-input-field {
            flex: 1;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            padding: 9px 14px;
            font-size: 13px;
            outline: none;
            transition: border-color 0.15s ease;
        }
        .chat-input-field:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }
        .btn-send-chat {
            background: linear-gradient(135deg, #16a34a, #22c55e);
            color: #ffffff;
            border: none;
            padding: 9px 18px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.15s ease;
            box-shadow: 0 2px 6px rgba(22, 163, 74, 0.25);
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .btn-send-chat:hover {
            background: linear-gradient(135deg, #15803d, #16a34a);
            transform: translateY(-1px);
        }

        /* Email Panel Form Styling */
        .email-body {
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 14px;
            background: #ffffff;
        }
        .form-group-custom {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }
        .form-label-custom {
            font-size: 12px;
            font-weight: 700;
            color: #475569;
            text-transform: uppercase;
            letter-spacing: 0.03em;
        }
        .form-control-custom {
            width: 100%;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            padding: 9px 14px;
            font-size: 13px;
            color: #1e293b;
            outline: none;
            transition: all 0.15s ease;
        }
        .form-control-custom:focus {
            border-color: #0284c7;
            box-shadow: 0 0 0 3px rgba(2, 132, 199, 0.12);
        }
        .btn-send-email {
            background: linear-gradient(135deg, #0284c7, #2563eb);
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.15s ease;
            box-shadow: 0 2px 6px rgba(2, 132, 199, 0.25);
            display: inline-flex;
            align-items: center;
            gap: 6px;
            justify-content: center;
        }
        .btn-send-email:hover {
            background: linear-gradient(135deg, #0369a1, #1d4ed8);
            transform: translateY(-1px);
        }

        /* Validation Messages */
        .val-msg-err {
            font-size: 11.5px;
            font-weight: 600;
            color: #ef4444 !important;
            margin-top: 3px;
            display: block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <!-- Header Section -->
    <div class="us-header-wrap">
        <div>
            <h1>User Support & Live Feedback</h1>
            <div class="breadcrumb-row" style="margin-top:2px;">
                <a href="Admin_HomePage.aspx">Dashboard</a>
                <span class="sep"><i class="fa-solid fa-chevron-right" style="font-size:9px;"></i></span>
                <span class="current">User Support</span>
            </div>
        </div>
        <div class="us-stats-pills">
            <div class="us-stat-pill">
                <i class="fa-solid fa-headset" style="color:var(--primary, #4f46e5);"></i> Live Helpdesk
            </div>
            <div class="us-stat-pill">
                <i class="fa-solid fa-comments" style="color:#16a34a;"></i> Customer Chat
            </div>
        </div>
    </div>

    <!-- Main Content Area -->
    <div style="display: flex; gap: 20px; flex-wrap: wrap; align-items: flex-start;">

        <!-- Left / Main: Support Tickets Table -->
        <div style="flex: 1; min-width: 320px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="card-premium">
                        <div class="card-header-premium" style="padding: 14px 20px;">
                            <div class="ch-title" style="font-size: 14px;">
                                <span class="ch-icon si-green" style="width:30px;height:30px;font-size:13px;"><i class="fa-solid fa-inbox"></i></span>
                                Pending Support Requests
                            </div>
                            <span style="font-size:12px; color:var(--text-muted, #94a3b8);">Customer inquiries awaiting response</span>
                        </div>
                        <div class="card-body-premium" style="padding: 0;">
                            <div class="table-compact-container">
                                <asp:GridView ID="gv_usersSupport" runat="server"
                                    AutoGenerateColumns="False"
                                    CssClass="table-compact-fit"
                                    GridLines="None"
                                    UseAccessibleHeader="True">
                                    <Columns>
                                        
                                        <%-- Customer Name --%>
                                        <asp:TemplateField HeaderText="Customer">
                                            <ItemTemplate>
                                                <div style="display: flex; align-items: center; gap: 10px;">
                                                    <div style="width: 34px; height: 34px; border-radius: 50%; background: linear-gradient(135deg, #4f46e5, #818cf8); color: #ffffff; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 13px; flex-shrink: 0;">
                                                        <%# Eval("User_name") != null && Eval("User_name").ToString().Length > 0 ? Eval("User_name").ToString().Substring(0, 1).ToUpper() : "U" %>
                                                    </div>
                                                    <div>
                                                        <span style="font-weight: 600; color: var(--text-primary, #1e293b); display: block;"><%# Eval("User_name") %></span>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%-- Order / Reference ID --%>
                                        <asp:TemplateField HeaderText="Order Group ID">
                                            <ItemTemplate>
                                                <span style="font-family: monospace; font-weight: 600; background: #f1f5f9; padding: 3px 8px; border-radius: 6px; color: #475569; font-size: 12px;">
                                                    #<%# Eval("Product_id") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%-- Status --%>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <span class="badge-s bs-warning" style="font-size: 10.5px; padding: 4px 10px; border-radius: 12px; display: inline-flex; align-items: center; gap: 4px;">
                                                    <i class="fa-solid fa-clock" style="font-size: 9px;"></i> <%# Eval("Feedback_status") %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%-- Actions --%>
                                        <asp:TemplateField HeaderText="Actions">
                                            <ItemTemplate>
                                                <div style="display: flex; gap: 8px; align-items: center;">
                                                    <asp:Button ID="btn_reply" runat="server" OnClick="btn_reply_Click" Text="Open Chat" CommandArgument='<%# Eval("Product_id") %>' CssClass="btn-reply-action" ToolTip="Open Chat Thread" />
                                                    <asp:Button ID="btn_mail" runat="server" OnClick="btn_mail_Click" Text="Email" CssClass="btn-mail-action" ToolTip="Send Direct Email" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>

                                    <EmptyDataTemplate>
                                        <div style="text-align:center; padding:45px 20px;">
                                            <div style="width:54px;height:54px;background:rgba(22, 163, 74, 0.12);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 14px;border:2px dashed rgba(22, 163, 74, 0.3);">
                                                <i class="fa-solid fa-circle-check" style="font-size:24px; color:#16a34a;"></i>
                                            </div>
                                            <h5 style="font-weight:700; color:var(--text-primary, #1e293b); margin-bottom:6px; font-size: 15px;">All Caught Up!</h5>
                                            <p style="color:var(--text-muted, #94a3b8); font-size:13px; margin:0;">There are currently no pending support requests from customers.</p>
                                        </div>
                                    </EmptyDataTemplate>

                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <!-- Right Side: Chat & Email Panels -->
        <div>

            <!-- Chat Window Panel -->
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="panel_chat" runat="server" Visible="False">
                        <div class="side-panel-card">
                            
                            <!-- Chat Header -->
                            <div class="panel-card-header">
                                <div class="panel-title">
                                    <i class="fa-solid fa-comments" style="color: #4f46e5;"></i>
                                    <span>Support Conversation</span>
                                </div>
                                <asp:Button ID="btn_close" runat="server" OnClick="btn_close_Click" Text="Close" CssClass="btn-close-panel" CausesValidation="false" />
                                <asp:HiddenField ID="hf_pid" runat="server" />
                            </div>

                            <!-- Chat Messages Scroll Container -->
                            <div class="chat-body-scroll">
                                <asp:DataList ID="DL_chat" runat="server" CssClass="chat-datalist">
                                    <ItemTemplate>
                                        <div class="chat-thread-item">
                                            
                                            <!-- User Message Row -->
                                            <div class="msg-row-user">
                                                <div class="msg-avatar-user">
                                                    <i class="fa-solid fa-user"></i>
                                                </div>
                                                <div class="msg-bubble-user">
                                                    <span class="msg-user-name">
                                                        <asp:Label ID="lbl_user" runat="server" Text='<%# Eval("User_name") %>'></asp:Label>
                                                    </span>
                                                    <div class="msg-user-text">
                                                        <asp:Label ID="lbl_feedbackmsg" runat="server" Text='<%# Eval("Feedback_message") %>'></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Admin Reply Row -->
                                            <div class="msg-row-admin" style='<%# string.IsNullOrEmpty(Eval("Feedback_reply")?.ToString()) ? "display:none;" : "" %>'>
                                                <div class="msg-bubble-admin">
                                                    <span class="msg-admin-name">
                                                        <asp:Label ID="lbl_admin" runat="server" Text="Admin"></asp:Label>
                                                    </span>
                                                    <div class="msg-admin-text">
                                                        <asp:Label ID="lbl_feedbackReply" runat="server" Text='<%# Eval("Feedback_reply") %>'></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="msg-avatar-admin">
                                                    <i class="fa-solid fa-user-shield"></i>
                                                </div>
                                            </div>

                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>

                            <!-- Chat Input Footer -->
                            <div class="chat-footer">
                                <div class="chat-input-row">
                                    <asp:TextBox ID="tbx_reply" runat="server" CssClass="chat-input-field" placeholder="Type your reply here..." autocomplete="off" ValidationGroup="ChatValidation"></asp:TextBox>
                                    <asp:Button ID="btn_Send" runat="server" Text="Send" OnClick="btn_Send_Click" CssClass="btn-send-chat" ValidationGroup="ChatValidation" />
                                </div>
                                <asp:RequiredFieldValidator ID="rfv_reply" runat="server" ControlToValidate="tbx_reply" ValidationGroup="ChatValidation" ErrorMessage="Please enter a message before sending." Display="Dynamic" CssClass="val-msg-err"></asp:RequiredFieldValidator>
                            </div>

                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>

            <!-- Email Panel -->
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="panel_email" runat="server" Visible="False">
                        <div class="side-panel-card">
                            
                            <!-- Email Header -->
                            <div class="panel-card-header">
                                <div class="panel-title">
                                    <i class="fa-solid fa-paper-plane" style="color: #0284c7;"></i>
                                    <asp:Label ID="Label1" runat="server" Text="Compose Email"></asp:Label>
                                </div>
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Close" CssClass="btn-close-panel" CausesValidation="false" />
                            </div>

                            <!-- Email Body Form -->
                            <div class="email-body">
                                
                                <%-- To Field --%>
                                <div class="form-group-custom">
                                    <asp:Label ID="Label2" runat="server" Text="Recipient Email (To)" CssClass="form-label-custom"></asp:Label>
                                    <asp:TextBox ID="tb_to" runat="server" CssClass="form-control-custom" placeholder="customer@example.com" ValidationGroup="EmailValidation"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_to" runat="server" ControlToValidate="tb_to" ValidationGroup="EmailValidation" ErrorMessage="Recipient email address is required." Display="Dynamic" CssClass="val-msg-err"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="rev_to" runat="server" ControlToValidate="tb_to" ValidationGroup="EmailValidation" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ErrorMessage="Please enter a valid email address." Display="Dynamic" CssClass="val-msg-err"></asp:RegularExpressionValidator>
                                </div>

                                <%-- Subject Field --%>
                                <div class="form-group-custom">
                                    <asp:Label ID="Label3" runat="server" Text="Subject" CssClass="form-label-custom"></asp:Label>
                                    <asp:TextBox ID="tb_subject" runat="server" CssClass="form-control-custom" placeholder="Regarding your support inquiry" ValidationGroup="EmailValidation"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_subject" runat="server" ControlToValidate="tb_subject" ValidationGroup="EmailValidation" ErrorMessage="Email subject is required." Display="Dynamic" CssClass="val-msg-err"></asp:RequiredFieldValidator>
                                </div>

                                <%-- Message Field --%>
                                <div class="form-group-custom">
                                    <asp:Label ID="Label4" runat="server" Text="Message Body" CssClass="form-label-custom"></asp:Label>
                                    <asp:TextBox ID="tb_message" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control-custom" placeholder="Type your email message here..." ValidationGroup="EmailValidation"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_message" runat="server" ControlToValidate="tb_message" ValidationGroup="EmailValidation" ErrorMessage="Message body cannot be blank." Display="Dynamic" CssClass="val-msg-err"></asp:RequiredFieldValidator>
                                </div>

                                <%-- Success / Error Status Message --%>
                                <div style="margin-top: 4px;">
                                    <asp:Label ID="lbl_success" runat="server" Visible="False" style="font-size: 12.5px; font-weight: 600; display: block; margin-bottom: 8px;"></asp:Label>
                                    <asp:Button ID="btn_sendMail" runat="server" OnClick="btn_sendMail_Click" Text="Send Email" CssClass="btn-send-email" style="width:100%;" ValidationGroup="EmailValidation" />
                                </div>

                            </div>

                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

    </div>

</asp:Content>
