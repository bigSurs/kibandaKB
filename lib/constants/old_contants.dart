// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:kwik_basket_customer/pages/auth_module/forgot_password/forgot_password_page.dart';
// import 'package:kwik_basket_customer/pages/auth_module/otp/new_otp_page.dart';
// import 'package:kwik_basket_customer/pages/auth_module/otp/otp_page.dart';
// import 'package:kwik_basket_customer/pages/auth_module/privacy_policy_terms_conoditions/privacy_policy_page.dart';
// import 'package:kwik_basket_customer/pages/auth_module/privacy_policy_terms_conoditions/terms_conditions.dart';
// import 'package:kwik_basket_customer/pages/auth_module/sign_in/new_sign_in_page.dart';
// import 'package:kwik_basket_customer/pages/auth_module/sign_in/sign_in_page.dart';
// import 'package:kwik_basket_customer/pages/auth_module/sign_up/new_sign_up_page.dart';
// import 'package:kwik_basket_customer/pages/auth_module/sign_up/second_sign_up_page.dart';
// //import 'package:kwik_basket_customer/pages/auth_module/sign_up/sign_up_page.dart';
// import 'package:kwik_basket_customer/pages/no_internet/no_internet_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/cart_page/cart_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/cart_page/delivery_details_page/delivery_address_list_page/delivery_address_list_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/cart_page/delivery_details_page/delivery_details_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/cart_page/order_summary_page/order_success_page/order_success_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/cart_page/order_summary_page/order_summary_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/cart_page/payment_option_page/payment_option_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/main_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/order_page/order_details_page.dart/edit_order_page/edit_order_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/order_page/order_details_page.dart/order_details_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/product_list_page/product_details_page/product_details_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/product_list_page/product_listing_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/product_search_page.dart/product_search_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/about_us_page/about_us_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/account_details_page/account_details_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/account_details_page/change_password_page.dart/change_password_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/address_page/add_address_page/add_address_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/address_page/address_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/address_search_page/address_search_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/my_basket_page/my_basket_details_page.dart/basket_details_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/my_basket_page/my_basket_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/need_help_page/need_help_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/reward_point_page/wallet_credit_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/sub_users_page/add_sub_users_page/add_sub_users_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/sub_users_page/assign_order_approval_page/assign_order_approval_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/sub_users_page/sub_users_page.dart';
// import 'package:kwik_basket_customer/pages/shop_module/profile_page/transaction_page/transaction_page.dart';
// import 'package:kwik_basket_customer/pages/splash/boarding_page/boarding_page.dart';

// class Constants {
//   static const appName = 'Kwik Basket';
//   static const cartTableName = 'cartTable';
//   static const price_symbole = "KES";
//   static const tax_Name = "VAT 32";
//   static const font_size_normal = 14.0;
//   static const font_size_big = 17.0;
//   static const delete_basket = 'Delete item';
//   static const submit_button = "Submit";
//   static const title_accept_order = "Accept order";
//   static const approve_button = "Approved";
//   static const reject_button = "Rejected";
//   static const edit_order_button = "Edit order";
//   static const accept_button = "Accept";
//   static const reorder_button = "Re-order";
//   static const basket_add_cart_msg = "Basket Added";

//   static const message_no_net = 'Network connection required to fetch data.';
//   static const android_app_id = 'com.kwikbasket.customer';
//   static const ios_app_id = '';

//   static const native_go_to_main_page = 'native_go_to_main_page';

//   static const image_unavailable = "assets/unavailable.png";
//   static const lorem = "lorem";

//   static GlobalKey<NavigatorState> navigatorKey =
//       new GlobalKey<NavigatorState>();

//   static const padding = EdgeInsets.all(16);
//   static const heightSizeBox = SizedBox(height: 8);
//   static const widthSizeBox = SizedBox(width: 8);

