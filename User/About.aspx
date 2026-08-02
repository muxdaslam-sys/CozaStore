<%@ Page Title="About Us - Coza Store" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Ecom_Project.User.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .about-feature-box {
            background: #ffffff;
            border-radius: 12px;
            padding: 30px 25px;
            border: 1px solid #e6e6e6;
            box-shadow: 0 4px 20px rgba(0,0,0,0.03);
            text-align: center;
            transition: all 0.3s ease;
            height: 100%;
        }

        .about-feature-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(113, 127, 224, 0.15);
            border-color: #717fe0;
        }

        .about-feature-icon {
            width: 60px;
            height: 60px;
            background: rgba(113, 127, 224, 0.1);
            color: #717fe0;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
            margin: 0 auto 20px auto;
        }

        .about-feature-title {
            font-family: Poppins-Bold, sans-serif;
            font-size: 16px;
            color: #222;
            margin-bottom: 10px;
        }

        .about-feature-desc {
            font-family: Poppins-Regular, sans-serif;
            font-size: 13px;
            color: #666;
            line-height: 1.6;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<!-- Title Header Banner -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center font-weight-bold">
			About Coza Store
		</h2>
	</section>	

	<!-- Content Story Section -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="row p-b-148">
				<div class="col-md-7 col-lg-8">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h3 class="mtext-111 cl2 p-b-16 font-weight-bold">
							Our Journey & Heritage
						</h3>

						<p class="stext-113 cl6 p-b-26">
							Founded with a passion for contemporary fashion and timeless elegance, Coza Store has grown to become one of India's favorite online destinations for trendy apparel, footwear, and accessories. We believe that style is a personal expression of confidence, and our curated collections are designed to make high fashion accessible to everyone.
						</p>

						<p class="stext-113 cl6 p-b-26">
							From vibrant streetwear to formal attire and everyday essentials, every piece in our store is crafted with premium fabrics and obsessive attention to detail. We pride ourselves on blending global trend forecasting with local Indian craftsmanship.
						</p>

						<p class="stext-113 cl6 p-b-26">
							Have questions or feedback? Visit our Flagship Experience Store at <strong>Fashion Hub, MG Road, Bengaluru, Karnataka 560001</strong>, or reach out to our 24/7 Support Team at <strong>+91 98765 43210</strong>.
						</p>
					</div>
				</div>

				<div class="col-11 col-md-5 col-lg-4 m-lr-auto">
					<div class="how-bor1">
						<div class="hov-img0 border-radius-10">
							<img src="../images/about-01.jpg" alt="Coza Store Fashion Story" style="border-radius: 10px;">
						</div>
					</div>
				</div>
			</div>
			
			<!-- Mission & Quote Section -->
			<div class="row p-b-100">
				<div class="order-md-2 col-md-7 col-lg-8 p-b-30">
					<div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
						<h3 class="mtext-111 cl2 p-b-16 font-weight-bold">
							Our Mission & Quality Guarantee
						</h3>

						<p class="stext-113 cl6 p-b-26">
							Our mission is simple: to empower individuals through exceptional fashion delivered right to their doorstep across India. We aim to revolutionize online shopping by offering seamless navigation, transparent pricing in Indian Rupees, lightning-fast express shipping, and hassle-free returns.
						</p>

						<div class="bor16 p-l-29 p-b-9 m-t-22">
							<p class="stext-114 cl6 p-r-40 p-b-11">
								"Fashion is not something that exists in dresses only. Fashion is in the sky, in the street, fashion has to do with ideas, the way we live, what is happening."
							</p>

							<span class="stext-111 cl8 font-weight-bold">
								— Coco Chanel
							</span>
						</div>
					</div>
				</div>

				<div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30">
					<div class="how-bor2">
						<div class="hov-img0 border-radius-10">
							<img src="../images/about-02.jpg" alt="Coza Store Mission" style="border-radius: 10px;">
						</div>
					</div>
				</div>
			</div>

			<!-- Core Value Pillars Grid -->
			<div class="row">
				<div class="col-md-4 m-b-30">
					<div class="about-feature-box">
						<div class="about-feature-icon">
							<i class="zmdi zmdi-badge-check"></i>
						</div>
						<h4 class="about-feature-title">100% Authentic Quality</h4>
						<p class="about-feature-desc">Every apparel and accessory is thoroughly quality-inspected to guarantee 100% genuine craftsmanship.</p>
					</div>
				</div>

				<div class="col-md-4 m-b-30">
					<div class="about-feature-box">
						<div class="about-feature-icon">
							<i class="zmdi zmdi-truck"></i>
						</div>
						<h4 class="about-feature-title">Pan-India Express Shipping</h4>
						<p class="about-feature-desc">We deliver to over 19,000+ Indian PIN codes with real-time SMS & email tracking updates.</p>
					</div>
				</div>

				<div class="col-md-4 m-b-30">
					<div class="about-feature-box">
						<div class="about-feature-icon">
							<i class="zmdi zmdi-headset"></i>
						</div>
						<h4 class="about-feature-title">Dedicated 24/7 Support</h4>
						<p class="about-feature-desc">Our dedicated customer care team is always here to assist you with orders, exchanges, and queries.</p>
					</div>
				</div>
			</div>

		</div>
	</section>
</asp:Content>
