<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="Ecom_Project.User.PaymentSuccess" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Payment Successful - CozaStore</title>
    <!-- Google Fonts & FontAwesome -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <style type="text/css">
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: radial-gradient(circle at 50% 20%, #f0f4ff 0%, #e8eeec 60%, #e2e8f0 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #0f172a;
            overflow-x: hidden;
        }

        .pay-success-wrapper {
            width: 100%;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
            position: relative;
        }

        /* Ambient Glowing Background Elements */
        .pay-bg-glow-1 {
            position: absolute;
            width: 500px;
            height: 500px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(108, 99, 255, 0.15) 0%, rgba(255,255,255,0) 70%);
            top: 0%;
            left: 10%;
            filter: blur(60px);
            animation: floatGlow 9s ease-in-out infinite alternate;
        }

        .pay-bg-glow-2 {
            position: absolute;
            width: 550px;
            height: 550px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(16, 185, 129, 0.16) 0%, rgba(255,255,255,0) 70%);
            bottom: 0%;
            right: 10%;
            filter: blur(60px);
            animation: floatGlow 11s ease-in-out infinite alternate-reverse;
        }

        @keyframes floatGlow {
            0% { transform: translate(0, 0) scale(1); }
            100% { transform: translate(40px, -30px) scale(1.12); }
        }

        /* ═══════════════════════════════════════════════════════════════════
           STAGE 1: PROCESSING ANIMATION SCREEN
        ═══════════════════════════════════════════════════════════════════ */
        .processing-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(12px);
            border-radius: 28px;
            box-shadow: 0 25px 70px rgba(15, 23, 42, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.8);
            padding: 60px 45px;
            max-width: 520px;
            width: 100%;
            text-align: center;
            position: relative;
            z-index: 5;
            transition: all 0.6s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .loader-ring-wrapper {
            position: relative;
            width: 120px;
            height: 120px;
            margin: 0 auto 32px auto;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .loader-ring-spinner {
            position: absolute;
            width: 100%;
            height: 100%;
            border: 4px solid #e2e8f0;
            border-top: 4px solid #6c63ff;
            border-right: 4px solid #10b981;
            border-radius: 50%;
            animation: spinRing 1.1s cubic-bezier(0.5, 0, 0.5, 1) infinite;
        }

        .loader-pulse-glow {
            position: absolute;
            width: 90px;
            height: 90px;
            background: rgba(108, 99, 255, 0.16);
            border-radius: 50%;
            animation: pulseGlow 1.8s ease-out infinite;
        }

        .loader-icon-center {
            font-size: 38px;
            color: #6c63ff;
            z-index: 2;
            animation: bounceIcon 2s ease-in-out infinite;
        }

        @keyframes spinRing {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        @keyframes pulseGlow {
            0% { transform: scale(0.85); opacity: 0.9; }
            100% { transform: scale(1.6); opacity: 0; }
        }

        @keyframes bounceIcon {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-7px); }
        }

        .proc-title {
            font-size: 25px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 10px;
            letter-spacing: -0.3px;
        }

        .proc-desc {
            font-size: 14px;
            color: #64748b;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .proc-progress-container {
            position: relative;
            margin-bottom: 18px;
        }

        .proc-progress-bar-bg {
            width: 100%;
            height: 10px;
            background: #f1f5f9;
            border-radius: 12px;
            overflow: hidden;
            position: relative;
        }

        .proc-progress-bar-fill {
            height: 100%;
            width: 0%;
            background: linear-gradient(90deg, #6c63ff 0%, #3b82f6 50%, #10b981 100%);
            border-radius: 12px;
            transition: width 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .proc-status-meta {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 10px;
        }

        .proc-status-text {
            font-size: 13px;
            font-weight: 600;
            color: #6c63ff;
        }

        .proc-percent-text {
            font-size: 13px;
            font-weight: 700;
            color: #10b981;
        }

        /* ═══════════════════════════════════════════════════════════════════
           STAGE 2: SUCCESS CARD SCREEN
        ═══════════════════════════════════════════════════════════════════ */
        .success-card {
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(16px);
            border-radius: 28px;
            box-shadow: 0 30px 80px rgba(15, 23, 42, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.9);
            padding: 60px 48px;
            max-width: 600px;
            width: 100%;
            text-align: center;
            position: relative;
            z-index: 5;
            display: none;
            opacity: 0;
            transform: scale(0.9) translateY(30px);
            transition: opacity 0.7s cubic-bezier(0.16, 1, 0.3, 1), transform 0.7s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .success-card.active-reveal {
            display: block;
            opacity: 1;
            transform: scale(1) translateY(0);
        }

        /* Success Icon Badge */
        .success-badge-wrapper {
            position: relative;
            width: 105px;
            height: 105px;
            margin: 0 auto 30px auto;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .success-badge-bg {
            position: absolute;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            box-shadow: 0 14px 35px rgba(16, 185, 129, 0.38);
            animation: badgePop 0.85s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;
        }

        .success-checkmark-svg {
            position: relative;
            z-index: 2;
            width: 52px;
            height: 52px;
            stroke-dasharray: 100;
            stroke-dashoffset: 100;
            animation: drawCheck 0.75s ease-in-out 0.3s forwards;
        }

        @keyframes badgePop {
            0% { transform: scale(0); opacity: 0; }
            80% { transform: scale(1.12); opacity: 1; }
            100% { transform: scale(1); opacity: 1; }
        }

        @keyframes drawCheck {
            to { stroke-dashoffset: 0; }
        }

        /* Confetti Elements */
        .confetti-piece {
            position: absolute;
            width: 10px;
            height: 10px;
            border-radius: 3px;
            pointer-events: none;
            opacity: 0;
            animation: confettiFly 1.3s cubic-bezier(0.25, 1, 0.5, 1) 0.15s forwards;
        }

        @keyframes confettiFly {
            0% { opacity: 1; transform: translate(0, 0) rotate(0deg) scale(1); }
            100% { opacity: 0; transform: translate(var(--dx), var(--dy)) rotate(var(--rot)) scale(0.2); }
        }

        /* Content Formatting */
        .success-headline {
            font-size: 30px;
            font-weight: 800;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: -0.6px;
            margin-bottom: 12px;
        }

        .success-subtitle {
            font-size: 15.5px;
            color: #64748b;
            line-height: 1.6;
            margin-bottom: 28px;
        }

        /* Order Pill Badge */
        .order-badge-container {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            background: #f8fafc;
            border: 1.5px dashed #cbd5e1;
            padding: 11px 24px;
            border-radius: 50px;
            margin-bottom: 28px;
            transition: all 0.3s ease;
        }

        .order-badge-container:hover {
            border-color: #6c63ff;
            background: #f0eeff;
        }

        .order-badge-label {
            font-size: 14px;
            font-weight: 600;
            color: #475569;
        }

        .order-badge-value {
            font-size: 17px;
            font-weight: 700;
            color: #6c63ff;
            letter-spacing: 0.5px;
        }

        /* Store Confirmation Notice Box */
        .notice-info-card {
            background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
            border-left: 4px solid #0284c7;
            border-radius: 16px;
            padding: 20px 24px;
            margin-bottom: 35px;
            text-align: left;
            display: flex;
            align-items: flex-start;
            gap: 14px;
        }

        .notice-info-icon {
            font-size: 22px;
            color: #0284c7;
            flex-shrink: 0;
            margin-top: 2px;
        }

        .notice-info-text {
            font-size: 14px;
            color: #0369a1;
            line-height: 1.6;
            font-weight: 400;
        }

        /* Action Buttons */
        .action-buttons-group {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 16px;
            flex-wrap: wrap;
        }

        .btn-pay-primary {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            background: linear-gradient(135deg, #6c63ff 0%, #5a52e0 100%);
            color: #ffffff !important;
            font-weight: 600;
            font-size: 15px;
            padding: 15px 30px;
            border-radius: 14px;
            text-decoration: none !important;
            border: none;
            box-shadow: 0 10px 25px rgba(108, 99, 255, 0.32);
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            cursor: pointer;
        }

        .btn-pay-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 14px 32px rgba(108, 99, 255, 0.48);
            background: linear-gradient(135deg, #5a52e0 0%, #4840c9 100%);
        }

        .btn-pay-secondary {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            background: #ffffff;
            color: #334155 !important;
            font-weight: 600;
            font-size: 15px;
            padding: 15px 30px;
            border-radius: 14px;
            text-decoration: none !important;
            border: 1.5px solid #cbd5e1;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            cursor: pointer;
        }

        .btn-pay-secondary:hover {
            border-color: #94a3b8;
            background: #f8fafc;
            color: #0f172a !important;
            transform: translateY(-2px);
        }

        @media (max-width: 576px) {
            .success-card, .processing-card {
                padding: 42px 24px;
            }
            .success-headline {
                font-size: 24px;
            }
            .action-buttons-group {
                flex-direction: column;
                width: 100%;
            }
            .btn-pay-primary, .btn-pay-secondary {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="pay-success-wrapper">
            <!-- Ambient Glowing Orbs -->
            <div class="pay-bg-glow-1"></div>
            <div class="pay-bg-glow-2"></div>

            <!-- ═══════════════════════════════════════════════════════════════════
                 STAGE 1: PROCESSING ANIMATION CARD
            ═══════════════════════════════════════════════════════════════════ -->
            <div id="processing-screen" class="processing-card">
                <div class="loader-ring-wrapper">
                    <div class="loader-pulse-glow"></div>
                    <div class="loader-ring-spinner"></div>
                    <div class="loader-icon-center">
                        <i class="fa fa-credit-card"></i>
                    </div>
                </div>
                
                <h2 class="proc-title">Processing Order...</h2>
                <p class="proc-desc">Please wait a moment while we verify your transaction and confirm your payment details.</p>

                <div class="proc-progress-container">
                    <div class="proc-progress-bar-bg">
                        <div id="proc-bar-fill" class="proc-progress-bar-fill"></div>
                    </div>
                    <div class="proc-status-meta">
                        <span id="proc-status-text" class="proc-status-text">Verifying Payment Details...</span>
                        <span id="proc-percent-text" class="proc-percent-text">0%</span>
                    </div>
                </div>
            </div>

            <!-- ═══════════════════════════════════════════════════════════════════
                 STAGE 2: PAYMENT SUCCESS REVEAL CARD
            ═══════════════════════════════════════════════════════════════════ -->
            <div id="success-card" class="success-card">
                <!-- Confetti Burst Particles -->
                <div id="confetti-container"></div>

                <!-- Checkmark Animated Badge -->
                <div class="success-badge-wrapper">
                    <div class="success-badge-bg"></div>
                    <svg class="success-checkmark-svg" viewBox="0 0 52 52" fill="none">
                        <path d="M14 27L22 35L38 17" stroke="#ffffff" stroke-width="4.5" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </div>

                <!-- Headline -->
                <h1 class="success-headline">Payment Successful!</h1>
                <p class="success-subtitle">Your order has been received and your payment was successful.</p>

                <!-- Order Number Badge -->
                <div class="order-badge-container">
                    <span class="order-badge-label">Order</span>
                    <span class="order-badge-value">#<asp:Label ID="lblid" runat="server"></asp:Label></span>
                </div>

                <!-- Store Confirmation Notice Box -->
                <div class="notice-info-card">
                    <div class="notice-info-icon">
                        <i class="fa fa-info-circle"></i>
                    </div>
                    <div class="notice-info-text">
                        Your order is currently awaiting confirmation from the store. We will notify you once the store confirms that your items are available and your order is accepted.
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="action-buttons-group">
                    <a href="ViewOrders.aspx" class="btn-pay-primary">
                        <i class="fa fa-file-text-o"></i> View Order
                    </a>
                    <a href="Product.aspx" class="btn-pay-secondary">
                        <i class="fa fa-shopping-bag"></i> Continue Shopping
                    </a>
                </div>
            </div>
        </div>
    </form>

    <!-- ═══════════════════════════════════════════════════════════════════
         INTERACTIVE ANIMATION TRANSITION SCRIPT
    ═══════════════════════════════════════════════════════════════════ -->
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            var procBar = document.getElementById("proc-bar-fill");
            var procStatus = document.getElementById("proc-status-text");
            var procPercent = document.getElementById("proc-percent-text");
            var procScreen = document.getElementById("processing-screen");
            var successCard = document.getElementById("success-card");

            var progress = 0;
            var interval = setInterval(function () {
                progress += 25;
                if (procBar) procBar.style.width = progress + "%";
                if (procPercent) procPercent.innerText = progress + "%";

                if (progress === 25) {
                    if (procStatus) procStatus.innerText = "Securing Transaction...";
                } else if (progress === 50) {
                    if (procStatus) procStatus.innerText = "Processing Order...";
                } else if (progress === 75) {
                    if (procStatus) procStatus.innerText = "Finalizing Confirmation...";
                } else if (progress >= 100) {
                    clearInterval(interval);
                    
                    // Transition to Success Card
                    setTimeout(function () {
                        if (procScreen) {
                            procScreen.style.opacity = "0";
                            procScreen.style.transform = "scale(0.95)";
                            
                            setTimeout(function () {
                                procScreen.style.display = "none";
                                if (successCard) {
                                    successCard.style.display = "block";
                                    void successCard.offsetWidth;
                                    successCard.classList.add("active-reveal");
                                    triggerConfetti();
                                }
                            }, 400);
                        }
                    }, 300);
                }
            }, 600);
        });

        function triggerConfetti() {
            var container = document.getElementById("confetti-container");
            if (!container) return;
            var colors = ["#10b981", "#6c63ff", "#3b82f6", "#f59e0b", "#ec4899"];
            
            for (var i = 0; i < 28; i++) {
                var confetti = document.createElement("div");
                confetti.className = "confetti-piece";
                confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                confetti.style.left = "50%";
                confetti.style.top = "110px";
                
                var angle = Math.random() * Math.PI * 2;
                var dist = 90 + Math.random() * 150;
                var dx = Math.cos(angle) * dist + "px";
                var dy = Math.sin(angle) * dist - 40 + "px";
                var rot = (Math.random() * 360) + "deg";
                
                confetti.style.setProperty("--dx", dx);
                confetti.style.setProperty("--dy", dy);
                confetti.style.setProperty("--rot", rot);
                
                container.appendChild(confetti);
            }
        }
    </script>
</body>
</html>