//   static const root_icon = 'assets/icon/';
//   static const ic_launcher = '$root_icon' + 'ic_launcher.png';
//   static const app_logo = '$root_icon' + 'app_logo.png';
//   static const kwik_logo = '$root_icon' + 'kwik_logo.png';
//   static const kwik_icon = '$root_icon' + 'kwik_icon.png';
//   static const login_bg = '$root_icon' + 'login_bg.webp';
//   static const ic_double_arrow_back = '$root_icon' + 'ic_double_arrow_back.png';
//   static const ic_profile_bg = '$root_icon' + 'profile_bg.png';
//   static const ic_cod = '$root_icon' + 'cod_icon.png';
//   static const empty_cart_img = '$root_icon' + 'empty_cart.png';
//   static const ic_wire = '$root_icon' + 'wire.png';
//   static const no_internet = '$root_icon' + 'no_internet.png';
//   static const ic_mpesa = '$root_icon' + 'mpesa.png';
//   static const ic_order = '$root_icon' + 'ic_order.png';
//   static const ic_delivery_man = '$root_icon' + 'ic_delivery_man.png';
//   static const ic_grocery_bag = '$root_icon' + 'ic_grocery_bag.png';
//   static const fruits_image = '$root_icon' + 'Fruits.png';
//   static const vegetables_image = '$root_icon' + 'vegetables.png';
//   static const asian_vegetables_image = '$root_icon' + 'Asian_Vegetables.png';
//   static const dry_groceries_image = '$root_icon' + 'DryGrocery.png';
//   static const fresh_juices_image = '$root_icon' + 'Fresh_juices.png';
//   static const herbs_image = '$root_icon' + 'Herbs.png';
//   static const leafy_vegetables_image = '$root_icon' + 'Leafy_Vegetables.png';
//   static const name_background_image = '$root_icon' + 'name_background.png';

//   static const email_pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

//   //sign_in_page
//   static const login = "Login";
//   static const enter_your_details_to_login = "Enter your details to Login";
//   static const enter_email_id = "Enter your e-mail Id";
//   static const enter_password = "Enter your Password";
//   static const border_radius = 8.0;
//   static const forgot_password = "Forgot Password?";
//   static const reset_here = "Reset here";
//   static const login_button_text = "Login to your account";
//   static const next_text = "Next";
//   static const not_have_account = "Don't have an account yet? ";
//   static const sign_up = "Sign Up now";
//   static const log_in = "Login";
//   static const enter_valid_email_id = "Please enter valid email id.";
//   static const enter_valid_password = "Please enter valid Password";

//   //boarding_page
//   static const button_shop_now = "SHOP NOW";
//   static const bording_image_list = [
//     Constants.ic_grocery_bag,
//     Constants.ic_delivery_man,
//   ];
//   static const bording_details = [
//     {
//       "title": "Vegetables at a click",
//       "description":
//           "Beat the traffic and queues and gat vegetables and fruits with few touches",
//     },
//     {
//       "title": "Happiness Delivered",
//       "description":
//           "Get Delivery right at your doorsteps at your preferred time",
//     },
//   ];

//   //forgot_password_page
//   static const title_reset_password = "Reset Password";
//   static const reset_password =
//       "Enter the email id associated with your kwikbasket account, we will send the necessary instructions to reset your password.";
//   static const reset_password_button = "Send instructions";
//   static const reset_password_1 = "Has your email id changed ?";
//   static const reset_password_2 =
//       "If the email id associated with your kwikbasket account has changed, you may contact our";
//   static const reset_password_3 = " customer support ";
//   static const reset_password_4 = "to help restore access to our account.";

//   //no_internet_page
//   static const location_permission_msg =
//       "Please enable GPS to get current location";
//   static const no_connection = "No Connection !";
//   static const no_connection_msg =
//       "No internet connection found. Check yout connnection or try again.";
//   static const try_again_button = "Try Again";

