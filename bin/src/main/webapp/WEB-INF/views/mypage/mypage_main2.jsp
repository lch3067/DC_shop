<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Page</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css"
      rel="stylesheet"
    />
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              primary: "#0EA5E9",
              secondary: "#64748B",
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
      :where([class^="ri-"])::before { content: "\f3c2"; }
      .sidebar {
          width: 280px;
          height: 100vh;
          position: fixed;
          left: 0;
          top: 0;
          border-right: 1px solid #e5e7eb;
          background: white;
          overflow-y: auto;
      }
      .main-content {
          margin-left: 280px;
          min-height: 100vh;
          background: #f9fafb;
      }
    </style>
  </head>
  <body class="bg-gray-50">
    <div class="flex">
      <aside class="sidebar p-6">
        <div class="space-y-6">
          <div class="text-xl font-semibold">My Page</div>

          <div class="flex flex-col items-center text-center space-y-3 py-6">
            <div class="w-24 h-24 rounded-full bg-gray-200 overflow-hidden">
              <img
                src="https://readdy.ai/api/search-image?query=professional%20business%20portrait%20of%20a%20person%20wearing%20a%20suit%2C%20high%20quality%20studio%20lighting%2C%20clean%20background%2C%20professional%20headshot&width=200&height=200&seq=1&orientation=squarish"
                class="w-full h-full object-cover"
                alt="Profile"
              />
            </div>
            <div>
              <div class="font-medium">Sarah Johnson</div>
              <div class="text-sm text-gray-500">sarah.j@example.com</div>
            </div>
            <button
              class="text-sm text-primary hover:text-primary/80 !rounded-button"
            >
              Edit Profile
            </button>
          </div>

          <div class="space-y-2">
            <div
              class="text-xs font-medium text-gray-500 uppercase tracking-wider"
            >
              Shopping
            </div>
            <nav class="flex flex-col space-y-1">
              <a
                href="#"
                class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50"
              >
                <div
                  class="w-5 h-5 flex items-center justify-center text-gray-500"
                >
                  <i class="ri-shopping-bag-line"></i>
                </div>
                <span>Order History</span>
              </a>
              <a
                href="#"
                class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50"
              >
                <div
                  class="w-5 h-5 flex items-center justify-center text-gray-500"
                >
                  <i class="ri-heart-line"></i>
                </div>
                <span>Wishlist</span>
              </a>
              <a
                href="#"
                class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50"
              >
                <div
                  class="w-5 h-5 flex items-center justify-center text-gray-500"
                >
                  <i class="ri-shopping-cart-line"></i>
                </div>
                <span>Shopping Cart</span>
              </a>
              <a
                href="#"
                class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50"
              >
                <div
                  class="w-5 h-5 flex items-center justify-center text-gray-500"
                >
                  <i class="ri-file-list-line"></i>
                </div>
                <span>Posts & Reviews</span>
              </a>
            </nav>
          </div>

          <div class="space-y-2">
            <div
              class="text-xs font-medium text-gray-500 uppercase tracking-wider"
            >
              Account
            </div>
            <nav class="flex flex-col space-y-1">
              <a
                href="#"
                class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50"
              >
                <div
                  class="w-5 h-5 flex items-center justify-center text-gray-500"
                >
                  <i class="ri-user-settings-line"></i>
                </div>
                <span>Account Settings</span>
              </a>
              <a
                href="#"
                class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50"
              >
                <div
                  class="w-5 h-5 flex items-center justify-center text-gray-500"
                >
                  <i class="ri-lock-password-line"></i>
                </div>
                <span>Password Management</span>
              </a>
              <a
                href="#"
                class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50"
              >
                <div
                  class="w-5 h-5 flex items-center justify-center text-gray-500"
                >
                  <i class="ri-map-pin-line"></i>
                </div>
                <span>Address Management</span>
              </a>
              <a
                href="#"
                class="flex items-center space-x-3 px-4 py-3 rounded-lg hover:bg-gray-50"
              >
                <div
                  class="w-5 h-5 flex items-center justify-center text-gray-500"
                >
                  <i class="ri-logout-box-line"></i>
                </div>
                <span>Log Out</span>
              </a>
            </nav>
          </div>
        </div>
      </aside>

      <main class="main-content p-8">
        <div class="max-w-4xl mx-auto">
          <div class="bg-white rounded-lg shadow-sm p-6">
            <h2 class="text-xl font-semibold mb-6">Account Overview</h2>

            <div class="grid grid-cols-2 gap-6">
              <div class="space-y-4">
                <div class="text-sm font-medium text-gray-500">
                  Recent Orders
                </div>
                <div class="space-y-3">
                  <div
                    class="flex items-center justify-between p-4 border rounded-lg"
                  >
                    <div>
                      <div class="font-medium">Order #12345</div>
                      <div class="text-sm text-gray-500">August 24, 2025</div>
                    </div>
                    <div class="text-sm font-medium text-primary">$129.99</div>
                  </div>
                  <div
                    class="flex items-center justify-between p-4 border rounded-lg"
                  >
                    <div>
                      <div class="font-medium">Order #12344</div>
                      <div class="text-sm text-gray-500">August 20, 2025</div>
                    </div>
                    <div class="text-sm font-medium text-primary">$89.99</div>
                  </div>
                </div>
              </div>

              <div class="space-y-4">
                <div class="text-sm font-medium text-gray-500">
                  Wishlist Items
                </div>
                <div class="space-y-3">
                  <div
                    class="flex items-center space-x-4 p-4 border rounded-lg"
                  >
                    <div class="w-16 h-16 bg-gray-100 rounded-lg"></div>
                    <div>
                      <div class="font-medium">Premium Headphones</div>
                      <div class="text-sm text-gray-500">$199.99</div>
                    </div>
                  </div>
                  <div
                    class="flex items-center space-x-4 p-4 border rounded-lg"
                  >
                    <div class="w-16 h-16 bg-gray-100 rounded-lg"></div>
                    <div>
                      <div class="font-medium">Wireless Mouse</div>
                      <div class="text-sm text-gray-500">$49.99</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
