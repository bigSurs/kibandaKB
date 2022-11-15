import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kibanda_kb/utilities/rest_client/rest_client.dart';
// import 'package:kibanda_kb/utilities/utils/utils.dart';


class Constants {
  static const appName = 'Kwik Basket';
  static const cartTableName = 'cartTable';
  static const price_symbole = "KES";
  static const tax_Name = "VAT 16";
  static const font_size_normal = 13.0;
  static const font_size_big = 15.0;
  static const delete_basket = 'Delete item';
  static const basket_add_cart_msg = "Basket added to cart";
  static const basket_item_add_cart_msg = "Basket item added to cart";
  static const scheduled_delivery = "Scheduled Delivery:";
  static const total_cart_amount = "Total Cart Amount:";

  static const feedback = "You may write your feedback here";
  static const notes_not_available = "Notes are not available for this order";
  static const cancel_order_desc =
      "Edit and cancel the order options will be available for the first 2 hours after placing the orders.";
  static const order_issues_subtitle =
      'From the category choose the area in which you are facing the issue.';
  static const order_issues =
      "Let's know the issues you are facing with this order.";
  static const message_no_net = 'Network connection required to fetch data.';
  static const android_app_id = 'com.kwikbasket.customer';
  static const ios_app_id = '';

  static const native_go_to_main_page = 'native_go_to_main_page';
  static const successful_pass_title = "You have requested a password reset";
  static const successful_pass_desc =
      "We have received your request and will send you the necessary instructions to reset the password. Please check your registered email address to proceed";

  static const image_unavailable = "assets/unavailable.png";
  static const lorem = "lorem";
  static const cart_details = "Cart details: ";
  static const payment_method = "Payment method:  ";

  static GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  static const padding = EdgeInsets.all(16);
  static const heightSizeBox = SizedBox(height: 13);
  static const widthSizeBox = SizedBox(width: 8);

  static const root_icon = 'assets/icon/';
  static const ic_launcher = '$root_icon' + 'ic_launcher.png';
  static const app_logo = '$root_icon' + 'app_logo.png';
  static const kwik_logo = '$root_icon' + 'kwik_logo.png';
  static const kwik_icon = '$root_icon' + 'kwik_icon.png';
  static const login_bg = '$root_icon' + 'login_bg.webp';
  static const ic_double_arrow_back = '$root_icon' + 'ic_double_arrow_back.png';
  static const ic_profile_bg = '$root_icon' + 'profile_bg.png';
  static const ic_cod = '$root_icon' + 'cod_icon.png';
  static const empty_cart_img = '$root_icon' + 'empty_cart.png';
  static const ic_wire = '$root_icon' + 'wire.png';
  static const no_internet = '$root_icon' + 'no_internet.png';
  static const ic_mpesa = '$root_icon' + 'mpesa.png';
  static const ic_order = '$root_icon' + 'note-search.png';
  static const ic_delivery_man = '$root_icon' + 'ic_delivery_man.png';
  static const hasslefree_man = '$root_icon' + 'hasslefree.png';
  static const quality_assured = '$root_icon' + 'qualityassured.png';
  static const happiness_delivered = '$root_icon' + 'happinessdelivered.png';
  static const ic_grocery_bag = '$root_icon' + 'ic_grocery_bag.png';
  static const fruits_image = '$root_icon' + 'Fruits.png';
  static const vegetables_image = '$root_icon' + 'vegetables.png';
  static const asian_vegetables_image = '$root_icon' + 'Asian_Vegetables.png';
  static const dry_groceries_image = '$root_icon' + 'DryGrocery.png';
  static const fresh_juices_image = '$root_icon' + 'Fresh_juices.png';
  static const herbs_image = '$root_icon' + 'Herbs.png';
  static const leafy_vegetables_image = '$root_icon' + 'Leafy_Vegetables.png';
  static const name_background_image = '$root_icon' + 'name_background.png';
  static const car = '$root_icon' + "truck.png";

  static const email_pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  //sign_in_page
  static const login = "Login";
  static const enter_your_details_to_login = "Enter your details to Login";
  static const enter_email_id = "Enter your e-mail Id";
  static const enter_password = "Enter your Password";
  static const border_radius = 8.0;
  static const forgot_password = "Forgot Password?";
  static const reset_here = "Reset here";
  static const login_button_text = "Login to your account";
  static const next_text = "Next";
  static const not_have_account = "Don't have an account yet? ";
  static const sign_up = "Sign Up now";
  static const log_in = "Login";
  static const enter_valid_email_id = "Please enter valid email id.";
  static const enter_valid_password = "Please enter valid Password";