//   //sign_up_page
//   static const title_sign_up = "SignUp";
//   static const first_name = "First Name";
//   static const last_name = "Last Name";
//   static const email = "E-mail";
//   static const password = "Password";
//   static const confirm_password = "Confirm Password";
//   static const phone_number_code = "+254";
//   static const phone_number = "Phone Number";
//   static const customer_type = "Customer Type";
//   static const company_name = "Company Name";
//   static const company_address = "Company Address";
//   static const address1 = "Address Line 1";
//   static const address2 = "Address Line 2 (Optional)";
//   static const location = "Geolocation";
//   static const account_manager_name = "Account Manager Name";
//   static const i_accept = "I Accept ";
//   static const terms = "Terms";
//   static const and = " and ";
//   static const policy = "Policy";
//   static const sign_up_button = "Sign up";
//   static const already_have_account = "Already have an account ? ";
//   static const sign_in = "Sign in";
//   static const enter_valid_first_name = "Please enter valid first name.";
//   static const enter_valid_last_name = "Please enter valid last name.";
//   static const enter_valid_email = "Please enter valid email.";
//   static const enter_valid_confirm_password =
//       "Please enter valid confirm password.";
//   static const match_confirm_password =
//       "Confirm password not match with password.";
//   static const enter_valid_phone_number = "Please enter valid phone number.";
//   static const enter_valid_phone_digits = "Phone number must be of 11 digits!";
//   static const enter_valid_customer_type = "Please select valid customer type.";
//   static const enter_valid_company_name = "Please enter valid company name.";
//   static const enter_valid_address = "Please enter valid address.";
//   static const enter_valid_location = "Please enter location.";
//   static const enter_valid_account_manager =
//       "Please select valid account manager name.";
//   static const accept_t_and_p = "Please accept Terms and Policy.";
//   static const vatNumber = 'VAT Number';

//   //otp_page
//   static const title_verify_otp = "Verify Your OTP";
//   static const enter_otp = "Enter OTP !";
//   static const enter_valid_otp = "Please enter valid OTP !";
//   static const verify_otp_button = "Verify and Proceed ";
//   static const font_size_large = 30.0;
//   static const resend_otp = " Didn't receive any code yet? ";
//   static const resend_code = "Resend code";
//   static const sub_instructions = " Enter the code below for verification:";
//   static const otp_instructions =
//       " We have sent a 4 digit code to your regstered email id and phone number. ";

//   //main_page
//   static const search_product = "Search Your Products Here ";

//   //home_page
//   static const categories = "Categories";
//   static const view_all = "View all";
//   static const fruits = "Fruits";
//   static const vegetables = "Vegetables";
//   static const dry_groceries = "Dry Groceries";
//   static const fresh_juices = " Fresh Juices";
//   static const herbs = "Herbs";
//   static const leafy_vegetables = "Leafy vegetables";
//   static const asian_vegetables = "Asian Vegetables";
//   static const username = "John";
//   static const greetings = "Hello $username";
//   static const choose_category =
//       "Choose the product of your need from the categories below:";
//   static const item_count = "54 Items";
//   static const per = " per ";
//   static const product_quantity = " Quantity: ";

//   //cart_page
//   static const title_cart = "Cart";
//   static const totle = "Total";
//   static const forgot_something = "Forgot something?";
//   static const click_here = "Click here";
//   static const add_more_product = " to Add more products";
//   static const checkout_button = "Checkout";
//   static const free_delivery = "Yay! Free Delivery";
//   static const empty_cart_msg = "Uh oh... that\'s an empty cart!";
//   static const start_shopping_button = "Let\'s add some items";

//   //profile_page
//   static const account_details_profile = {
//     "title": "Account Details",
//     "subtitle": "Manage your personal information"
//   };
//   static const sub_users_profile = {
//     "title": "Sub Users",
//     "subtitle": "Manage all sub users"
//   };
//   static const address_profile = {
//     "title": "Address",
//     "subtitle": "Update, delete or add new address"
//   };
//   static const orders_profile = {
//     "title": "Orders",
//     "subtitle": "Track and accept orders"
//   };
//   static const cart_profile = {
//     "title": "Cart",
//     "subtitle": "Manage your products"
//   };
//   static const wallet_profile = {
//     "title": "wallet",
//     "subtitle": "Check your available balance"
//   };
//   static const reward_point_profile = {
//     "title": "Reward Points",
//     "subtitle": "You can check the reward transactions"
//   };
//   static const returns_profile = {
//     "title": "Returns",
//     "subtitle": "Track yout returns"
//   };
//   static const need_help_profile = {
//     "title": "Need Help?",
//     "subtitle": "Guide through the application"
//   };
//   static const call_us_profile = {
//     "title": "Call Us",
//     "subtitle": "Queries, contact here"
//   };
//   static const rate_us_profile = {
//     "title": "Rate Us",
//     "subtitle": "Rate the app"
//   };
//   static const share_profile = {
//     "title": "Share",
//     "subtitle": "Share in social media, mail etc"
//   };
//   static const about_us_profile = {
//     "title": "About Us",
//     "subtitle": "Privacy policy"
//   };
//   static const logout_profile = {
//     "title": "Logout",
//     "subtitle": "Logout from this device"
//   };
//   static const my_basket = {
//     "title": "My Basket",
//     "subtitle": "Manage your Basket"
//   };
//   static const my_transactions = {
//     "title": "My Transactions",
//     "subtitle": "Manage your transactions"
//   };
//   static const title_other = "Other";

