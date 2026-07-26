<%@ Page Title="Product Catalog - CozaStore" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Ecom_Project.User.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Flex grid styling for the Product DataList when RepeatLayout="Flow" is used */
        .product-grid-datalist {
            display: flex !important;
            flex-wrap: wrap !important;
            margin-right: -15px !important;
            margin-left: -15px !important;
            width: 100% !important;
        }
        
        /* Render DataList items as responsive Bootstrap columns */
        .product-grid-datalist > span, 
        .product-grid-datalist > div {
            display: block !important;
            padding-right: 15px !important;
            padding-left: 15px !important;
            margin-bottom: 35px !important;
            /* Default: 4 items per row on large desktops */
            flex: 0 0 25% !important;
            max-width: 25% !important;
            box-sizing: border-box !important;
        }
        
        @media (max-width: 1200px) {
            /* 3 items per row on laptops */
            .product-grid-datalist > span, 
            .product-grid-datalist > div {
                flex: 0 0 33.333% !important;
                max-width: 33.333% !important;
            }
        }

        @media (max-width: 991px) {
            /* 2 items per row on tablets */
            .product-grid-datalist > span, 
            .product-grid-datalist > div {
                flex: 0 0 50% !important;
                max-width: 50% !important;
            }
        }
        
        @media (max-width: 576px) {
            /* 1 item per row on mobile devices */
            .product-grid-datalist > span, 
            .product-grid-datalist > div {
                flex: 0 0 100% !important;
                max-width: 100% !important;
            }
        }

        /* Category Filter List layout overrides */
        .category-datalist {
            display: inline-flex !important;
            flex-wrap: wrap !important;
            gap: 8px !important;
            align-items: center !important;
        }
        
        .category-datalist > span, 
        .category-datalist > div {
            display: inline-block !important;
        }

        /* Stylize Category buttons as premium capsule pills */
        .filter-btn {
            font-family: Poppins-Medium, sans-serif !important;
            font-size: 14px !important;
            color: #555 !important;
            border: 1px solid #e6e6e6 !important;
            background: #f8f9fa !important;
            padding: 8px 22px !important;
            border-radius: 25px !important;
            margin-right: 10px !important;
            margin-bottom: 10px !important;
            cursor: pointer !important;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1) !important;
            outline: none !important;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.02) !important;
        }
        
        .filter-btn:hover {
            color: #fff !important;
            background: #717fe0 !important;
            border-color: #717fe0 !important;
            transform: translateY(-2px) !important;
            box-shadow: 0 5px 12px rgba(113, 127, 224, 0.25) !important;
        }

        .filter-btn.active-filter {
            color: #fff !important;
            background: #222 !important;
            border-color: #222 !important;
            font-weight: 600 !important;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15) !important;
        }

        /* Premium Product Card Container */
        .premium-product-card {
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            border: 1px solid #f0f0f0;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            position: relative;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .premium-product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
            border-color: #e0e0e0;
        }

        /* Card Image Section */
        .block2-pic {
            position: relative;
            overflow: hidden;
            background-color: #f7f7f7;
        }
        
        .block2-pic:hover .block2-btn {
            bottom: 20px;
            opacity: 1;
            visibility: visible;
        }

        /* Uniform image sizes */
        .product-img-element {
            width: 100% !important;
            height: 330px !important;
            object-fit: cover !important;
            transition: transform 0.8s cubic-bezier(0.25, 0.8, 0.25, 1) !important;
        }

        .premium-product-card:hover .product-img-element {
            transform: scale(1.06) !important;
        }

        /* Hover Button overlay style */
        .premium-view-btn {
            font-family: Poppins-Medium, sans-serif !important;
            font-size: 13px !important;
            text-transform: uppercase !important;
            letter-spacing: 1px !important;
            border-radius: 22px !important;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.18) !important;
        }

        /* Card Text content styling */
        .product-card-body {
            padding: 20px !important;
            display: flex !important;
            flex-direction: column !important;
            flex-grow: 1 !important;
        }

        .product-title-link {
            font-family: Poppins-SemiBold, sans-serif !important;
            font-size: 15px !important;
            color: #333 !important;
            font-weight: 600 !important;
            line-height: 1.4 !important;
            transition: color 0.3s ease !important;
            text-decoration: none !important;
            display: block !important;
            margin-bottom: 4px !important;
        }

        .product-title-link:hover {
            color: #717fe0 !important;
            text-decoration: none !important;
        }

        /* Truncate descriptions to 2 lines nicely */
        .product-desc-text {
            font-family: Poppins-Regular, sans-serif !important;
            font-size: 13px !important;
            color: #777 !important;
            line-height: 1.5 !important;
            display: -webkit-box !important;
            -webkit-line-clamp: 2 !important;
            -webkit-box-orient: vertical !important;
            overflow: hidden !important;
            height: 38px !important;
            margin-top: 6px !important;
            margin-bottom: 12px !important;
        }

        /* Indian Currency styling */
        .product-price-container {
            display: flex !important;
            align-items: center !important;
            border-top: 1px solid #f5f5f5 !important;
            padding-top: 12px !important;
            margin-top: auto !important;
        }

        .product-price-val {
            font-family: Poppins-Bold, sans-serif !important;
            font-size: 17px !important;
            color: #111 !important;
            font-weight: 700 !important;
        }

        .currency-symbol {
            color: #717fe0 !important;
            font-size: 16px !important;
            margin-right: 3px !important;
            font-weight: 600 !important;
        }


        /* Center Search Bar layout */
        .search-container {
            max-width: 580px;
            margin: 10px auto 45px auto;
        }

        .search-bar-wrap {
            display: flex;
            align-items: center;
            background: #f8f9fa;
            border: 1px solid #e6e6e6;
            border-radius: 30px;
            padding: 4px 4px 4px 20px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .search-bar-wrap:focus-within {
            background: #fff;
            border-color: #717fe0;
            box-shadow: 0 6px 20px rgba(113, 127, 224, 0.12);
        }

        .search-input-field {
            flex-grow: 1;
            border: none !important;
            outline: none !important;
            font-family: Poppins-Regular, sans-serif;
            font-size: 14px;
            color: #333;
            background: transparent;
            padding: 8px 0;
        }

        .search-icon-btn {
            background: #717fe0;
            color: #fff !important;
            border: none;
            border-radius: 50%;
            width: 36px;
            height: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none !important;
        }

        .search-icon-btn:hover {
            background: #222;
        }

        .search-icon-btn i {
            font-size: 14px;
            color: #fff !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Ajax ScriptManager -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <!-- Spacer to push page content below the navigation bar -->
    <div style="height: 84px;"></div>

    <!-- Asynchronous UpdatePanel to avoid full page reloads -->
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!-- Product Catalog Section -->
            <div class="bg0 p-t-60 p-b-100">
                <div class="container">
                    
                    <!-- Page Header -->
                    <div class="p-b-35 text-center">
                        <h2 class="ltext-105 cl2 txt-center p-b-8" style="font-family: Poppins-Bold, sans-serif; font-weight: 700; text-transform: uppercase; letter-spacing: 1px;">
                            Our Collections
                        </h2>
                        <p class="stext-113 cl6 txt-center">
                            Discover premium style trends curated for you
                        </p>
                    </div>

                    <!-- Premium Centered Search Bar (Wired for TextChanged server events inside AJAX) -->
                    <asp:Panel ID="PnlSearch" runat="server" DefaultButton="BtnSearch" CssClass="search-container">
                        <div class="search-bar-wrap">
                            <asp:TextBox ID="TxtSearch" runat="server" CssClass="search-input-field" placeholder="Search by product name..." AutoPostBack="true" OnTextChanged="TxtSearch_TextChanged"></asp:TextBox>
                            <asp:LinkButton ID="BtnSearch" runat="server" CssClass="search-icon-btn">
                                <i class="zmdi zmdi-search"></i>
                            </asp:LinkButton>
                        </div>
                    </asp:Panel>

                    <!-- Categories and Catalog Container -->
                    <div class="p-b-52">
                        <!-- Category Buttons (Server-Side Bound) -->
                        <div class="flex-w flex-c-m filter-tope-group m-tb-10">
                            <asp:Button ID="BtnAll" runat="server" OnClick="BtnAll_Click" Text="All Products" CssClass="filter-btn active-filter" data-category-id="0" />
                            
                            <asp:DataList ID="DL_cat" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="category-datalist">
                                <ItemTemplate>
                                    <asp:Button ID="BtnCat" runat="server" CommandArgument='<%# Eval("Category_id") %>' OnCommand="BtnCat_Command" Text='<%# Eval("Category_name") %>' CssClass="filter-btn" data-category-id='<%# Eval("Category_id") %>' />
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>

                    <!-- Product Grid Catalog -->
                    <div class="row">
                        <asp:DataList ID="DL_Product" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="product-grid-datalist isotope-grid">
                            <ItemTemplate>
                                <div>
                                    <!-- Premium Product Card -->
                                    <div class="premium-product-card">
                                        <div class="block2-pic hov-img0">
                                            <!-- Dynamic product image, clicking it triggers command to details -->
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("Product_id") %>' ImageUrl='<%# Eval("Product_image") %>' OnCommand="ImageButton1_Command" CssClass="product-img-element" />
                                            
                                            <!-- Hover Button Overlay -->
                                            <asp:LinkButton ID="LnkViewDetails" runat="server" CommandArgument='<%# Eval("Product_id") %>' OnCommand="ImageButton1_Command" CssClass="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 premium-view-btn">
                                                View Details
                                            </asp:LinkButton>
                                        </div>

                                        <div class="product-card-body">
                                            <!-- Product Name -->
                                            <asp:LinkButton ID="LnkProductName" runat="server" CommandArgument='<%# Eval("Product_id") %>' OnCommand="ImageButton1_Command" CssClass="product-title-link js-name-b2">
                                                <%# Eval("Product_name") %>
                                            </asp:LinkButton>

                                            <!-- Description truncated nicely -->
                                            <p class="product-desc-text">
                                                <%# Eval("Product_description") %>
                                            </p>

                                            <!-- Product Price (Indian Rupees Icon) -->
                                            <div class="product-price-container">
                                                <span class="product-price-val js-price-b2">
                                                    <i class="fa fa-inr currency-icon" style="color: #717fe0; margin-right: 4px; font-size: 15px;"></i><%# Eval("Product_price", "{0:N2}") %>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Isotope client-side filtering script wrapper -->
    <script type="text/javascript">
        // Target dynamic spans generated by DataList and restore active filter state
        function prepGridItems() {
            var gridItems = document.querySelectorAll('.isotope-grid > span, .isotope-grid > div');
            gridItems.forEach(function (el) {
                el.classList.add('isotope-item');
            });

            // Restore active category filter state from sessionStorage across postbacks
            var activeCategory = sessionStorage.getItem('activeCategory');
            if (activeCategory) {
                var filterButtons = document.querySelectorAll('.filter-btn');
                filterButtons.forEach(function (btn) {
                    var btnText = btn.value || btn.textContent || "";
                    if (btnText.trim().toLowerCase() === activeCategory.trim().toLowerCase()) {
                        btn.classList.add('active-filter');
                    } else {
                        btn.classList.remove('active-filter');
                    }
                });
            }
        }

        // Run immediately when DOM is parsed
        document.addEventListener('DOMContentLoaded', function () {
            // Parse categoryId from URL to handle deep-linking correctly
            var urlParams = new URLSearchParams(window.location.search);
            var categoryId = urlParams.get('categoryId');
            
            if (categoryId !== null) {
                // Find button with data-category-id matching the URL param
                var targetBtn = document.querySelector('.filter-btn[data-category-id="' + categoryId + '"]');
                if (targetBtn) {
                    var btnText = targetBtn.value || targetBtn.textContent || "";
                    sessionStorage.setItem('activeCategory', btnText.trim());
                } else if (categoryId === "0") {
                    sessionStorage.setItem('activeCategory', 'All Products');
                }
            } else {
                // Default to All Products on initial direct page load
                sessionStorage.setItem('activeCategory', 'All Products');
            }

            prepGridItems();
        });

        // Use vanilla Javascript event delegation (no jQuery dependency on initial parsing)
        document.addEventListener('click', function (e) {
            if (e.target && e.target.classList && e.target.classList.contains('filter-btn')) {
                var btnText = e.target.value || e.target.textContent || "";
                sessionStorage.setItem('activeCategory', btnText.trim());
            }
        });

        // Initialize Isotope and AJAX PageRequestManager once scripts are fully loaded
        window.addEventListener('load', function () {
            var $grid = $('.isotope-grid');
            
            // Initial isotope setup
            $grid.isotope({
                itemSelector: '.isotope-item',
                layoutMode: 'fitRows'
            });

            // Register AJAX endRequest handler (Sys is guaranteed to be defined now)
            if (typeof Sys !== 'undefined' && typeof Sys.WebForms !== 'undefined') {
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                    // Re-run item preparation and active class checks
                    prepGridItems();
                    
                    // Re-initialize Isotope for the new items
                    $grid.isotope({
                        itemSelector: '.isotope-item',
                        layoutMode: 'fitRows'
                    });
                });
            }
        });
    </script>
</asp:Content>