  //boarding_page
  static const button_shop_now = "Proceed to login";
  static const bording_image_list = [
    Constants.kwik_logo,
    Constants.hasslefree_man,
    Constants.quality_assured,
    Constants.happiness_delivered,
  ];
  static const bording_details = [
    {
      "title": "Welcome to Kwikbasket",
      "description":
          "Tired of time consuming grocery purchases for your business? Worry not,we got you covered!!!",
    },
    {
      "title": "Hassle free orders",
      "description":
          "Ordering groceries for your business has never been simpler",
    },
    {
      "title": "Quality assured products",
      "description": "Our products are thoroughly checked for quality",
    },
    {
      "title": "Happiness Delivered",
      "description":
          "Get Delivery right at your doorsteps at your preferred schedule",
    },
  ];

  //forgot_password_page
  static const title_reset_password = "Reset Password";
  static const reset_password =
      "Enter the email id associated with your kwikbasket account, we will send the necessary instructions to reset your password.";
  static const reset_password_button = "Send instructions";
  static const reset_password_1 = "Has your email id changed ?";
  static const reset_password_2 =
      "If the email id associated with your kwikbasket account has changed, you may contact our";
  static const reset_password_3 = " customer support ";
  static const reset_password_4 = "to help restore access to our account.";

  //no_internet_page
  static const location_permission_msg =
      "Please enable GPS to get current location";
  static const no_connection = "No Connection !";
  static const no_connection_msg =
      "No internet connection found. Check yout connnection or try again.";
  static const try_again_button = "Try Again";

  //sign_up_page
  static const title_sign_up = "SignUp";
  static const first_name = "First Name";
  static const last_name = "Last Name";
  static const email = "E-mail";
  static const current_password = "Enter the current password";
  static const password = "Enter new password";
  static const confirm_password = "Confirm new password";
  static const phone_number_code = "+254";
  static const phone_number = "Enter Phone Number";
  static const customer_type = "Customer Type";
  static const company_name = "Company Name";
  static const company_address = "Company Address";
  static const address1 = "Address Line 1";
  static const address2 = "Address Line 2 (Optional)";
  static const location = "Geolocation";
  static const account_manager_name = "Account Manager Name";
  static const i_accept = "I accept ";
  static const terms = "terms";
  static const and = " and ";
  static const policy = "policy";
  static const sign_up_button = "Sign up";
  static const already_have_account = "Already have an account ? ";
  static const sign_in = "Sign in";
  static const enter_valid_first_name = "Please enter valid first name.";
  static const enter_valid_last_name = "Please enter valid last name.";
  static const enter_valid_email = "Please enter valid email.";
  static const enter_valid_current_password =
      "Please enter valid current password";
  static const enter_valid_confirm_password =
      "Please enter valid confirm password.";
  static const match_confirm_password =
      "Confirm password not match with password.";
  static const enter_valid_phone_number = "Please enter valid phone number.";
  static const enter_valid_phone_digits = "Phone number must be of 9 digits!";
  static const enter_valid_customer_type = "Please select valid customer type.";
  static const enter_valid_company_name = "Please enter valid company name.";
  static const enter_valid_address = "Please enter valid address.";
  static const enter_valid_location = "Please enter location.";
  static const enter_valid_account_manager =
      "Please select valid account manager name.";
  static const accept_t_and_p = "Please accept Terms and Policy.";
  static const vatNumber = 'VAT Number';
  static const successful_sub_title =
      "You have successfully submitted the application";
  static const successful_sub_desc =
      "We are currently verifying your application and you will be able to login afterwards. You will be notified over email once the verification is done";
  static const proceed_login = "Enter Otp";

  //otp_page
  static const title_verify_otp = "Verify Your OTP";
  static const enter_otp = "Enter OTP !";
  static const enter_valid_otp = "Please enter valid OTP !";
  static const verify_otp_button = "Verify and Proceed ";
  static const font_size_large = 30.0;
  static const resend_otp = " Didn't receive any code yet? ";
  static const resend_code = "Resend code";
  static const sub_instructions = " Enter the code below for verification";
  static const otp_instructions =
      " We have sent a 4 digit code to your registered email id and phone number. ";

  //main_page
  static const search_product = "Search your products here ";

  //home_page
  static const categories = "Categories";
  static const view_all = "View all";
  static const fruits = "Fruits";
  static const vegetables = "Vegetables";
  static const dry_groceries = "Dry Groceries";
  static const fresh_juices = " Fresh Juices";
  static const herbs = "Herbs";
  static const leafy_vegetables = "Leafy vegetables";
  static const asian_vegetables = "Asian Vegetables";
  static const username = "John";
  static const greetings = "Hello, ";
  static const choose_category =
      "Choose the product of your need from the categories below";
  static const item_count = "54 Items";
  static const per = " per ";
  static const product_quantity = " Quantity: ";