//   //my_basket_page
//   static const title_my_basket = "Baskets";
//   static const no_basket = "No Baskets yet!";
//   static const no_product_basket = "No Products in Baskets yet!";
//   static const add_selection_to_cart = "Add Selection To Cart";
//   static const add_all_to_cart = "Add All Products To Cart";
//   static const add_to_cart = "Add to Cart";
//   static const view_basket = "View Basket";
//   static const access_basket = "You  may access your saved baskets here: ";
//   static const search_basket = "Search Your Basket Here";

//   //sub_users_page
//   static const title_sub_users = "Sub Users";
//   static const order_approval_button = "Assign Order Approvals";
//   static const no_sub_users =
//       "You Don't have Sub Users. \n Click on plus icon to add sub users.";

//   //add_sub_users_page
//   static const title_add_sub_users = "Add Sub User";
//   static const save_button = "SAVE";
//   static const first_name_subUser = "Contact Person First Name";
//   static const last_name_subUser = "Contact Person Last Name";
//   static const email_subUser = "Branch Email";
//   static const branch_name_subUser = "Branch Name";
//   static const branch_address_subUser = "Branch Address";
//   static const branch_location_subUser = "Branch Location";
//   static const oreder_approval_subUser = "Order Approval Required:";

//   //assign_order_approval_page
//   static const title_assign_order_approvals = "Assign Order Approvals";
//   static const first_level_approver = "First Level Approver";
//   static const second_level_approver = "Second Level Approver";

//   //account_details_page
//   static const title_account_details = "My Account";
//   static const tax_no = "Tax No";
//   static const change_password = "Change Password";
//   static const notification_settings = "Notification Settings";
//   static const sms_notification = "SMS Notification";
//   static const mobile_notification = "Mobile Notification";
//   static const email_notification = "Email Notification";
//   static const update_massage = "Successfully updated your profile";

//   //change_password_page
//   static const title_change_password = "Change Password";
//   static const change_password_heading = "CHANGE PASSWORD";

//   //address_page
//   static const title_address = "My Addresses";
//   static const no_address = "No Address";

//   //add_address_page
//   static const title_add_address = "Add Addresses";
//   static const title_update_address = "Update Addresses";
//   static const type_of_address = "Type of your Address";
//   static const home_type_address = "Home";
//   static const office_type_address = "Office";
//   static const others_type_address = "Others";
//   static const name_address = "Name";
//   static const enter_valid_name = "Enter Valid Name";
//   static const house_no = "House No. and Building Name";
//   static const enter_valid_house_no = "House No. and Building Name required";
//   static const street_address = "Street Address/Company Name/P.O.Box";
//   static const enter_valid_street_address = "Enter valid details";
//   static const add_address_button = "ADD ADDRESS";
//   static const update_address_button = "UPDATE ADDRESS";
//   static const add_delivery_address = "Add Delivery Address";

//   //delivery_address_list_page
//   static const title_delivery_address_list = "Address List";
//   static const deliver_here_button = "Deliver Here";

//   //reward_point_page
//   static const title_reward_point = "My Reward Points";
//   static const your_balance = "Your balance";
//   static const reward_points = "Reward Points";

//   //rate_us_dialog
//   static const title_rate_us = "Rate Us";
//   static const how_like = "How did you like us?";
//   static const meh = "Meh!";
//   static const loved_it = "Loverd It!";
//   static const title_rate_app = "Rate App";
//   static const give_start = "Mind giving us a 5 start rating?";
//   static const nope_button = "Nope";
//   static const yeah_button = "Yeah Sure!";

