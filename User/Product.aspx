<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Ecom_Project.User.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Spacer to push content below the fixed header -->
	<div style="height: 84px;"></div>

	<!-- Product Section -->
	<div class="bg0 p-t-60 p-b-140">
		<div class="container">
			<!-- Page Header / Title -->
			<div class="p-b-35 text-center">
				<h2 class="ltext-105 cl2 txt-center p-b-10" style="font-family: Poppins-Bold, sans-serif; font-weight: 700; text-transform: uppercase; letter-spacing: 1px;">
					Shop Collections
				</h2>
				<p class="stext-113 cl6 txt-center">
					Browse our latest arrivals and find your perfect look
				</p>
			</div>

			<div class="flex-w flex-sb-m p-b-52" style="border-bottom: 1px solid #f2f2f2; padding-bottom: 20px;">
				<!-- Category filter buttons (4 headings) -->
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*" style="font-size: 15px; font-weight: 500;">
						All Products
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".women" style="font-size: 15px; font-weight: 500;">
						Women
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".men" style="font-size: 15px; font-weight: 500;">
						Men
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".bag" style="font-size: 15px; font-weight: 500;">
						Bag
					</button>
				</div>

				<!-- Search toggle button -->
				<div class="flex-w flex-c-m m-tb-10">
					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search" style="border-radius: 20px; padding: 0 20px; height: 40px; font-weight: 500;">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>
				
				<!-- Search input panel -->
				<div class="dis-none panel-search w-full p-t-15 p-b-15">
					<div class="bor8 dis-flex p-l-15" style="border-radius: 25px; overflow: hidden; background: #f9f9f9; border: 1px solid #e6e6e6;">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04" style="background: transparent; border: none; padding-left: 15px;">
							<i class="zmdi zmdi-search" style="font-size: 20px;"></i>
						</button>
						<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search products..." style="background: transparent; border: none; padding-left: 15px; width: 100%; outline: none; height: 50px;">
					</div>	
				</div>
			</div>
			<div>
			</div>
		</div>
	</div>
</asp:Content>