  //cart_page
  static const title_cart = "Cart";
  static const totle = "Total";
  static const forgot_something = "Forgot something?";
  static const click_here = "Click here";
  static const add_more_product = "to add more products";
  static const checkout_button = "Proceed to checkout ";
  static const save_basket = "Save this basket";
  static const empty_cart_msg = "Uh oh... that\'s an empty cart!";
  static const start_shopping_button = "Continue Shopping";

  //checkout_page
  static const checkout_title = 'Checkout Now';
  static const checkout_delivery_address = "Choose delivery address";
  static const checkout_delivery_mode = "Choose delivery mode";
  static const chekout_delivery_date_time = "Choose delivery date and time";
  static const checkout_payment_method = "Payment method";

  //profile_page

  static const settings_profile = {
    "title": "Settings",
  };
  static const dashboard_profile = {
    "title": "Dashboard",
    "subtitle": "Analyse Your Account"
  };
  static const account_details_profile = {
    "title": "Account Details",
    "subtitle": "Manage your personal information"
  };
  static const sub_users_profile = {
    "title": "Sub Users",
    "subtitle": "Manage all sub users"
  };
  static const address_profile = {
    "title": "Address",
    "subtitle": "Update, delete or add new address"
  };
  static const orders_profile = {
    "title": "Orders",
    "subtitle": "You may manage your orders here "
  };
  static const cart_profile = {
    "title": "Cart",
    "subtitle": "Manage your products"
  };
  static const wallet_profile = {
    "title": "Wallet",
    "subtitle": "Check your available balance"
  };
  static const reward_point_profile = {
    "title": "Reward Points",
    "subtitle": "You can check the reward transactions"
  };
  static const returns_profile = {
    "title": "Returns",
    "subtitle": "Track yout returns"
  };
  static const need_help_profile = {
    "title": "Need Help?",
    "subtitle": "Guide through the application"
  };
  static const call_us_profile = {
    "title": "Call Us",
    "subtitle": "Queries, contact here"
  };
  static const rate_us_profile = {
    "title": "Rate Us",
    "subtitle": "Rate the app"
  };
  static const share_profile = {
    "title": "Share",
    "subtitle": "Share in social media, mail etc"
  };
  static const about_us_profile = {
    "title": "About Us",
    "subtitle": "Privacy policy"
  };
  static const logout_profile = {
    "title": "Logout",
    "subtitle": "Logout from this device"
  };
  static const my_basket = {
    "title": "My Basket",
    "subtitle": "Manage your Basket"
  };
  static const my_transactions = {
    "title": "My Transactions",
    "subtitle": "Manage your transactions"
  };
  static const title_other = "Other";

  //my_basket_page
  static const title_my_basket = "Baskets";
  static const no_basket = "No Baskets yet!";
  static const no_product_basket = "No Products in Baskets yet!";
  static const add_selection_to_cart = "Add Selection To Cart";
  static const add_all_to_cart = "Add All Products To Cart";
  static const add_to_cart = "Add to Cart";
  static const view_basket = "View Basket";
  static const access_basket = "You  may access your saved baskets here ";
  static const search_basket = "Search Your Basket Here";

  //sub_users_page
  static const title_sub_users = "Sub Users";
  static const order_approval_button = "Assign Order Approvals";
  static const no_sub_users =
      "You Don't have Sub Users. \n Click on plus icon to add sub users.";

  //add_sub_users_page
  static const title_add_sub_users = "Add sub user";
  static const save_button = "SAVE";
  static const first_name_subUser = "Contact Person First Name";
  static const last_name_subUser = "Contact Person Last Name";
  static const email_subUser = "Branch Email";
  static const branch_name_subUser = "Branch Name";
  static const valid_branch_name_subUser = "Enter Valid Branch Name";
  static const branch_address_subUser = "Branch Address";
  static const valid_branch_address_subUser = "Enter Valid Branch Address";
  static const branch_location_subUser = "Branch Location";
  static const order_approval_subUser = "Order Approval Required:";

  //assign_order_approval_page
  static const title_assign_order_approvals = "Assign Order Approvals";
  static const first_level_approver = "First Level Approver";
  static const second_level_approver = "Second Level Approver";

  //account_details_page
  static const title_account_details = "Edit profile";
  static const tax_no = "Tax No";
  static const change_password = "Change Password";
  static const notification_settings = "Notification Settings";
  static const sms_notification = "SMS Notification";
  static const mobile_notification = "Mobile Notification";
  static const email_notification = "Email Notification";
  static const update_massage = "Successfully updated your profile";

  //change_password_page
  static const title_change_password = "Change Password";
  static const change_password_heading = "CHANGE PASSWORD";

  //address_page
  static const title_address = "My Addresses";
  static const no_address = "No Address";