//   //about_us_page
//   static const title_about_us = "About Us";
//   static const about_us_version = "Version 1.0.0";
//   static const about_us_description =
//       "Kwik basket connects farmers with institutions for buying farm produce directly at competitive pricingand subscription based orders.";
//   static const privacy_policy = "Privacy Policy";
//   static const terms_conditions = "Terms & Conditions";
//   static const read_below = "Read Below";

//   //add_notes_dialog
//   static const add_product_notes = "Add Product Note";
//   static const add_order_notes = "Add Order Note";
//   static const write_your_notes = "Write your note here";
//   static const add_button = "ADD";
//   static const enter_qty = "Please enter valid product quantity";
//   static const enter_valid_cart_qty =
//       'minimum oreder quantity should not be "0"';

//   //clear_cart_dialog
//   static const are_you_sure = "Are you sure?";
//   static const remove_all_message = "You want to remove all cart items";
//   static const yes_button = "YES";

//   //order_page
//   static const view_details_button = "VIEW DETAILS";
//   static const order_cancelled = "ORDER CANCELLED";
//   static const parent_user_email = "Parent User Email : ";
//   static const first_level_email = "First Level Approveal : ";
//   static const Second_level_email = "First Level Approveal : ";

//   //order_details_page
//   static const title_order_details = "Order Details";
//   static const order_notes = "Order Notes";
//   static const order_summary = "ORDER SUMMARY";
//   static const delivery_address = "Delivery Address";
//   static const your_savings = "Your Total Savings";
//   static const cancel_order_button = "Cancel Order";
//   static const cancel_button = "Cancel";
//   static const canclePaymentMessage =
//       "IF you have already paid for the order, your wallet balance will be automatically applied against your next order";
//   static const delivery_by = "Delivery By";

//   //edit_order_page
//   static const title_edit_order = "Edit Order";
//   static const update_now_button = "Update Now";

//   //delivery_details_page
//   static const title_delivery_address = "Address, Date & Time";
//   static const delivery_date_time = "Delivery Date & Time";
//   static const delivery_charges = "Delivery Charges";
//   static const select_time_slot = "please select delivery time slot";
//   static const select_delivery_address = "please add delivery address";
//   static const default_time_slot = "Select Time Slot";

//   //need_help_page
//   static const title_need_help = "Need Help?";

//   //payment_option_page
//   static const title_payment_option = "Payment Option";
//   static const place_order_button = "Place Order";
//   static const apply_button = "Apply";
//   static const enter_reward_point = "Enter Reward Points";
//   static const enter_valid_reward_point = "Please enter Reward Points";
//   static const enter_coupon_code = "Enter coupon code here";
//   static const enter_valid_coupon_code = "Please enter coupon code";
//   static const message_coupon_code =
//       "* Some coupon codes are applicable on some categories or products.";
//   static const subtotal = "Subtotal";
//   static const amount_payable = "Amount Payable";
//   static const include_vat = "(Inclusive of VAT where applicable)";
//   static const applied_successfully = "Applied Successfully";
//   static const ok_button = "OK";
//   static const valid_reward_point_dialog =
//       "Please enter valid amount of reward points to use! ";
//   static const valid_coupon_dialog =
//       "Coupon is either invalid, expired or reached its usage limit! ";

//   static const product_not_found = "No Products";
//   static const no_data = "No Data";

//   //address_search_page
//   static const search = "Search";

//   //order_summary_page
//   static const title_order_summary = "Order Summary";
//   static const mode_of_payment = "Mode of Payment :";
//   static const confirm_order_button = "Confirm the Order";
//   static const proceed_payment_button = "Proceed to Payment";
//   static const free = "FREE";

//   //order_success_page
//   static const title_thanks = "Thanks";
//   static const successful_order = "Yay! Order Successfully Placed";
//   static const error_order = "Ohh! Order Failed Please Try Again";
//   static const scheduled_date_time = "Scheduled Date and Time";
//   static const checked_order_status_button = "Check Order Status";
//   static const continue_shopping_button = "Continue Shopping";

//   //transaction_page
//   static const title_transaction = "My Transactions";
// }

