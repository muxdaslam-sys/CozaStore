<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="uindex.aspx.cs" Inherits="Ecom_Project.User.uindex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Header styling */
        .categories-header {
            text-align: center;
            margin-bottom: 50px;
        }
        
        .categories-title {
            font-family: Poppins-Bold, sans-serif;
            font-size: 38px;
            color: #222;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            position: relative;
            padding-bottom: 15px;
        }

        .categories-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background-color: #717fe0;
            border-radius: 2px;
        }
        
        .categories-subtitle {
            font-family: Poppins-Regular, sans-serif;
            font-size: 15px;
            color: #888;
            margin-top: 15px;
        }

        /* CSS Grid category layout */
        .category-datalist {
            display: grid !important;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)) !important;
            gap: 30px !important;
            width: 100% !important;
            padding: 0;
        }
        
        /* Override standard display style of DataList item elements */
        .category-datalist > span {
            display: block !important;
            width: 100% !important;
        }

        /* Card block styling */
        .category-card {
            position: relative;
            overflow: hidden;
            border-radius: 10px;
            border: 1px solid #eaeaea;
            box-shadow: 0 4px 15px rgba(0,0,0,0.04);
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            height: 360px;
        }
        
        .category-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            border-color: #717fe0;
        }

        /* Background image settings */
        .category-bg-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.8s cubic-bezier(0.25, 0.8, 0.25, 1);
        }
        
        .category-card:hover .category-bg-img {
            transform: scale(1.08);
        }

        /* Card content overlay */
        .category-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to bottom, rgba(0,0,0,0.1) 0%, rgba(0,0,0,0.65) 100%);
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            padding: 30px;
            box-sizing: border-box;
            transition: background 0.4s ease;
        }
        
        .category-card:hover .category-overlay {
            background: linear-gradient(to bottom, rgba(113, 127, 224, 0.15) 0%, rgba(34, 34, 34, 0.8) 100%);
        }

        /* Typography details */
        .category-title-text {
            font-family: Poppins-Bold, sans-serif;
            font-size: 24px;
            color: #fff;
            margin-bottom: 8px;
            text-transform: capitalize;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .category-desc-text {
            font-family: Poppins-Regular, sans-serif;
            font-size: 14px;
            color: #e0e0e0;
            line-height: 1.5;
            margin-bottom: 20px;
            text-shadow: 0 1px 3px rgba(0,0,0,0.3);
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
            opacity: 0.85;
            transition: opacity 0.4s ease, color 0.4s ease;
        }
        
        .category-card:hover .category-desc-text {
            opacity: 1;
            color: #fff;
        }

        /* Button and link styles inside card */
        .category-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-family: Poppins-Medium, sans-serif;
            font-size: 13px;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 2px solid transparent;
            padding-bottom: 4px;
            align-self: flex-start;
            transition: all 0.3s ease;
        }
        
        .category-card:hover .category-btn {
            border-bottom-color: #fff;
            letter-spacing: 1.5px;
        }

        /* Absolute clickable ImageButton overlay */
        .category-click-target {
            position: absolute !important;
            top: 0 !important;
            left: 0 !important;
            width: 100% !important;
            height: 100% !important;
            opacity: 0 !important;
            z-index: 10 !important;
            cursor: pointer !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Slider -->
    <section class="section-slide">
        <div class="wrap-slick1">
            <div class="slick1">
                <%--<div class="item-slick1" style="background-image: url(../images/mens_banner_wide.png);">
                    <div class="container h-full">
                        <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
                            <div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
                                <span class="ltext-101 cl2 respon2">Men Collection 2018
							</span>
                            </div>

                            <div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
                                <h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">NEW SEASON
							</h2>
                            </div>

                            <div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
                                <a href="../product.html" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">Shop Now
							</a>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <div class="item-slick1" style="background-image: url(../images/slide-02.jpg);">
                    <div class="container h-full">
                        <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
                            <div class="layer-slick1 animated visible-false" data-appear="rollIn" data-delay="0">
                                <span class="ltext-101 cl2 respon2">Men New-Season
							</span>
                            </div>

                            <div class="layer-slick1 animated visible-false" data-appear="lightSpeedIn" data-delay="800">
                                <h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">Jackets & Coats
							</h2>
                            </div>

                            <div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1600">
                                <a href="Product.aspx" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">Shop Now
							</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item-slick1" style="background-image: url(../images/slide-03.jpg);">
                    <div class="container h-full">
                        <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
                            <div class="layer-slick1 animated visible-false" data-appear="rotateInDownLeft" data-delay="0">
                                <span class="ltext-101 cl2 respon2">Men Collection 2026
							</span>
                            </div>

                            <div class="layer-slick1 animated visible-false" data-appear="rotateInUpRight" data-delay="800">
                                <h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">New arrivals
							</h2>
                            </div>

                            <div class="layer-slick1 animated visible-false" data-appear="rotateIn" data-delay="1600">
                                <a href="Product.aspx" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">Shop Now
							</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container p-t-60 p-b-80">
        <div class="categories-header">
            <h3 class="categories-title">Our Collections</h3>
            <p class="categories-subtitle">Choose from a variety of top categories carefully selected for you</p>
        </div>

        <asp:DataList ID="DL_u" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="category-datalist">
            <ItemTemplate>
                <div class="category-card">
                    <!-- Category Image -->
                    <asp:Image ID="imgCategory" runat="server" ImageUrl='<%# Eval("Category_image") %>' AlternateText='<%# Eval("Category_name") %>' CssClass="category-bg-img" />
                    
                    <!-- Content Overlay -->
                    <div class="category-overlay">
                        <h4 class="category-title-text"><%# Eval("Category_name") %></h4>
                        <p class="category-desc-text"><%# Eval("Category_description") %></p>
                        <div class="category-btn">
                            Shop Now <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                        </div>
                    </div>
                    
                    <!-- Click overlay preserving ImageButton server control properties -->
                    <asp:ImageButton ID="IB_u" runat="server" ImageUrl='<%# Eval("Category_image") %>' CssClass="category-click-target" />
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