  //add_address_page
  static const title_add_address = "Add Addresses";
  static const title_update_address = "Update Addresses";
  static const type_of_address = "Type of your Address";
  static const home_type_address = "Home";
  static const office_type_address = "Office";
  static const others_type_address = "Others";
  static const name_address = "Name";
  static const enter_valid_name = "Enter Valid Name";
  static const house_no = "House No. and Building Name";
  static const enter_valid_house_no = "House No. and Building Name required";
  static const street_address = "Street Address/Company Name/P.O.Box";
  static const enter_valid_street_address = "Enter valid details";
  static const add_address_button = "ADD ADDRESS";
  static const update_address_button = "UPDATE ADDRESS";
  static const add_delivery_address = "Add Delivery Address";

  //delivery_address_list_page
  static const title_delivery_address_list = "Address List";
  static const deliver_here_button = "Deliver Here";

  //reward_point_page
  static const title_reward_point = "My Reward Points";
  static const your_balance = "Your balance";
  static const reward_points = "Reward Points";

  //rate_us_dialog
  static const title_rate_us = "Rate Us";
  static const how_like = "How did you like us?";
  static const meh = "Meh!";
  static const loved_it = "Loved It!";
  static const title_rate_app = "Rate App";
  static const give_star = "Please share your experience with us";
  static const nope_button = "Later";
  static const yeah_button = "Submit";

  //about_us_page
  static const title_about_us = "About Us";
  static const about_us_version = "Version 2.0.0";
  static const about_us_description =
      "Kwik basket connects farmers with institutions for buying farm produce directly at competitive pricingand subscription based orders.";
  static const privacy_policy = "Privacy Policy";
  static const terms_conditions = "Terms & Conditions";
  static const read_below = "Read Below";

  //add_notes_dialog
  static const add_product_notes = "Add Product Note";
  static const add_order_notes = "Add Order Note";
  static const write_your_notes = "Write your note here";
  static const add_button = "ADD";
  static const enter_qty = "Please enter valid product quantity.";
  static const valid_qty = "Quantity should be 0.5 and more";
  static const enter_valid_cart_qty =
      'minimum oreder quantity should not be "0"';

  //clear_cart_dialog
  static const are_you_sure = "Are you sure?";
  static const remove_all_message = "You want to remove all cart items";
  static const yes_button = "YES";

  //clear_basket_dialog
  static const remove_all_message_basket =
      "You want to delete the entire basket?";
  static const remove_item_basket =
      "You want to delete this item from the basket?";

  //order_page
  static const view_details_button = "View details";
  static const approve_button = "Approved";
  static const reject_button = "Rejected";
  static const edit_order_button = "Edit order";
  static const accept_button = "Accept";
  static const reorder_button = "Re-order";
  static const order_cancelled = "ORDER CANCELLED";
  static const parent_user_email = "Parent User Email : ";
  static const first_level_email = "First Level Approveal : ";
  static const second_level_email = "Second Level Approveal : ";

  //order_details_page
  static const title_order_details = "Order Details";
  static const order_notes = "Order Notes";
  static const order_summary = "ORDER SUMMARY";
  static const delivery_address = "Delivery Address";
  static const your_savings = "Your Total Savings";
  static const cancel_order_button = "Cancel Order";
  static const cancel_button = "Cancel";
  static const canclePaymentMessage =
      "IF you have already paid for the order, your wallet balance will be automatically applied against your next order";
  static const delivery_by = "Delivery By";

  //edit_order_page
  static const title_edit_order = "Edit Order";
  static const update_now_button = "Update Now";

  //accept_page
  static const title_accept_order = "Accept Order";
  static const submit_button = "Submit";

  //delivery_details_page
  static const title_delivery_address = "Checkout Now";
  static const delivery_date_time = "Delivery Date & Time";
  static const order_date = "Order date: ";
  static const schedule_date = "Delivery schedule";
  static const delivery_charges = "Delivery Charges";
  static const select_time_slot = "please select delivery time slot";
  static const select_delivery_address = "please add delivery address";
  static const default_time_slot = "Select Time Slot";

  //need_help_page
  static const title_need_help = "Need Help?";
  static const cant_find_answer = "Can't find your answer here?";
  static const submit_support_request = "Submit a support request";

  //payment_option_page
  static const title_payment_option = "Payment Option";
  static const place_order_button = "Place Order";
  static const apply_button = "Apply";
  static const enter_reward_point = "Enter Reward Points";
  static const enter_valid_reward_point = "Please enter Reward Points";
  static const enter_coupon_code = "Enter coupon code here";
  static const enter_valid_coupon_code = "Please enter coupon code";
  static const message_coupon_code =
      "* Some coupon codes are applicable on some categories or products.";
  static const subtotal = "Subtotal";
  static const amount_payable = "Amount Payable";
  static const include_vat = "(Inclusive of VAT where applicable)";
  static const applied_successfully = "Applied Successfully";
  static const ok_button = "OK";
  static const valid_reward_point_dialog =
      "Please enter valid amount of reward points to use! ";
  static const valid_coupon_dialog =
      "Coupon is either invalid, expired or reached its usage limit! ";