// class PageRoutes {
//   //static const String sign_in_page = '/signInPage';
//   static const String new_sign_in = '/newSignIn';
//   static const String sign_up_page = '/signUpPage';
//   static const String second_sign_up_page = '/secondSignUp';
//   static const String forgot_password_page = '/forgotPasswordPage';
//   static const String new_otp_page = '/newOtp';
//   static const String main_page = '/mainPage';
//   static const String cart_page = '/cartPage';
//   static const String sub_users_page = '/subUsersPage';
//   static const String add_sub_users_page = '/addSubUsersPage';
//   static const String assign_order_approval_page = '/assignOrderApprovalPage';
//   static const String account_details_page = '/accountDetailsPage';
//   static const String change_password_page = '/changePasswordPage';
//   static const String address_page = '/addressPage';
//   static const String add_address_page = '/addAddressPage';
//   static const String reward_point_page = '/rewardPointPage';
//   static const String about_us_page = '/aboutUsPage';
//   static const String product_lisiting_page = '/productListingPage';
//   static const String product_details_page = '/productDetailsPage';
//   static const String privacy_policy_page = '/privacyPolicyPage';
//   static const String terms_conditions_page = '/termsConditionPage';
//   static const String need_help_page = '/needHelpPage';
//   static const String order_details_page = '/orderDetailsPage';
//   static const String delivery_details_page = '/deliveryDetailsPage';
//   static const String payment_option_page = '/paymentOptionPage';
//   static const String no_internet_page = '/noInternetPage';
//   static const String address_search_page = '/addressSearchPage';
//   static const String delivery_address_list_page = '/deliveryAddressListPage';
//   static const String order_summary_page = '/orderSummaryPage';
//   static const String order_success_page = '/orderSuccessPage';
//   static const String edit_order_page = '/editOrderPage';
//   static const String my_basket_page = '/myBasketPage';
//   static const String basket_details_page = '/basketDetailsPage';
//   static const String product_search_page = '/productSearchPage';
//   static const String transaction_page = '/transactionPage';
//   static const String boarding_page = '/boardingPage';

//   static final Map<String, WidgetBuilder> pageRoutes = {
//     //sign_in_page: (ctx) => SignInPage(),
//     new_sign_in: (ctx) => NewSignInPage(),

//     sign_up_page: (ctx) => SignUpPage(),
//     second_sign_up_page: (ctx) => SecondSignUpPage(),
//     forgot_password_page: (ctx) => ForgotPasswordPage(),
//     cart_page: (ctx) => CartPage(),
//     sub_users_page: (ctx) => SubUsersPage(),
//     add_sub_users_page: (ctx) => AddSubUsersPage(),
//     assign_order_approval_page: (ctx) => AssignOrderApprovalPage(),
//     account_details_page: (ctx) => AccountDetailsPage(),
//     change_password_page: (ctx) => ChangePasswordPage(),
//     address_page: (ctx) => AddressPage(),
//     reward_point_page: (ctx) => RewardPointPage(),
//     about_us_page: (ctx) => AboutUsPage(),
//     my_basket_page: (ctx) => MyBasketPage(),
//     privacy_policy_page: (ctx) => PrivacyPolicyPage(),
//     terms_conditions_page: (ctx) => TermsConditionsPage(),
//     delivery_details_page: (ctx) => DeliveryDetailsPage(),
//     payment_option_page: (ctx) => PaymentOptionPage(),
//     need_help_page: (ctx) => NeedHelpPage(),
//     no_internet_page: (ctx) => NoInternetPage(),
//     address_search_page: (ctx) => AddressSearchPage(),
//     delivery_address_list_page: (ctx) => DeliveryAddressListPage(),
//     order_summary_page: (ctx) => OrderSummaryPage(),
//     transaction_page: (ctx) => TransactionPage(),
//     boarding_page: (ctx) => BoardingPage(),
//     edit_order_page: (ctx) => EditOrderPage(),
//   };

