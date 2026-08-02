<%@ Page Title="Contact Us - Coza Store" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Ecom_Project.User.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .contact-info-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 30px;
            border: 1px solid #e6e6e6;
            box-shadow: 0 4px 20px rgba(0,0,0,0.03);
            height: 100%;
        }

        .contact-item-row {
            display: flex;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 30px;
        }

        .contact-item-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            background: rgba(113, 127, 224, 0.1);
            color: #717fe0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            flex-shrink: 0;
        }

        .contact-item-title {
            font-family: Poppins-Bold, sans-serif;
            font-size: 16px;
            color: #222222;
            margin-bottom: 4px;
        }

        .contact-item-text {
            font-family: Poppins-Regular, sans-serif;
            font-size: 14px;
            color: #666666;
            line-height: 1.6;
        }

        .btn-coza-contact-submit {
            width: 100%;
            height: 50px;
            background: #717fe0;
            color: #ffffff;
            border: none;
            border-radius: 25px;
            font-family: Poppins-Medium, sans-serif;
            font-size: 14px;
            letter-spacing: 1px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 6px 18px rgba(113, 127, 224, 0.35);
        }

        .btn-coza-contact-submit:hover {
            background: #222222;
            color: #ffffff;
            box-shadow: 0 6px 18px rgba(34, 34, 34, 0.3);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<!-- Title Header Banner -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center font-weight-bold">
			Contact Us
		</h2>
	</section>	

	<!-- Content Section -->
	<section class="bg0 p-t-80 p-b-100">
		<div class="container">
			<div class="row">
				
				<!-- Left Column: Message Input Form -->
				<div class="col-md-7 col-lg-7 m-b-30">
					<div class="contact-info-card">
						<h3 class="mtext-105 cl2 p-b-25 font-weight-bold">
							Send Us A Message
						</h3>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="name" placeholder="Your Full Name">
							<i class="how-pos4 pointer-none zmdi zmdi-account fs-20 cl8"></i>
						</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="email" name="email" placeholder="Your Email Address">
							<i class="how-pos4 pointer-none zmdi zmdi-email fs-20 cl8"></i>
						</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="phone" placeholder="Your Phone Number (+91)">
							<i class="how-pos4 pointer-none zmdi zmdi-phone fs-20 cl8"></i>
						</div>

						<div class="bor8 m-b-30">
							<textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="msg" placeholder="How can we help you today?"></textarea>
						</div>

						<button type="button" class="btn-coza-contact-submit">
							Submit Message
						</button>
					</div>
				</div>

				<!-- Right Column: Store Details -->
				<div class="col-md-5 col-lg-5 m-b-30">
					<div class="contact-info-card">
						<h3 class="mtext-105 cl2 p-b-25 font-weight-bold">
							Get In Touch
						</h3>

						<div class="contact-item-row">
							<div class="contact-item-icon">
								<i class="zmdi zmdi-pin"></i>
							</div>
							<div>
								<h4 class="contact-item-title">Our Store Hub</h4>
								<p class="contact-item-text">
									Coza Store Experience Center,<br />
									Fashion Hub, MG Road, Bengaluru,<br />
									Karnataka 560001, India
								</p>
							</div>
						</div>

						<div class="contact-item-row">
							<div class="contact-item-icon">
								<i class="zmdi zmdi-phone"></i>
							</div>
							<div>
								<h4 class="contact-item-title">Call Us Direct</h4>
								<p class="contact-item-text">
									+91 98765 43210 / +91 80 1234 5678<br />
									Mon - Sat: 9:30 AM – 8:00 PM IST
								</p>
							</div>
						</div>

						<div class="contact-item-row">
							<div class="contact-item-icon">
								<i class="zmdi zmdi-email"></i>
							</div>
							<div>
								<h4 class="contact-item-title">Email Support</h4>
								<p class="contact-item-text">
									<strong>support@cozastore.com</strong><br />
									Response within 24 hours
								</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>	
</asp:Content>