  //address_search_page
  static const search = "Search";

  //order_summary_page
  static const title_order_summary = "Order Summary";
  static const mode_of_payment = "Mode of Payment :";
  static const confirm_order_button = "Confirm the Order";
  static const proceed_payment_button = "Proceed to Payment";
  static const free = "FREE";

  //order_success_page
  static const title_thanks = "Thanks";
  static const successful_order = "Yay! Order Successfully Placed";
  static const error_order = "Ohh! Order Failed Please Try Again";
  static const scheduled_date_time = "Scheduled Date and Time";
  static const checked_order_status_button = "Check Order Status";
  static const continue_shopping_button = "Continue Shopping";
  static const like_to_feedback = "Would you like to give feedback?";

  //transaction_page
  static const title_transaction = "My Transactions";

  //report_issue_dialog
  static const title_report_issue = "Report an Issue";
  static const issue_type = "Issue Type :";
  static const issue_details = "Describe Your Issue";
  static const List<String> issueTypeList = [
    "Delivery",
    "Items Delivered",
    "Accounts",
    "Payments",
    "Executives"
  ];

  //return_order_page
  static const title_return_order = "Returns";
  static const no_return_title = "You Don't have any returns";
  static const no_return_message = "Glad you loved our service";

  //order_feedback_page
  static const title_feedback_order = "Let us know your feedback";
  static const subtitle_feedback_order =
      "Your valuable feedback helps us to serve you better";
  static const shopping_experience = "How was your overall shoping experience?";
  static const topic_select =
      "You may choose the topic for feedback by clicking the respective tile then write your feedback in the box given below.";
  static const select_rating_msg = "Please Select Rating";
  static const select_feedback_type_msg = "Please Select Feedback Topic";
  static const write_msg = "Please write your Feedback";
  static const feedback_type_list = [
    {"key": "S", "value": "Suggestions"},
    {"key": "I", "value": "I'm facing a problem"},
    {"key": "H", "value": "I'm loving this"},
  ];
  static const write_feedback = "Write your feedback here...";

  //dashboard_page
  static const title_dashboard = "Dashboard";
  static const total_orders = "Total Orders";
  static const avg_total_orders = "Average Order Value";
  static const total_spent = "Total Revenue Spent";
  static const know_champion = "Know Your KwikBasket Champion";
  static const recent_activity = "Recent Activities";
  static const most_products = "Most bought products";
  static const recent_orders = "Recent Orders";
  static const basket_value = "Basket Value Trend";
  static const purchase_history = "Product Purchase History";
  static const no_times_purchase = "No. of Times Purchased";
  static const total_qty_purchase = "Total Quantity Purchased";
  static const total_value = "Total Value";
  static const no_activity = "No Recent Activity";
  static const no_most_product = "No Results Found";
  static const no_recent_order = "No Orders Found";

  //other
  static const product_not_found = "No Products";
  static const no_data = "No Data";
  static const storage_permission_required = "Storage Permission required";
  static const loacation_permission_required = "Location Permission required";

  //order_placed_screen
  static const order_placed_title = "Order Placed";
  static const order_placed_desc = "You have successfully placed the order";
  static const order_placed_number = "Order  for ";
  static const order_placed_schedule = "Scheduled date for delivery ";

  //wallet
  static const title_wallet = "My Wallet";
}

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
//   static const String list_edit_order_page = '/listEditOrderPage';
//   static const String my_basket_page = '/myBasketPage';
//   static const String basket_details_page = '/basketDetailsPage';
//   static const String product_search_page = '/productSearchPage';
//   static const String transaction_page = '/transactionPage';
//   static const String checkongoing_transaction_page =
//       '/checkOngoingTransactionPage';
//   static const String wallet_page = '/walletPage';
//   static const String boarding_page = '/boardingPage';
//   static const String accept_order_page = '/acceptPage';
//   static const String return_order_page = '/returnOrderPage';
//   //static const String report_issue_page = '/reportIssuePage';
//   static const String order_feedback_page = '/orderFeedbackPage';
//   static const String dashboard_page = '/dashboardPage';
//   static const String all_bought_product_page = '/allBoughtProductPage';
//   static const String all_recent_order_page = '/allRecentOrderPage';
//   static const String order_placed_page = '/newOrderSummary';

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
//     delivery_address_list_page: (ctx) => DeliveryAddressListPage(),
//     // order_summary_page: (ctx) => OrderSummaryPage(),
//     checkongoing_transaction_page: (ctx) => CheckOngoingTransaction(),
//     wallet_page: (ctx) => WalletCreditPage(),
//     boarding_page: (ctx) => BoardingPage(),
//     edit_order_page: (ctx) => EditOrderPage(),
//     return_order_page: (ctx) => ReturnOrderPage(),
//     order_feedback_page: (ctx) => OrderFeedbackPage(),
//     dashboard_page: (ctx) => DashboardPage(),
//     all_bought_product_page: (ctx) => AllBoughtProductPage(),
//     all_recent_order_page: (ctx) => AllRecentOrderPage(),
//     // report_issue_page: (ctx) => ReportOrderPage(),
//     // order_placed_page: (ctx) => OrderSummaryPage(),

