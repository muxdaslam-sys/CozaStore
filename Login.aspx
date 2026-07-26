<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ecom_Project.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Access - CozaStore</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <!-- CozaStore favicon and base assets -->
    <link rel="icon" type="image/png" href="images/icons/favicon.png" />
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css" />
    <link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css" />
    <link rel="stylesheet" type="text/css" href="css/util.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />

    <style type="text/css">
        /* Global Reset & Base Styling */
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Poppins-Regular', sans-serif;
            background-color: #f7f7f7;
            overflow: hidden;
        }

        .login-container {
            display: flex;
            height: 100vh;
            width: 100vw;
        }

        /* Left Side: Image Banner */
        .login-aside {
            flex: 1.1;
            background-image: url('Images/slide-02.jpg'), linear-gradient(135deg, #222222 0%, #717fe0 100%);
            background-size: cover;
            background-position: center;
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 60px;
            color: #ffffff;
        }

        .login-aside::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(34, 34, 34, 0.85) 0%, rgba(113, 127, 224, 0.65) 100%);
            z-index: 1;
        }

        .aside-content {
            position: relative;
            z-index: 2;
            margin-top: auto;
            margin-bottom: auto;
            max-width: 520px;
        }

        .aside-title {
            font-family: 'PlayfairDisplay-Bold', serif;
            font-size: 52px;
            font-weight: 700;
            margin-bottom: 20px;
            letter-spacing: 2px;
            line-height: 1.2;
            text-transform: uppercase;
        }

        .aside-subtitle {
            font-size: 16px;
            line-height: 1.7;
            color: rgba(255, 255, 255, 0.85);
            font-family: 'Poppins-Light', sans-serif;
        }

        .aside-footer {
            position: relative;
            z-index: 2;
            font-size: 13px;
            color: rgba(255, 255, 255, 0.5);
            font-family: 'Poppins-Light', sans-serif;
        }

        /* Right Side: Form Panel */
        .login-main {
            flex: 0.9;
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
            overflow-y: auto;
            position: relative;
        }

        .login-form-wrapper {
            width: 100%;
            max-width: 480px;
            margin: auto;
        }

        .logo-wrapper {
            text-align: center;
            margin-bottom: 35px;
        }

        .logo-wrapper img {
            max-height: 26px;
            object-fit: contain;
        }

        /* Tab Switcher */
        .login-tabs {
            display: flex;
            justify-content: center;
            position: relative;
            margin-bottom: 35px;
            border-bottom: 2px solid #f1f1f1;
        }

        .tab-btn {
            font-family: 'Poppins-Medium', sans-serif;
            font-size: 16px;
            color: #999999;
            background: none;
            border: none;
            padding: 12px 30px;
            cursor: pointer;
            transition: all 0.3s ease;
            outline: none;
            position: relative;
        }

        .tab-btn:hover {
            color: #222222;
        }

        .tab-btn.active {
            color: #717fe0;
        }

        .tab-btn.active::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #717fe0;
            animation: slideIn 0.3s ease;
        }

        /* Form Animation & State */
        .auth-form {
            display: none;
            animation: fadeIn 0.4s ease-in-out;
        }

        .auth-form.active {
            display: block;
        }

        /* Inputs & Form Groups */
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-label {
            display: block;
            font-family: 'Poppins-Medium', sans-serif;
            font-size: 12px;
            color: #555555;
            margin-bottom: 7px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .input-container {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            color: #aaaaaa;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .form-input {
            width: 100%;
            height: 46px;
            padding: 10px 15px 10px 42px;
            border: 1px solid #e6e6e6;
            border-radius: 4px;
            font-size: 14px;
            color: #333333;
            font-family: 'Poppins-Regular', sans-serif;
            transition: all 0.3s ease;
            background-color: #fafafa;
        }

        .form-input:focus {
            border-color: #717fe0;
            background-color: #ffffff;
            box-shadow: 0 4px 12px rgba(113, 127, 224, 0.08);
            outline: none;
        }

        .form-input:focus + .input-icon {
            color: #717fe0;
        }

        /* Two-Column Form Grid for Signup */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px 18px;
        }

        .form-grid .form-group {
            margin-bottom: 10px;
        }

        .form-grid .form-group-full {
            grid-column: span 2;
        }

        /* Submit Button */
        .btn-submit {
            width: 100%;
            height: 48px;
            background-color: #222222;
            border: none;
            border-radius: 24px;
            color: #ffffff;
            font-family: 'Poppins-Medium', sans-serif;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            margin-top: 15px;
        }

        .btn-submit:hover {
            background-color: #717fe0;
            box-shadow: 0 6px 20px rgba(113, 127, 224, 0.35);
            transform: translateY(-2px);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        /* Validation Style Override */
        .validator-error {
            color: #e65540 !important;
            font-size: 12px;
            font-family: 'Poppins-Regular', sans-serif;
            display: block;
            margin-top: 5px;
            position: relative;
            padding-left: 16px;
            animation: slideDown 0.25s ease-out;
        }

        .validator-error::before {
            content: '\f1f0';
            font-family: 'Material-Design-Iconic-Font';
            position: absolute;
            left: 0;
            top: 2px;
            font-size: 11px;
        }


        /* Back Navigation */
        .back-to-home {
            text-align: center;
            margin-top: 30px;
        }

        .back-link {
            font-family: 'Poppins-Regular', sans-serif;
            font-size: 14px;
            color: #888888;
            text-decoration: none;
            transition: color 0.3s ease;
            display: inline-flex;
            align-items: center;
        }

        .back-link i {
            margin-right: 6px;
            font-size: 12px;
        }

        .back-link:hover {
            color: #717fe0;
            text-decoration: none;
        }

        /* Responsive Layouts */
        @media (max-width: 991.98px) {
            .login-aside {
                display: none;
            }
            .login-main {
                flex: 1;
                padding: 30px 20px;
            }
            .login-form-wrapper {
                max-width: 440px;
            }
        }

        @media (max-width: 575.98px) {
            .form-grid {
                grid-template-columns: 1fr;
                gap: 0;
            }
            .form-grid .form-group-full, 
            .form-grid .form-group {
                grid-column: span 1;
                margin-bottom: 16px;
            }
            .login-tabs {
                margin-bottom: 25px;
            }
            .tab-btn {
                padding: 10px 20px;
                font-size: 15px;
            }
        }

        /* Animation Keyframes */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(8px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-5px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { transform: scaleX(0); }
            to { transform: scaleX(1); }
        }

        /* Feedback Message Alert Styling */
        .feedback-message {
            display: block;
            padding: 16px 20px;
            border-radius: 8px;
            font-size: 14px;
            font-family: 'Poppins-Medium', sans-serif;
            margin-top: 20px;
            position: relative;
            padding-left: 48px;
            animation: slideDownFade 0.5s cubic-bezier(0.34, 1.56, 0.64, 1);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
            border: 1px solid transparent;
            transition: all 0.3s ease;
        }

        .feedback-success {
            background: linear-gradient(135deg, rgba(39, 174, 96, 0.07) 0%, rgba(46, 204, 113, 0.02) 100%);
            color: #155724;
            border: 1px solid rgba(46, 204, 113, 0.15);
            border-left: 4px solid #2ecc71;
            box-shadow: 0 8px 24px -4px rgba(46, 204, 113, 0.12), 0 4px 8px -2px rgba(46, 204, 113, 0.06);
        }

        .feedback-success::before {
            content: '\f26b'; /* zmdi-check-circle */
            font-family: 'Material-Design-Iconic-Font';
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 22px;
            color: #2ecc71;
        }

        @keyframes slideDownFade {
            0% {
                opacity: 0;
                transform: translateY(-12px) scale(0.97);
            }
            100% {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .feedback-danger {
            background: linear-gradient(135deg, rgba(230, 85, 64, 0.07) 0%, rgba(230, 85, 64, 0.02) 100%);
            color: #8a2518;
            border: 1px solid rgba(230, 85, 64, 0.15);
            border-left: 4px solid #e65540;
            box-shadow: 0 8px 24px -4px rgba(230, 85, 64, 0.12), 0 4px 8px -2px rgba(230, 85, 64, 0.06);
        }

        .feedback-danger::before {
            content: '\f1f0'; /* zmdi-alert-triangle */
            font-family: 'Material-Design-Iconic-Font';
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 22px;
            color: #e65540;
        }

        /* Password Visibility Toggle */
        .password-toggle {
            position: absolute;
            right: 15px;
            color: #aaaaaa;
            font-size: 16px;
            cursor: pointer;
            transition: color 0.3s ease;
            user-select: none;
            z-index: 10;
        }

        .password-toggle:hover {
            color: #717fe0;
        }

        .form-input.password-input {
            padding-right: 42px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="login-container">
            <!-- Left Side Panel (Hidden on Mobile) -->
            <div class="login-aside">
                <div class="aside-content">
                    <h1 class="aside-title">COZA STORE</h1>
                    <p class="aside-subtitle">Discover the latest trends in men's fashion, express your unique style, and explore our premium curated collections.</p>
                </div>
                <div class="aside-footer">
                    <span>&copy; 2026 CozaStore. All rights reserved.</span>
                </div>
            </div>

            <!-- Right Side Form Panel -->
            <div class="login-main">
                <div class="login-form-wrapper">
                    <!-- Brand Logo -->
                    <div class="logo-wrapper">
                        <a href="index.aspx">
                            <img src="images/icons/logo-01.png" alt="COZA STORE" />
                        </a>
                    </div>

                    <!-- Toggle Tabs -->
                    <div class="login-tabs">
                        <button type="button" class="tab-btn active" id="tab-login" onclick="switchTab('login')">Sign In</button>
                        <button type="button" class="tab-btn" id="tab-register" onclick="switchTab('register')">Sign Up</button>
                    </div>

                    <!-- Forms Area -->
                    <div class="form-container">
                        
                        <!-- Login/Sign In Form -->
                        <div class="auth-form active" id="form-login">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Username" AssociatedControlID="ltb1" CssClass="form-label"></asp:Label>
                                <div class="input-container">
                                    <i class="input-icon zmdi zmdi-account"></i>
                                    <asp:TextBox ID="ltb1" runat="server" CssClass="form-input" placeholder="Enter your username"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ltb1" ErrorMessage="Enter Your Username" ValidationGroup="LoginGroup" CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Password" AssociatedControlID="ltb2" CssClass="form-label"></asp:Label>
                                <div class="input-container">
                                    <i class="input-icon zmdi zmdi-lock"></i>
                                    <asp:TextBox ID="ltb2" runat="server" TextMode="Password" ClientIDMode="Static" CssClass="form-input password-input" placeholder="Enter your password"></asp:TextBox>
                                    <span class="password-toggle zmdi zmdi-eye" id="toggle-ltb2" onclick="togglePasswordVisibility('ltb2', 'toggle-ltb2')"></span>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ltb2" ErrorMessage="Enter Your Password" ValidationGroup="LoginGroup" CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>

                            <asp:Button ID="Button1" runat="server" OnClick="Login_Click" Text="Login" ValidationGroup="LoginGroup" CssClass="btn-submit" />
                            <asp:Label ID="lbl_loginsuccess" runat="server" Text="Welcome Back" Visible="false" CssClass="feedback-message feedback-success"></asp:Label>
                        </div>

                        <!-- Register/Sign Up Form -->
                        <div class="auth-form" id="form-register">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="form-grid">
                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Name" AssociatedControlID="stb1" CssClass="form-label"></asp:Label>
                                    <div class="input-container">
                                        <i class="input-icon zmdi zmdi-account-box"></i>
                                        <asp:TextBox ID="stb1" runat="server" CssClass="form-input" placeholder="John Doe"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="stb1" ErrorMessage="Enter Your Name" ValidationGroup="RegisterGroup" CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="Age" AssociatedControlID="stb2" CssClass="form-label"></asp:Label>
                                    <div class="input-container">
                                        <i class="input-icon zmdi zmdi-calendar"></i>
                                        <asp:TextBox ID="stb2" runat="server" CssClass="form-input" placeholder="Min 15"></asp:TextBox>
                                    </div>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="stb2" ErrorMessage="Age Must be Above 15yrs" MaximumValue="100" MinimumValue="15" Type="Integer" ValidationGroup="RegisterGroup" CssClass="validator-error" Display="Dynamic"></asp:RangeValidator>
                                </div>

                                <div class="form-group form-group-full">
                                    <asp:Label ID="Label5" runat="server" Text="Address" AssociatedControlID="stb3" CssClass="form-label"></asp:Label>
                                    <div class="input-container">
                                        <i class="input-icon zmdi zmdi-pin"></i>
                                        <asp:TextBox ID="stb3" runat="server" CssClass="form-input" placeholder="Street Address, City"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="stb3" ErrorMessage="Enter Your Address" ValidationGroup="RegisterGroup" CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label6" runat="server" Text="Phone Number" AssociatedControlID="stb4" CssClass="form-label"></asp:Label>
                                    <div class="input-container">
                                        <i class="input-icon zmdi zmdi-phone"></i>
                                        <asp:TextBox ID="stb4" runat="server" CssClass="form-input" placeholder="10-digit mobile"></asp:TextBox>
                                    </div>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="stb4" ErrorMessage="Enter Valid Phone Number" ValidationExpression="^[6-9]\d{9}$" ValidationGroup="RegisterGroup" CssClass="validator-error" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label7" runat="server" Text="Email" AssociatedControlID="stb5" CssClass="form-label"></asp:Label>
                                    <div class="input-container">
                                        <i class="input-icon zmdi zmdi-email"></i>
                                        <asp:TextBox ID="stb5" runat="server" CssClass="form-input" placeholder="name@example.com"></asp:TextBox>
                                    </div>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="stb5" ErrorMessage="Enter Valid Email" ValidationExpression="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$" ValidationGroup="RegisterGroup" CssClass="validator-error" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label8" runat="server" Text="Pincode" AssociatedControlID="stb6" CssClass="form-label"></asp:Label>
                                    <div class="input-container">
                                        <i class="input-icon zmdi zmdi-pin-drop"></i>
                                        <asp:TextBox ID="stb6" runat="server" CssClass="form-input" placeholder="6-digit PIN"></asp:TextBox>
                                    </div>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="stb6" ErrorMessage="Enter Valid Pincode" ValidationExpression="^[1-9][0-9]{5}$" ValidationGroup="RegisterGroup" CssClass="validator-error" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>

                                <div class="form-group">
                                     <asp:Label ID="Label9" runat="server" Text="Username" AssociatedControlID="stb7" CssClass="form-label"></asp:Label>
                                     <div class="input-container">
                                         <i class="input-icon zmdi zmdi-account-circle"></i>
                                         <asp:TextBox ID="stb7" runat="server" CssClass="form-input" placeholder="Username"></asp:TextBox>
                                     </div>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="stb7" ErrorMessage="Enter Your Username" ValidationGroup="RegisterGroup" CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                     <asp:Label ID="stb7_una" runat="server" Text="Username Already Exist" Visible="false" CssClass="validator-error"></asp:Label>
                                </div>

                                <div class="form-group form-group-full">
                                    <asp:Label ID="Label10" runat="server" Text="Password" AssociatedControlID="stb8" CssClass="form-label"></asp:Label>
                                    <div class="input-container">
                                        <i class="input-icon zmdi zmdi-lock-open"></i>
                                        <asp:TextBox ID="stb8" runat="server" TextMode="Password" ClientIDMode="Static" CssClass="form-input password-input" placeholder="Choose a password"></asp:TextBox>
                                        <span class="password-toggle zmdi zmdi-eye" id="toggle-stb8" onclick="togglePasswordVisibility('stb8', 'toggle-stb8')"></span>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="stb8" ErrorMessage="Enter Your Password" ValidationGroup="RegisterGroup" CssClass="validator-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <asp:Button ID="Button2" runat="server" OnClick="Register_Click" Text="Register" ValidationGroup="RegisterGroup" CssClass="btn-submit" />
                                    <asp:Label ID="lblsuccess" runat="server" Text="Succesfully Registered! Please login to your account" Visible="false" CssClass="feedback-message feedback-success"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                    </div>

<%--                    <!-- Return to Home Page Link -->
                    <div class="back-to-home">
                        <a href="index.aspx" class="back-link">
                            <i class="zmdi zmdi-arrow-left"></i> Back to Homepage
                        </a>
                    </div>--%>

                </div>
            </div>
        </div>
    </form>

    <!-- Client-Side Tab Switcher Script -->
    <script type="text/javascript">
        function togglePasswordVisibility(inputId, toggleIconId) {
            var passwordInput = document.getElementById(inputId);
            var toggleIcon = document.getElementById(toggleIconId);
            if (passwordInput && toggleIcon) {
                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    toggleIcon.classList.remove("zmdi-eye");
                    toggleIcon.classList.add("zmdi-eye-off");
                } else {
                    passwordInput.type = "password";
                    toggleIcon.classList.remove("zmdi-eye-off");
                    toggleIcon.classList.add("zmdi-eye");
                }
            }
        }

        function switchTab(tab) {
            var loginForm = document.getElementById('form-login');
            var registerForm = document.getElementById('form-register');
            var tabLogin = document.getElementById('tab-login');
            var tabRegister = document.getElementById('tab-register');

            if (tab === 'login') {
                loginForm.classList.add('active');
                registerForm.classList.remove('active');
                tabLogin.classList.add('active');
                tabRegister.classList.remove('active');
                localStorage.setItem('activeAuthTab', 'login');
            } else {
                loginForm.classList.remove('active');
                registerForm.classList.add('active');
                tabLogin.classList.remove('active');
                tabRegister.classList.add('active');
                localStorage.setItem('activeAuthTab', 'register');
            }
        }

        // Maintain selected tab or switch automatically on postback errors
        window.onload = function () {
            var isPostBack = <%= Page.IsPostBack.ToString().ToLower() %>;
            var serverError = document.getElementById('<%= stb7_una.ClientID %>');
            
            var registerGroupValidators = [
                '<%= RequiredFieldValidator3.ClientID %>',
                '<%= RangeValidator1.ClientID %>',
                '<%= RequiredFieldValidator5.ClientID %>',
                '<%= RegularExpressionValidator1.ClientID %>',
                '<%= RegularExpressionValidator2.ClientID %>',
                '<%= RegularExpressionValidator3.ClientID %>',
                '<%= RequiredFieldValidator10.ClientID %>'
            ];

            var hasRegisterError = false;

            // If the server-side registration validation label is visible
            if (serverError && serverError.style.display !== 'none' && serverError.innerHTML.trim() !== '') {
                hasRegisterError = true;
            }

            // Check if any client-side registration validators are currently visible
            if (!hasRegisterError) {
                for (var i = 0; i < registerGroupValidators.length; i++) {
                    var valId = registerGroupValidators[i];
                    var valEl = document.getElementById(valId);
                    if (valEl && valEl.style.visibility === 'visible') {
                        hasRegisterError = true;
                        break;
                    }
                }
            }

            // Check what the user previously active tab was
            var savedTab = localStorage.getItem('activeAuthTab');

            if (hasRegisterError || (isPostBack && savedTab === 'register')) {
                switchTab('register');
            } else {
                switchTab('login');
            }
        };
    </script>
</body>
</html>
