<%@ Page Title="Add Bank Account - CozaStore" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="AddBankAcc.aspx.cs" Inherits="Ecom_Project.User.AddBankAcc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* ═══════════════════════════════════════════
           COZASTORE ADD BANK ACCOUNT PAGE REDESIGN
        ═══════════════════════════════════════════ */

        .coza-bank-wrapper {
            background: linear-gradient(180deg, #f8f9fd 0%, #ffffff 100%);
            padding-top: 50px;
            padding-bottom: 90px;
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            min-height: 85vh;
        }

        .coza-bank-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .coza-bank-card {
            background: #ffffff;
            border-radius: 24px;
            border: 1px solid rgba(230, 233, 245, 0.9);
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.05);
            padding: 36px;
            transition: all 0.3s ease;
        }

        .coza-bank-header {
            text-align: center;
            margin-bottom: 32px;
        }

        .coza-bank-icon-badge {
            width: 64px;
            height: 64px;
            border-radius: 20px;
            background: linear-gradient(135deg, rgba(113, 127, 224, 0.15) 0%, rgba(90, 103, 216, 0.15) 100%);
            color: #717fe0;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            margin-bottom: 16px;
            box-shadow: 0 8px 20px rgba(113, 127, 224, 0.15);
        }

        .coza-bank-title {
            font-size: 22px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 6px;
        }

        .coza-bank-subtitle {
            font-size: 13px;
            color: #64748b;
            margin-bottom: 0;
        }

        /* Form Controls */
        .coza-form-field {
            margin-bottom: 22px;
        }

        .coza-form-label {
            font-size: 13px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 8px;
            display: block;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .coza-input-wrap {
            position: relative;
            display: flex;
            align-items: center;
        }

        .coza-input-icon {
            position: absolute;
            left: 16px;
            color: #94a3b8;
            font-size: 16px;
            pointer-events: none;
        }

        .coza-input-field {
            width: 100% !important;
            height: 50px !important;
            border-radius: 14px !important;
            border: 1.5px solid #cbd5e1 !important;
            padding: 0 16px 0 46px !important;
            font-size: 14px !important;
            font-weight: 500 !important;
            color: #1e293b !important;
            background-color: #ffffff !important;
            outline: none !important;
            transition: all 0.25s ease !important;
            box-shadow: 0 2px 6px rgba(0,0,0,0.02) !important;
        }

        .coza-input-field:focus {
            border-color: #717fe0 !important;
            box-shadow: 0 0 0 4px rgba(113, 127, 224, 0.15) !important;
        }

        /* Action Buttons */
        .btn-coza-submit {
            width: 100% !important;
            height: 52px !important;
            background: linear-gradient(135deg, #717fe0 0%, #5a67d8 100%) !important;
            color: #ffffff !important;
            border: none !important;
            border-radius: 26px !important;
            font-size: 14px !important;
            font-weight: 700 !important;
            letter-spacing: 1px !important;
            text-transform: uppercase !important;
            cursor: pointer !important;
            transition: all 0.3s ease !important;
            box-shadow: 0 8px 20px rgba(113, 127, 224, 0.35) !important;
            margin-top: 10px !important;
        }

        .btn-coza-submit:hover {
            background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%) !important;
            box-shadow: 0 8px 20px rgba(15, 23, 42, 0.3) !important;
            color: #ffffff !important;
            transform: translateY(-1px) !important;
        }

        .btn-coza-cancel {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 46px;
            background: transparent;
            color: #64748b;
            border: 1.5px solid #cbd5e1;
            border-radius: 23px;
            font-size: 13px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            text-decoration: none !important;
            margin-top: 12px;
            transition: all 0.25s ease;
        }

        .btn-coza-cancel:hover {
            background: #f1f5f9;
            color: #1e293b;
            border-color: #94a3b8;
        }

        /* Trust Footer */
        .coza-bank-trust {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            color: #10b981;
            font-size: 12px;
            font-weight: 600;
            margin-top: 24px;
            padding: 10px 16px;
            background: #ecfdf5;
            border-radius: 12px;
            border: 1px solid #a7f3d0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Title Banner -->
    <section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/bg-01.jpg');">
        <h2 class="ltext-105 cl0 txt-center">
            Add Bank Account
        </h2>
    </section>

    <div class="coza-bank-wrapper">
        <div class="coza-bank-container">
            <div class="coza-bank-card">
                
                <!-- Card Header -->
                <div class="coza-bank-header">
                    <div class="coza-bank-icon-badge">
                        <i class="fa fa-university"></i>
                    </div>
                    <h3 class="coza-bank-title">
                        <asp:Label ID="Label1" runat="server" Text="Enter Your Bank Details"></asp:Label>
                    </h3>
                    <p class="coza-bank-subtitle">
                        Add a new bank account to process seamless order payments.
                    </p>
                </div>

                <!-- Form Fields Container -->
                <div class="coza-form-field">
                    <asp:Label ID="Label2" runat="server" Text="Enter Your Account Name" CssClass="coza-form-label"></asp:Label>
                    <div class="coza-input-wrap">
                        <i class="fa fa-user coza-input-icon"></i>
                        <asp:TextBox ID="tbname" runat="server" CssClass="coza-input-field" placeholder="e.g. John Doe"></asp:TextBox>
                    </div>
                </div>

                <div class="coza-form-field">
                    <asp:Label ID="Label3" runat="server" Text="Enter Your Account Number" CssClass="coza-form-label"></asp:Label>
                    <div class="coza-input-wrap">
                        <i class="fa fa-credit-card coza-input-icon"></i>
                        <asp:TextBox ID="tbnumber" runat="server" CssClass="coza-input-field" placeholder="e.g. 123456789012"></asp:TextBox>
                    </div>
                </div>

                <div class="coza-form-field">
                    <asp:Label ID="Label4" runat="server" Text="Account Balance" CssClass="coza-form-label"></asp:Label>
                    <div class="coza-input-wrap">
                        <i class="fa fa-inr coza-input-icon"></i>
                        <asp:TextBox ID="tbbalance" runat="server" CssClass="coza-input-field" placeholder="e.g. 10000.00"></asp:TextBox>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="m-t-20">
                    <asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" Text="Save Bank Account" CssClass="btn-coza-submit" />
                    <a href="Checkout.aspx" class="btn-coza-cancel"><i class="fa fa-arrow-left m-r-6"></i> Back to Checkout</a>
                </div>

                <!-- Trust Seal -->
                <div class="coza-bank-trust">
                    <i class="fa fa-lock"></i>
                    <span>Your bank information is encrypted & 100% secure</span>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