//     MpesaProcessingPage.routeName: (ctx) => MpesaProcessingPage(),
//   };

//   static Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
//     if (settings.name == main_page) {
//       final Map<String, dynamic> args =
//           settings.arguments as Map<String, dynamic>;
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
//       final Map<String, dynamic> args =
//           settings.arguments as Map<String, dynamic>;
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
//       final Map<String, dynamic> args =
//           settings.arguments as Map<String, dynamic>;
//       return MaterialPageRoute(
//         builder: (context) {
//           return ProductListPage(
//             categoryDetails: args['categoryDetails'],
//           );
//         },
//       );
//     } else if (settings.name == product_details_page) {
//       final Map<String, dynamic> args =
//           settings.arguments as Map<String, dynamic>;
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
//       final Map<String, dynamic> args =
//           settings.arguments as Map<String, dynamic>;
//       return MaterialPageRoute(
//         builder: (context) {
//           return NewOtpPage(
//             isLogin: args["isLogin"],
//             signUpBody: args["signUpData"],
//             loginData: args["loginData"],
//           );
//         },
//       );
//     } else if (settings.name == order_success_page) {
//       final Map<String, dynamic> args =
//           settings.arguments as Map<String, dynamic>;
//       return MaterialPageRoute(
//         builder: (context) {
//           return NewOrderSuccessPage(
//             isError: args["isError"],
//           );
//         },
//       );
//     } else if (settings.name == order_details_page) {
//       final Map<String, dynamic> args =
//           settings.arguments as Map<String, dynamic>;
//       return MaterialPageRoute(
//         builder: (context) {
//           return OrderDetailsPage(
//             orderData: args["orderData"],
//           );
//         },
//       );
//     } else if (settings.name == accept_order_page) {
//       final Map<String, dynamic> args =
//           settings.arguments as Map<String, dynamic>;
//       return MaterialPageRoute(
//         builder: (context) {
//           return AcceptPage(
//             orderData: args["orderData"],
//           );
//         },
//       );
//     } else if (settings.name == basket_details_page) {
//       final Map<String, dynamic> args =
//           settings.arguments as Map<String, dynamic>;
//       return MaterialPageRoute(
//         builder: (context) {
//           return BasketDetailsPage(
//             wishlist: args["wishlist"],
//           );
//         },
//       );
//     } else if (settings.name == add_address_page) {
//       final Map<String, dynamic> args =
//           settings.arguments as Map<String, dynamic>;
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
//     } else if (settings.name == list_edit_order_page) {
//       final Map<String, dynamic> args =
//           settings.arguments as Map<String, dynamic>;
//       return MaterialPageRoute(
//         builder: (context) {
//           if (args == null) {
//             return AddAddressPage();
//           }
//           return ListEditOrderPage(
//             orderData: args["orderData"],
//           );
//         },
//       );
//     } else if (settings.name == transaction_page) {
//       final Map<String, dynamic> args =
//           settings.arguments as Map<String, dynamic>;
//       return MaterialPageRoute(
//         builder: (context) {
//           return TransactionPage(
//             transactionData: args,
//           );
//         },
//       );
//     }
//   };
// }

class APIRoutes {
  // Stage URL
  static String api_url = RestClient().baseURL;

  //production URL
  // static const String api_url = 'https://www.kwikbasket.com';

  // Dev URL
  // static const String api_url = 'https://dev.shop.kwikbasket.com';
  // static const String mpesa_sandbox_api_url = 'https://sandbox.safaricom.co.ke';

  static const map_api_key = "AIzaSyCkpEMG7UmHVJmqxBZUvlcNGO2Fk-nSUtY";

  // ignore: non_constant_identifier_names
  static var x_user_header = {'X-User': 'customer'};
  static String storeIdKwikBasket = "75";
  static String storeId = "75";
  static String storeName = "KwikBasket";

  static const super_admin = r"apiadmin:Kwik$Admin#2020";
  // ignore: non_constant_identifier_names
  static final basic_token_header = {
    'Authorization': 'Basic ${base64.encode(utf8.encode(super_admin))}',
  };

  // static final mpesaServicesAuthorizationHeader = {
  //   'Authorization': 'Basic ' + "YpR2aAdj3lKJwwTAd5RPH7JEY33WKM2B".toBase64(),
  // };
  // dev
  static const super_admin_jupiter = r"superadmin:Jupiter@251019";