//   static final Function onGenerateRoute = (settings) {
//     if (settings.name == main_page) {
//       final Map<String, dynamic> args = settings.arguments;
//       int index = 0;
//       if (args != null) {
//         index = args['index'];
//       }
//       return MaterialPageRoute(
//         builder: (context) {
//           return MainPage(
//             index: index,
//           );
//         },
//       );
//     } else if (settings.name == product_search_page) {
//       final Map<String, dynamic> args = settings.arguments;
//       bool isOrderSearch = false;
//       if (args != null) {
//         isOrderSearch = args['isOrderSearch'];
//       }
//       return MaterialPageRoute(
//         builder: (context) {
//           return ProductSearchPage(isOrderSearch: isOrderSearch);
//         },
//       );
//     } else if (settings.name == product_lisiting_page) {
//       final Map<String, dynamic> args = settings.arguments;
//       return MaterialPageRoute(
//         builder: (context) {
//           return ProductListPage(
//             categoryDetails: args['categoryDetails'],
//           );
//         },
//       );
//     } else if (settings.name == product_details_page) {
//       final Map<String, dynamic> args = settings.arguments;
//       return MaterialPageRoute(
//         builder: (context) {
//           return ProductDetailsPage(
//             variations: args['variations'],
//             productStoreId: args['productStoreId'],
//             productName: args['productName'],
//             storeId: args['storeId'],
//             product: args['product'],
//           );
//         },
//       );
//     } else if (settings.name == new_otp_page) {
//       final Map<String, dynamic> args = settings.arguments;
//       return MaterialPageRoute(
//         builder: (context) {
//           return NewOtpPage(
//             isLogin: args["isLogin"],
//             signUpBody: args["signUpData"],
//           );
//         },
//       );
//     } else if (settings.name == order_success_page) {
//       final Map<String, dynamic> args = settings.arguments;
//       return MaterialPageRoute(
//         builder: (context) {
//           return OrderSuccessPage(
//             isError: args["isError"],
//           );
//         },
//       );
//     } else if (settings.name == order_details_page) {
//       final Map<String, dynamic> args = settings.arguments;
//       return MaterialPageRoute(
//         builder: (context) {
//           return OrderDetailsPage(
//             orderData: args["orderData"],
//           );
//         },
//       );
//     } else if (settings.name == basket_details_page) {
//       final Map<String, dynamic> args = settings.arguments;
//       return MaterialPageRoute(
//         builder: (context) {
//           return BasketDetailsPage(
//             wishlist: args["wishlist"],
//           );
//         },
//       );
//     } else if (settings.name == add_address_page) {
//       final Map<String, dynamic> args = settings.arguments;
//       return MaterialPageRoute(
//         builder: (context) {
//           if (args == null) {
//             return AddAddressPage();
//           }
//           return AddAddressPage(
//             addressData: args["addressData"],
//           );
//         },
//       );
//     }
//   };
// }

// class APIRoutes {
//   static const String api_url = 'https://dev.shop.kwikbasket.com';
//   static const map_api_key = "AIzaSyCiMBCIxWmuh1TVf4u6xJzYZS_xhFe04so";
//   // ignore: non_constant_identifier_names
//   static var x_user_header = {'X-User': 'customer'};
//   static String storeIdKwikBasket = "75";
//   static String storeId = "75";
//   static String storeName = "KwikBasket";

//   static const super_admin = r"apiadmin:Kwik$Admin#2020";
//   // ignore: non_constant_identifier_names
//   static final basic_token_header = {
//     'Authorization': 'Basic ${base64.encode(utf8.encode(super_admin))}',
//   };
//   static const super_admin_jupiter = r"superadmin:Jupiter@251019";
//   // ignore: non_constant_identifier_names
//   static final basic_token_header_jupiter = {
//     'Authorization': 'Basic ${base64.encode(utf8.encode(super_admin_jupiter))}',
//   };

//   //auth_provider
//   static const String api_sign_in = '/index.php?path=api/customer/login';
//   static const String api_sign_up = '/api/customer/signup/signupByOtp';
//   static const String api_get_account_manager =
//       '/api/customers/getAccountManagers';
//   static const String api_get_customer_group =
//       '/api/customers/getCustomerGroups';
//   static const String api_forgot_password =
//       '/api/forgetpassword/ForgotPassword';
//   static const String api_sign_up_otp_verify =
//       '/api/customer/signup/signupVerifyOtp';
//   static const String api_post_sendNewDevice_OTP =
//       '/api/customer/account/SendNewDeviceotp';
//   static const String api_post_verifyNewDevice_OTP =
//       '/api/customer/account/VerifyNewDeviceotp';
//   static const String api_post_newCustomerDevice =
//       '/api/customer/login/NewCustomerDevice';

