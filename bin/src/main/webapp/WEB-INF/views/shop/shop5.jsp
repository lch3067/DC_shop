<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dog Food - Pet Store</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css"/>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              primary: "#3b82f6",
              secondary: "#10b981",
            },
            borderRadius: {
              none: "0px",
              sm: "4px",
              DEFAULT: "8px",
              md: "12px",
              lg: "16px",
              xl: "20px",
              "2xl": "24px",
              "3xl": "32px",
              full: "9999px",
              button: "8px",
            },
          },
        },
      };
    </script>
    <style>
      @media (max-width: 768px) {
      .filter-panel {
      width: 100%;
      }
      .filter-toggle-btn.open {
      transform: translateX(100%);
      }
      }
      :where([class^="ri-"])::before {
      content: "\f3c2";
      }
      .filter-panel {
      transform: translateX(-100%);
      transition: transform 0.3s ease-in-out;
      z-index: 50;
      width: 320px;
      }
      .filter-panel.open {
      transform: translateX(0);
      }
      @media (max-width: 768px) {
      .filter-panel {
      width: 280px;
      }
      .filter-toggle-btn.open {
      transform: translate(280px, -50%);
      }
      }
      .filter-overlay {
      opacity: 0;
      visibility: hidden;
      transition: opacity 0.3s ease-in-out, visibility 0.3s ease-in-out;
      }
      .filter-overlay.open {
      opacity: 1;
      visibility: visible;
      }
      .filter-toggle-btn {
      position: fixed;
      left: 0;
      top: 50%;
      transform: translateY(-50%);
      background: white;
      border: 1px solid #e5e7eb;
      border-radius: 0 8px 8px 0;
      padding: 12px;
      height: 60px;
      display: none;
      align-items: center;
      gap: 8px;
      cursor: pointer;
      z-index: 51;
      transition: transform 0.3s ease-in-out;
      box-shadow: 2px 0 4px rgba(0, 0, 0, 0.05);
      }
      @media (min-width: 768px) {
      .filter-toggle-btn {
      display: flex;
      }
      }
      .filter-toggle-btn.open {
      transform: translate(320px, -50%);
      background: #3b82f6;
      border-color: #3b82f6;
      color: white;
      }
      @media (max-width: 1024px) {
      .filter-toggle-btn {
      height: 50px;
      padding: 8px;
      }
      }
      @media (max-width: 768px) {
      .filter-toggle-btn {
      height: 40px;
      padding: 6px;
      }
      }
      .filter-toggle-btn.open i,
      .filter-toggle-btn.open span {
      color: white;
      }
      .filter-toggle-btn i {
      transition: transform 0.3s ease-in-out;
      }
      .filter-toggle-btn.open i {
      transform: rotate(180deg);
      }
      .price-slider {
      -webkit-appearance: none;
      appearance: none;
      background: #e5e7eb;
      outline: none;
      border-radius: 4px;
      }
      .price-slider::-webkit-slider-thumb {
      -webkit-appearance: none;
      appearance: none;
      width: 20px;
      height: 20px;
      background: #3b82f6;
      cursor: pointer;
      border-radius: 50%;
      }
      .price-slider::-moz-range-thumb {
      width: 20px;
      height: 20px;
      background: #3b82f6;
      cursor: pointer;
      border-radius: 50%;
      border: none;
      }
      .custom-checkbox {
      position: relative;
      display: inline-block;
      width: 20px;
      height: 20px;
      background: white;
      border: 2px solid #d1d5db;
      border-radius: 4px;
      cursor: pointer;
      transition: all 0.2s ease;
      }
      .custom-checkbox.checked {
      background: #3b82f6;
      border-color: #3b82f6;
      }
      .custom-checkbox.checked::after {
      content: '✓';
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: white;
      font-size: 12px;
      font-weight: bold;
      }
    </style>
  </head>
  <body class="bg-gray-50 min-h-screen">
    <!-- Navigation -->
    <nav class="bg-white shadow-sm border-b border-gray-200">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
        <div class="flex items-center justify-between h-16">
          <div class="flex items-center space-x-8">
            <div class="font-['Pacifico'] text-2xl text-primary">logo</div>
            <div class="hidden lg:flex items-center space-x-8">
              <a
                href="#"
                class="text-gray-700 hover:text-primary transition-colors"
                >Pet Food</a
              >
              <a
                href="https://readdy.ai/home/b6511771-df02-440a-969d-e1281a6d8c0e/99208426-98f0-4462-846b-ef4957bd049b"
                data-readdy="true"
                class="text-gray-700 hover:text-primary transition-colors"
                >Cat Food</a
              >
              <a href="#" class="text-primary font-medium">Dog Food</a>
              <a
                href="#"
                class="text-gray-700 hover:text-primary transition-colors"
                >Toys</a
              >
              <a
                href="#"
                class="text-gray-700 hover:text-primary transition-colors"
                >Supplies</a
              >
              <a
                href="#"
                class="text-gray-700 hover:text-primary transition-colors"
                >Recommendations</a
              >
            </div>
          </div>
          <div class="flex items-center space-x-4">
            <div class="relative hidden md:block">
              <div
                class="flex items-center bg-gray-100 rounded-lg px-4 py-2 w-80"
              >
                <div class="w-5 h-5 flex items-center justify-center mr-3">
                  <i class="ri-search-line text-gray-500"></i>
                </div>
                <input
                  type="text"
                  placeholder="Search"
                  class="bg-transparent border-none outline-none flex-1 text-sm"
                />
              </div>
            </div>
            <button
              class="lg:hidden mobile-menu-button w-10 h-10 flex items-center justify-center rounded-lg hover:bg-gray-100"
            >
              <i class="ri-menu-line text-gray-700 text-xl"></i>
            </button>
          </div>
        </div>
      </div>
    </nav>
    <!-- Filter Overlay -->
    <div class="filter-overlay fixed inset-0 bg-black bg-opacity-50 z-40"></div>
    <!-- Filter Panel -->
    <div
      class="filter-panel fixed left-0 top-0 h-full w-80 bg-white shadow-xl z-50 overflow-y-auto"
    >
      <div class="p-6">
        <div class="flex items-center justify-between mb-6">
          <h3 class="text-lg font-semibold text-gray-900">Filters</h3>
          <button
            class="close-filter w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-100"
          >
            <i class="ri-close-line text-gray-500"></i>
          </button>
        </div>
        <!-- Brand Filter -->
        <div class="mb-6">
          <div
            class="flex items-center justify-between mb-3 cursor-pointer brand-toggle"
          >
            <div class="flex items-center">
              <div
                class="w-6 h-6 flex items-center justify-center mr-3 bg-blue-100 rounded"
              >
                <i class="ri-price-tag-3-line text-blue-600 text-sm"></i>
              </div>
              <span class="font-medium text-gray-900">Brand</span>
            </div>
            <div class="w-5 h-5 flex items-center justify-center">
              <i
                class="ri-arrow-down-s-line text-gray-500 brand-arrow transition-transform"
              ></i>
            </div>
          </div>
          <div class="brand-content ml-9 space-y-3">
            <div class="flex items-center">
              <div
                class="custom-checkbox mr-3"
                data-filter="blue-buffalo"
              ></div>
              <span class="text-sm text-gray-700">Blue Buffalo</span>
              <span class="text-xs text-gray-500 ml-auto">(24)</span>
            </div>
            <div class="flex items-center">
              <div class="custom-checkbox mr-3" data-filter="rachael-ray"></div>
              <span class="text-sm text-gray-700">Rachael Ray</span>
              <span class="text-xs text-gray-500 ml-auto">(18)</span>
            </div>
            <div class="flex items-center">
              <div class="custom-checkbox mr-3" data-filter="pedigree"></div>
              <span class="text-sm text-gray-700">Pedigree</span>
              <span class="text-xs text-gray-500 ml-auto">(32)</span>
            </div>
            <div class="flex items-center">
              <div class="custom-checkbox mr-3" data-filter="purina"></div>
              <span class="text-sm text-gray-700">Purina</span>
              <span class="text-xs text-gray-500 ml-auto">(45)</span>
            </div>
            <div class="flex items-center">
              <div class="custom-checkbox mr-3" data-filter="iams"></div>
              <span class="text-sm text-gray-700">Iams</span>
              <span class="text-xs text-gray-500 ml-auto">(28)</span>
            </div>
            <div class="flex items-center">
              <div class="custom-checkbox mr-3" data-filter="hills"></div>
              <span class="text-sm text-gray-700">Hill's Science Diet</span>
              <span class="text-xs text-gray-500 ml-auto">(16)</span>
            </div>
          </div>
        </div>
        <!-- Price Filter -->
        <div class="mb-6">
          <div
            class="flex items-center justify-between mb-3 cursor-pointer price-toggle"
          >
            <div class="flex items-center">
              <div
                class="w-6 h-6 flex items-center justify-center mr-3 bg-green-100 rounded"
              >
                <i
                  class="ri-money-dollar-circle-line text-green-600 text-sm"
                ></i>
              </div>
              <span class="font-medium text-gray-900">Price</span>
            </div>
            <div class="w-5 h-5 flex items-center justify-center">
              <i
                class="ri-arrow-up-s-line text-gray-500 price-arrow transition-transform"
              ></i>
            </div>
          </div>
          <div class="price-content ml-9">
            <div class="flex items-center justify-between mb-3">
              <span class="text-sm text-gray-600"
                >$<span id="min-price">0</span></span
              >
              <span class="text-sm text-gray-600"
                >$<span id="max-price">100</span></span
              >
            </div>
            <div class="relative">
              <input
                type="range"
                min="0"
                max="100"
                value="0"
                class="price-slider w-full h-2"
                id="price-range"
              />
            </div>
          </div>
        </div>
        <!-- Category Filter -->
        <div class="mb-6">
          <div class="flex items-center mb-4">
            <div
              class="w-6 h-6 flex items-center justify-center mr-3 bg-purple-100 rounded"
            >
              <i class="ri-list-check-line text-purple-600 text-sm"></i>
            </div>
            <span class="font-medium text-gray-900">Filter by</span>
          </div>
          <div class="ml-9 space-y-3">
            <div
              class="flex items-center p-2 rounded-lg hover:bg-green-50 transition-colors"
            >
              <div class="custom-checkbox mr-3" data-filter="food"></div>
              <div class="w-5 h-5 flex items-center justify-center mr-2">
                <i class="ri-restaurant-line text-green-600 text-sm"></i>
              </div>
              <span class="text-sm text-gray-700">Food</span>
              <span class="text-xs text-gray-500 ml-auto">(89,234)</span>
            </div>
            <div
              class="flex items-center p-2 rounded-lg hover:bg-orange-50 transition-colors"
            >
              <div class="custom-checkbox mr-3" data-filter="treats"></div>
              <div class="w-5 h-5 flex items-center justify-center mr-2">
                <i class="ri-cake-3-line text-orange-600 text-sm"></i>
              </div>
              <span class="text-sm text-gray-700">Treats</span>
              <span class="text-xs text-gray-500 ml-auto">(23,456)</span>
            </div>
            <div
              class="flex items-center p-2 rounded-lg hover:bg-blue-50 transition-colors"
            >
              <div class="custom-checkbox mr-3" data-filter="supplies"></div>
              <div class="w-5 h-5 flex items-center justify-center mr-2">
                <i class="ri-box-3-line text-blue-600 text-sm"></i>
              </div>
              <span class="text-sm text-gray-700">Supplies</span>
              <span class="text-xs text-gray-500 ml-auto">(16,692)</span>
            </div>
          </div>
        </div>
        <!-- Age Filter -->
        <div class="mb-6">
          <div class="flex items-center mb-4">
            <div
              class="w-6 h-6 flex items-center justify-center mr-3 bg-yellow-100 rounded"
            >
              <i class="ri-time-line text-yellow-600 text-sm"></i>
            </div>
            <span class="font-medium text-gray-900">Age</span>
          </div>
          <div class="ml-9 space-y-3">
            <div class="flex items-center">
              <div class="custom-checkbox mr-3" data-filter="puppy"></div>
              <span class="text-sm text-gray-700">Puppy</span>
              <span class="text-xs text-gray-500 ml-auto">(12,345)</span>
            </div>
            <div class="flex items-center">
              <div class="custom-checkbox mr-3" data-filter="adult"></div>
              <span class="text-sm text-gray-700">Adult</span>
              <span class="text-xs text-gray-500 ml-auto">(67,890)</span>
            </div>
            <div class="flex items-center">
              <div class="custom-checkbox mr-3" data-filter="senior"></div>
              <span class="text-sm text-gray-700">Senior</span>
              <span class="text-xs text-gray-500 ml-auto">(9,147)</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Main Content -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <!-- Header -->
      <!-- Product Grid -->
      <div
        class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 md:gap-6"
      >
        <!-- Product card -->
        
        <div
          class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden hover:shadow-md transition-shadow cursor-pointer product-card"
          onclick="openProductModal(this)"
          data-product-id="1"
        >
          <div class="aspect-square bg-gray-100 relative overflow-hidden">
            <img
              src="https://readdy.ai/api/search-image?query=Blue%20Buffalo%20Life%20Protection%20Formula%20dry%20dog%20food%20bag%20with%20premium%20natural%20ingredients%2C%20clean%20white%20background%2C%20professional%20product%20photography%2C%20high%20quality%20pet%20food%20packaging&width=300&height=300&seq=1&orientation=squarish"
              alt="Blue Buffalo Life Protection"
              class="w-full h-full object-cover object-top"
            />
          </div>
          <div class="p-4">
            <div class="text-sm text-gray-600 mb-1">Blue Buffalo</div>
            <h3 class="font-medium text-gray-900 mb-2">
              Life Protection Formula Natural Adult Dry Dog Food
            </h3>
            <div class="text-lg font-bold text-gray-900 mb-2">$324.99</div>
            <div class="flex items-center">
              <div class="flex items-center text-yellow-400 mr-2">
                <i class="ri-star-fill text-sm"></i>
                <i class="ri-star-fill text-sm"></i>
                <i class="ri-star-fill text-sm"></i>
                <i class="ri-star-fill text-sm"></i>
                <i class="ri-star-fill text-sm"></i>
              </div>
              <span class="text-sm text-gray-600">3,542</span>
            </div>
          </div>
        </div>
      <!-- Load More -->
      <div class="text-center mt-12">
        <button
          class="bg-primary text-white px-8 py-3 rounded-lg hover:bg-blue-600 transition-colors whitespace-nowrap !rounded-button"
        >
          Load More Products
        </button>
      </div>
    </div>
    <script id="mobile-menu">
      document.addEventListener("DOMContentLoaded", function () {
        const mobileMenuButton = document.querySelector(".mobile-menu-button");
        const closeMobileMenuButton = document.querySelector(".close-mobile-menu");
        const mobileMenu = document.querySelector(".mobile-menu");
        const mobileFilterButton = document.querySelector(".mobile-filter-button");
        function toggleMobileMenu() {
          mobileMenu.classList.toggle("hidden");
          document.body.style.overflow = mobileMenu.classList.contains("hidden")
            ? ""
            : "hidden";
        }
        mobileMenuButton.addEventListener("click", toggleMobileMenu);
        closeMobileMenuButton.addEventListener("click", toggleMobileMenu);
        mobileFilterButton.addEventListener("click", function () {
          toggleMobileMenu();
          setTimeout(() => {
            const filterToggleBtn = document.querySelector(".filter-toggle-btn");
            if (filterToggleBtn) {
              filterToggleBtn.click();
            }
          }, 300);
        });
      });
    </script>
    <script id="filter-panel-toggle">
      document.addEventListener("DOMContentLoaded", function () {
        const filterToggleBtn = document.createElement("button");
        filterToggleBtn.className = "filter-toggle-btn";
        filterToggleBtn.innerHTML =
          '<i class="ri-filter-3-line text-gray-600"></i><span class="text-sm font-medium text-gray-700">Filters</span>';
        document.body.appendChild(filterToggleBtn);
        const filterPanel = document.querySelector(".filter-panel");
        const filterOverlay = document.querySelector(".filter-overlay");
        const closeFilter = document.querySelector(".close-filter");
        function toggleFilter() {
          filterPanel.classList.toggle("open");
          filterOverlay.classList.toggle("open");
          filterToggleBtn.classList.toggle("open");
          document.body.style.overflow = filterPanel.classList.contains("open")
            ? "hidden"
            : "";
        }
        filterToggleBtn.addEventListener("click", toggleFilter);
        closeFilter.addEventListener("click", toggleFilter);
        filterOverlay.addEventListener("click", toggleFilter);
      });
    </script>
    <script id="filter-interactions">
      document.addEventListener("DOMContentLoaded", function () {
        const brandToggle = document.querySelector(".brand-toggle");
        const brandContent = document.querySelector(".brand-content");
        const brandArrow = document.querySelector(".brand-arrow");
        const priceToggle = document.querySelector(".price-toggle");
        const priceContent = document.querySelector(".price-content");
        const priceArrow = document.querySelector(".price-arrow");
        brandToggle.addEventListener("click", function () {
          brandContent.style.display =
            brandContent.style.display === "none" ? "block" : "none";
          brandArrow.style.transform =
            brandContent.style.display === "none" ? "rotate(0deg)" : "rotate(180deg)";
        });
        priceToggle.addEventListener("click", function () {
          priceContent.style.display =
            priceContent.style.display === "none" ? "block" : "none";
          priceArrow.style.transform =
            priceContent.style.display === "none" ? "rotate(0deg)" : "rotate(180deg)";
        });
        const priceRange = document.getElementById("price-range");
        const maxPriceDisplay = document.getElementById("max-price");
        priceRange.addEventListener("input", function () {
          maxPriceDisplay.textContent = this.value;
        });
        const checkboxes = document.querySelectorAll(".custom-checkbox");
        checkboxes.forEach((checkbox) => {
          checkbox.addEventListener("click", function () {
            this.classList.toggle("checked");
          });
        });
      });
    </script>
    <!-- Product Detail Modal -->
    <div id="product-modal" class="fixed inset-0 z-50 hidden">
      <div
        class="absolute inset-0 bg-black bg-opacity-50"
        onclick="closeProductModal()"
      ></div>
      <div class="absolute inset-0 overflow-y-auto">
        <div class="flex min-h-full items-center justify-center p-4">
          <div class="relative bg-white w-full max-w-5xl rounded-xl shadow-lg">
            <!-- Close button -->
            <button
              onclick="closeProductModal()"
              class="absolute right-4 top-4 w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-100"
            >
              <i class="ri-close-line text-gray-500 text-xl"></i>
            </button>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 p-6">
              <!-- Product Images -->
              <div class="space-y-4">
                <div
                  class="aspect-square bg-gray-100 rounded-lg overflow-hidden"
                >
                  <img
                    id="modal-main-image"
                    src=""
                    alt=""
                    class="w-full h-full object-cover object-top"
                  />
                </div>
                <div class="grid grid-cols-4 gap-4">
                  <div
                    class="aspect-square bg-gray-100 rounded-lg overflow-hidden cursor-pointer hover:opacity-75"
                  >
                    <img
                      src="https://readdy.ai/api/search-image?query=premium%20dog%20food%20package%20front%20view%2C%20professional%20studio%20lighting%2C%20clean%20white%20background&width=150&height=150&seq=11&orientation=squarish"
                      alt=""
                      class="w-full h-full object-cover object-top"
                    />
                  </div>
                  <div
                    class="aspect-square bg-gray-100 rounded-lg overflow-hidden cursor-pointer hover:opacity-75"
                  >
                    <img
                      src="https://readdy.ai/api/search-image?query=premium%20dog%20food%20package%20side%20view%20nutritional%20information%2C%20professional%20studio%20lighting&width=150&height=150&seq=12&orientation=squarish"
                      alt=""
                      class="w-full h-full object-cover object-top"
                    />
                  </div>
                  <div
                    class="aspect-square bg-gray-100 rounded-lg overflow-hidden cursor-pointer hover:opacity-75"
                  >
                    <img
                      src="https://readdy.ai/api/search-image?query=premium%20dog%20food%20kibbles%20closeup%20texture%2C%20professional%20food%20photography&width=150&height=150&seq=13&orientation=squarish"
                      alt=""
                      class="w-full h-full object-cover object-top"
                    />
                  </div>
                  <div
                    class="aspect-square bg-gray-100 rounded-lg overflow-hidden cursor-pointer hover:opacity-75"
                  >
                    <img
                      src="https://readdy.ai/api/search-image?query=happy%20dog%20eating%20premium%20dog%20food%2C%20lifestyle%20pet%20photography&width=150&height=150&seq=14&orientation=squarish"
                      alt=""
                      class="w-full h-full object-cover object-top"
                    />
                  </div>
                </div>
              </div>

              <!-- Product Info -->
              <div class="space-y-6">
                <div>
                  <p id="modal-brand" class="text-sm text-gray-600 mb-1"></p>
                  <h2
                    id="modal-title"
                    class="text-2xl font-bold text-gray-900 mb-2"
                  ></h2>
                  <div class="flex items-center mb-4">
                    <div class="flex items-center text-yellow-400 mr-2">
                      <i class="ri-star-fill"></i>
                      <i class="ri-star-fill"></i>
                      <i class="ri-star-fill"></i>
                      <i class="ri-star-fill"></i>
                      <i class="ri-star-fill"></i>
                    </div>
                    <span class="text-sm text-gray-600"
                      >4.8 (3,542 reviews)</span
                    >
                  </div>
                  <p
                    id="modal-price"
                    class="text-3xl font-bold text-gray-900"
                  ></p>
                </div>

                <!-- Size Selection -->
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-2"
                    >Size</label
                  >
                  <div class="grid grid-cols-3 gap-3">
                    <button
                      class="border rounded-lg px-4 py-2 text-sm font-medium hover:border-primary hover:text-primary"
                    >
                      15 lbs
                    </button>
                    <button
                      class="border rounded-lg px-4 py-2 text-sm font-medium hover:border-primary hover:text-primary"
                    >
                      30 lbs
                    </button>
                    <button
                      class="border rounded-lg px-4 py-2 text-sm font-medium hover:border-primary hover:text-primary"
                    >
                      45 lbs
                    </button>
                  </div>
                </div>

                <!-- Quantity -->
                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-2"
                    >Quantity</label
                  >
                  <div class="flex items-center w-32 border rounded-lg">
                    <button
                      class="w-10 h-10 flex items-center justify-center border-r hover:bg-gray-50"
                      onclick="updateQuantity(-1)"
                    >
                      <i class="ri-subtract-line"></i>
                    </button>
                    <input
                      type="text"
                      id="quantity"
                      value="1"
                      class="w-12 h-10 text-center border-none focus:outline-none"
                      readonly
                    />
                    <button
                      class="w-10 h-10 flex items-center justify-center border-l hover:bg-gray-50"
                      onclick="updateQuantity(1)"
                    >
                      <i class="ri-add-line"></i>
                    </button>
                  </div>
                </div>

                <!-- Actions -->
                <div class="flex space-x-4">
                  <button
                    class="flex-1 bg-primary text-white py-3 rounded-lg hover:bg-blue-600 transition-colors whitespace-nowrap !rounded-button"
                  >
                    Buy Now
                  </button>
                  <button
                    class="flex-1 border border-gray-300 text-gray-700 py-3 rounded-lg hover:bg-gray-50 transition-colors whitespace-nowrap !rounded-button"
                  >
                    Add to Cart
                  </button>
                </div>
              </div>
            </div>

            <!-- Tabs -->
            <div class="border-t">
              <div class="flex border-b">
                <button
                  class="px-6 py-4 text-sm font-medium text-primary border-b-2 border-primary"
                >
                  Description
                </button>
                <button
                  class="px-6 py-4 text-sm font-medium text-gray-500 hover:text-gray-700"
                >
                  Reviews
                </button>
                <button
                  class="px-6 py-4 text-sm font-medium text-gray-500 hover:text-gray-700"
                >
                  Q&A
                </button>
              </div>

              <!-- Description Tab -->
              <div class="p-6">
                <div class="prose max-w-none">
                  <p class="mb-4">
                    Blue Buffalo Life Protection Formula Natural Adult Dry Dog
                    Food is made with the finest natural ingredients enhanced
                    with vitamins and minerals. The formula starts with
                    high-quality protein from real meat, whole grains, garden
                    veggies and fruit.
                  </p>

                  <h4 class="font-medium mb-2">Key Benefits:</h4>
                  <ul class="list-disc pl-5 mb-4">
                    <li>
                      Essential, high-quality protein for healthy muscle
                      development
                    </li>
                    <li>Wholesome whole grains, garden veggies and fruit</li>
                    <li>No chicken (or poultry) by-product meals</li>
                    <li>No corn, wheat, soy or artificial preservatives</li>
                  </ul>

                  <h4 class="font-medium mb-2">Ingredients:</h4>
                  <p class="mb-4">
                    Deboned Chicken, Chicken Meal, Brown Rice, Barley, Oatmeal,
                    Pea Starch, Flaxseed (source of Omega 3 & 6 Fatty Acids),
                    Chicken Fat (preserved with Mixed Tocopherols), Dried Tomato
                    Pomace, Natural Flavor, Peas, Pea Protein...
                  </p>

                  <h4 class="font-medium mb-2">Guaranteed Analysis:</h4>
                  <ul class="list-disc pl-5">
                    <li>Crude Protein: 24.0% min</li>
                    <li>Crude Fat: 14.0% min</li>
                    <li>Crude Fiber: 5.0% max</li>
                    <li>Moisture: 10.0% max</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script id="product-modal-handlers">
      document.addEventListener("DOMContentLoaded", function () {
        let currentQuantity = 1;

        window.openProductModal = function (element) {
          const modal = document.getElementById("product-modal");
          const mainImage = element.querySelector("img").src;
          const brand = element.querySelector(".text-gray-600").textContent;
          const title = element.querySelector("h3").textContent;
          const price = element.querySelector(".font-bold").textContent;

          document.getElementById("modal-main-image").src = mainImage;
          document.getElementById("modal-brand").textContent = brand;
          document.getElementById("modal-title").textContent = title;
          document.getElementById("modal-price").textContent = price;

          modal.classList.remove("hidden");
          document.body.style.overflow = "hidden";
        };

        window.closeProductModal = function () {
          const modal = document.getElementById("product-modal");
          modal.classList.add("hidden");
          document.body.style.overflow = "";
        };

        window.updateQuantity = function (change) {
          const quantityInput = document.getElementById("quantity");
          currentQuantity = Math.max(1, parseInt(quantityInput.value) + change);
          quantityInput.value = currentQuantity;
        };
      });
    </script>
  </body>
</html>