  // stage & prod
  // static const super_admin_jupiter = r"superadmin:K@!kb@sket!!";

  // ignore: non_constant_identifier_names
  static final basic_token_header_jupiter = {
    'Authorization': 'Basic ${base64.encode(utf8.encode(super_admin_jupiter))}',
  };

  static const mpesa_admin =
      r"A6cHJ41g4Gb0N1FoH9t0C4V6G7WDuxpg:XTFGWwajWbAdCmcZ";
  // ignore: non_constant_identifier_names
  static final mpesa_basic_token_header = {
    'Authorization': 'Basic ${base64.encode(utf8.encode(mpesa_admin))}',
  };

  //auth_provider
  static const String api_sign_in = '/index.php?path=api/customer/login';
  static const String api_sign_up = '/api/customer/signup/signupByOtpNew';

  static const String api_get_account_manager =
      '/api/customers/getAccountManagers';
  static const String api_get_customer_group =
      '/api/customers/getCustomerGroups';
  static const String api_forgot_password =
      '/api/forgetpassword/ForgotPassword';
  static const String api_sign_up_otp_verify =
      '/api/customer/signup/signupVerifyOtpNew';

  static const String api_post_sendNewDevice_OTP =
      '/api/customer/account/SendNewDeviceotp';
  static const String api_post_resend_OTP =
      '/api/customer/signup/ResendSignupOtp';
  static const String api_post_verifyNewDevice_OTP =
      '/api/customer/account/VerifyNewDeviceotp';
  static const String api_post_newCustomerDevice =
      '/api/customer/login/NewCustomerDevice';
  static const String api_post_setDeviceToken =
      '/api/customer/settings/deviceIdToCustomer';

  //address_provider
  static const String api_all_address = '/api/customer/address/alladdress';
  static const String api_delete_address = '/api/customer/address/address';
  static const String api_add_address = '/api/customer/address/address';

  //cart_provider
  static const String api_post_validate_order =
      '/api/customer/order/validateOrder';
  static const String api_post_add_cart = "/api/cart/addcartproducts";
  static const String api_get_cart_list = "/api/customer/cart/cartproduct";
  static const String api_get_check_other_vendor_product =
      "/api/customer/order/CheckOtherVendorOrderExist";
  static const String api_get_check_unpaid_order =
      "/api/customer/order/unpaidorders";
  static const String api_get_aggree_vendor_product =
      "/api/customer/order/AcceptOtherVendorOrderTerm";
  static const String api_get_remove_vendor_product =
      "/api/customer/order/removeothervendorproductsfromcart";

  //category_provider
  static const String api_get_categories = '/api/customer/category/Categories';

  //delivery_method_provider
  static const String api_get_delivery_method =
      '/api/customer/stores/storeshippingmethods';
  static const String api_get_delivery_dateTime =
      '/api/customer/checkout/deliverytimeslot';
  static const String api_set_delivery_dateTime =
      '/api/customer/checkout/setdeliverytimeslot';
  static const String api_get_payment_method =
      '/api/customer/checkout/paymentmethods';

  //product_details_provider
  static const String api_get_product_details =
      '/api/customer/products/productdetails';

  //product_provider
  static const String api_get_product = '/api/customer/products';

  //store_provider
  static const String api_get_store = '/api/stores/Stores';

  //subuser_provider
  static const String api_get_subusers = '/api/customer/subusers/SubUsers';
  static const String api_post_subusers = '/api/customer/subusers/NewSubUser';
  static const String api_subusers_orderApproval =
      '/api/customer/subusers/assignsubcustomerorderapprovalbysubcustomerid';
  static const String api_subusers_active =
      '/api/customer/subusers/ActivateSubUsers';
  static const String api_delete_subuser =
      '/api/customer/subusers/deleteSubUser';
  static const String api_unique_email = '/api/customer/subusers/EmailUnique/';
  static const String api_post_assign_approval =
      '/api/customer/subusers/assignorderapprovals';

  //user_details_provider
  static const String api_change_password =
      '/api/forgetpassword/changepassword';
  static const String api_get_userDetails = '/api/customer/account/userdetails';
  static const String api_post_notification_setting =
      '/api/customer/user_notification_settings/CustomerNotificationSettings';
  static const String api_get_notification_setting =
      '/api/customer/user_notification_settings/CustomerNotificationSettings';
  static const String api_put_userdetails = '/api/customer/account/userdetails';

  //user_rewards_provider
  static const String api_get_user_rewards =
      "/api/customer/account/userRewards";
  static const String api_apply_user_rewards =
      "/api/customer/checkout/applyreward";
  static const String api_apply_coupon = "/api/customer/checkout/applycoupon";