//   //address_provider
//   static const String api_all_address = '/api/customer/address/alladdress';
//   static const String api_delete_address = '/api/customer/address/address';
//   static const String api_add_address = '/api/customer/address/address';

//   //cart_provider
//   static const String api_post_validate_order =
//       '/api/customer/order/validateOrder';
//   static const String api_post_add_cart = "/api/cart/addcartproducts";
//   static const String api_get_cart_list = "/api/cart/getcartproducts";

//   //category_provider
//   static const String api_get_categories = '/api/categories/categories';

//   //delivery_method_provider
//   static const String api_get_delivery_method =
//       '/api/customer/stores/storeshippingmethods';
//   static const String api_get_delivery_dateTime =
//       '/api/customer/checkout/deliverytimeslot';
//   static const String api_get_payment_method =
//       '/api/customer/checkout/paymentmethods';

//   //product_details_provider
//   static const String api_get_product_details =
//       '/api/customer/products/productdetails';

//   //product_provider
//   static const String api_get_product = '/api/customer/products';

//   //store_provider
//   static const String api_get_store = '/api/stores/Stores';

//   //subuser_provider
//   static const String api_get_subusers = '/api/customer/subusers/SubUsers';
//   static const String api_post_subusers = '/api/customer/subusers/NewSubUser';
//   static const String api_subusers_orderApproval =
//       '/api/customer/subusers/assignsubcustomerorderapprovalbysubcustomerid';
//   static const String api_subusers_active =
//       '/api/customer/subusers/ActivateSubUsers';
//   static const String api_delete_subuser =
//       '/api/customer/subusers/deleteSubUser';
//   static const String api_unique_email = '/api/customer/subusers/EmailUnique/';
//   static const String api_post_assign_approval =
//       '/api/customer/subusers/assignorderapprovals';

//   //user_details_provider
//   static const String api_change_password =
//       '/api/forgetpassword/changepassword';
//   static const String api_get_userDetails = '/api/customer/account/userdetails';
//   static const String api_post_notification_setting =
//       '/api/customer/user_notification_settings/CustomerNotificationSettings';
//   static const String api_get_notification_setting =
//       '/api/customer/user_notification_settings/CustomerNotificationSettings';
//   static const String api_put_userdetails = '/api/customer/account/userdetails';

//   //user_rewards_provider
//   static const String api_get_user_rewards =
//       "/api/customer/account/userRewards";
//   static const String api_apply_user_rewards =
//       "/api/customer/checkout/applyreward";
//   static const String api_apply_coupon = "/api/customer/checkout/applycoupon";

//   //order_provider
//   static const String api_post_validate_order_details =
//       "/api/customer/order/validateOrderDetail";
//   static const String api_post_place_order = "/api/customer/order";
//   static const String api_post_missing_order =
//       "/api/customer/order/missingOrder";
//   static const String api_post_order_status =
//       "/api/customer/order/orderStatusByReferenceId";
//   static const String api_post_order_cancel = "/api/customer/order/ordercancel";

//   //order_list_provider
//   static const String api_get_order_list = "/api/customer/order/orders";

//   //wishlist_provider
//   static const String api_get_wishlist = "/api/customer/wishlist/UserList";
//   static const String api_delete_wishlist =
//       "/api/customer/wishlist/deleteWishlist";
//   static const String api_get_wishlist_details =
//       "/api/customer/wishlist/UserListProduct";
//   static const String api_update_wishlist_details =
//       "/api/customer/wishlist/WishlistProduct";
//   static const String api_delete_wishlist_details =
//       "/api/customer/wishlist/deleteWishlistProduct";
//   static const String api_create_wishlist =
//       "/api/customer/wishlist/CreateWishlistWithProduct";

//   //product_search_provider
//   static const String api_post_product_search =
//       "/api/customer/products/productsearch";

//   //order_details_proviedr
//   static const String api_get_order_details = "/api/customer/order/order";
//   static const String api_post_edit_order =
//       "/api/customer/order/editOrderWithNewitemAndQuantity";
// }