  //order_provider
  static const String api_post_validate_order_details =
      "/api/customer/order/validateOrderDetail";
  static const String api_get_check_unpaidorder_counts =
      "/api/customer/order/unpaidorderscounts";
  // static const String api_post_place_order = "/api/customer/order";
  static const String api_post_place_order_new = "/api/customer/order/ordernew";
  static const String api_post_kwikbasket_total =
      "/api/customer/order/TotalKwikBasketStore";
  static const String api_post_missing_order =
      "/api/customer/order/missingOrder";
  static const String api_post_order_status =
      "/api/customer/order/orderStatusByReferenceId";
  static const String api_post_order_cancel = "/api/customer/order/ordercancel";

  //order_list_provider
  static const String api_get_order_list = "/api/customer/order/orders";
  static const String api_get_reorder = "/api/customer/order/reorder";
  static const String api_post_ApproveReject_subuser_order =
      "/api/order/ApproveOrRejectSubUserOrder";
  static const String api_post_ApproveReject_chefProcurement_order =
      "/api/order/ApproveOrRejectSubUserOrderByChefProcurement";
  static const String api_post_accept_order =
      "/api/customer/return/AcceptDelivery";
  static const String api_post_feedback = "/api/customer/feedback";
  static const String api_download_order =
      "/api/orders/export_products_excel?order_id=";

  //wishlist_provider
  static const String api_get_wishlist = "/api/customer/wishlist/UserList";
  static const String api_delete_wishlist =
      "/api/customer/wishlist/deleteWishlist";
  static const String api_get_wishlist_details =
      "/api/customer/wishlist/UserListProduct";
  static const String api_update_wishlist_details =
      "/api/customer/wishlist/WishlistProduct";
  static const String api_delete_wishlist_details =
      "/api/customer/wishlist/deleteWishlistProduct";
  static const String api_create_wishlist =
      "/api/customer/wishlist/CreateWishlistWithProduct";

  //product_search_provider
  static const String api_post_product_search =
      "/api/customer/products/productsearch";

  //order_details_proviedr
  static const String api_get_order_details = "/api/customer/order/order";
  static const String api_post_edit_order =
      "/api/customer/order/editOrderWithNewitemAndQuantity";
  static const String api_post_list_edit_order = "/api/order/editorderquantity";

  //transaction_provider
  static const String api_get_transaction =
      "/api/customer/transactions/AllTransactions";

  // wallet_provider
  static const String api_get_wallet = "/api/customer/account/Wallet";

  //return_order_provider
  static const String api_get_return_order_list =
      "/api/customer/return/userReturns";

  //dashboard_provider
  static const String api_get_dashboard_details =
      "/api/customer/dashboard/DashboardDetails";
  static const String api_get_dashboard_total_order =
      "/api/customer/dashboard/DashboardData";
  static const String api_get_dashboard_recent_activity =
      "/api/customer/dashboard/RecentActivities";
  static const String api_get_dashboard_most_product =
      "/api/customer/dashboard/CustomerMostBoughtProducts";
  static const String api_get_viewall_most_product =
      "/api/customer/dashboard/RecentOrdersProductsList";
  static const String api_get_product_history =
      "/api/customer/dashboard/PurchaseHistoryByProductID";
  static const String api_get_dashboard_recent_orders =
      "/api/customer/dashboard/RecentOrders";
  static const String api_get_viewall_recent_orders =
      "/api/customer/dashboard/RecentOrdersList";
  static const String api_get_dashboard_basket_value =
      "/api/customer/dashboard/valueofbasket";
  static const String api_get_dashboard_most_product_excel =
      "/api/customer/dashboard/MostPurchasedProductsExcel";

  //mpesa transactions payment
  static const String api_post_mpesa_payment = "/api/customer/mpesa";
  static const String api_post_mpesa_completepayment =
      "/api/customer/mpesa/mpesacomplete";

  //mpesa api
  static const String api_post_mpesa_checkout =
      "/api/customer/mpesa/mpesacheckout";
  static const String api_post_mpesa_checkout_status =
      "/api/customer/mpesa/mpesacheckoutcomplete";

  //mpesa api wallet
  static const String api_post_wallet_mpesa_checkout =
      "/api/customer/mpesa/mpesatopup";
  static const String api_post_wallet_mpesa_checkout_status =
      "/api/customer/mpesa/mpesatopupcomplete";
}

class PaymentGatway {
  //i = interswitch
  static const i_merchant_code = "MX52492";
  static const i_client_id = "IKIA1B1FDB32D4FEB7D2F40BE4978B71E9029ED1F1A1";
  static const i_secret_key = "iboyZ1GU9mocJAS";
  static const i_currency_code = "404";
  //set TRUE for test
  //set FALSE for production
  static const i_mode = "TRUE";
}
