import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new4shop010622/app/about_screen.dart';
import 'package:new4shop010622/app/add_card_screen.dart';
import 'package:new4shop010622/app/change_password_screen.dart';
import 'package:new4shop010622/app/check_out.dart';
import 'package:new4shop010622/app/edit_order_screen.dart';
import 'package:new4shop010622/app/edit_profile_screen.dart';
import 'package:new4shop010622/app/forgot_password_screen.dart';
import 'package:new4shop010622/app/fruits_and_vegetables.dart';
import 'package:new4shop010622/app/invite_screen.dart';
import 'package:new4shop010622/app/item_details.dart';
import 'package:new4shop010622/app/item_details_vegetables.dart';
import 'package:new4shop010622/app/main_screen.dart';
import 'package:new4shop010622/app/fresh_fruits.dart';
import 'package:new4shop010622/app/my_address_screen.dart';
import 'package:new4shop010622/app/my_order_screen.dart';
import 'package:new4shop010622/app/new_address_screen.dart';
import 'package:new4shop010622/app/notifications_screen.dart';
import 'package:new4shop010622/app/order_details_screen.dart';
import 'package:new4shop010622/app/order_review_screen.dart';
import 'package:new4shop010622/app/payment_screen.dart';
import 'package:new4shop010622/app/profile_screen.dart';
import 'package:new4shop010622/app/support_screen.dart';
import 'package:new4shop010622/app/view_invoice_screen.dart';
import 'package:new4shop010622/app_business/notifications_screen_business.dart';
import 'package:new4shop010622/auth/authentication_screen.dart';
import 'package:new4shop010622/auth/confirm_phone_number.dart';
import 'package:new4shop010622/app_business/new_item_screen.dart';
import 'package:new4shop010622/auth/sign_in.dart';
import 'package:new4shop010622/auth/sign_in_business.dart';
import 'package:new4shop010622/auth/sign_up.dart';
import 'package:new4shop010622/out_boarding_screen/out_boarding_screen.dart';
import 'package:new4shop010622/prefs/customer_preference_controller.dart';
import 'package:new4shop010622/prefs/user_prefernce_controller.dart';

import 'app/cart_screen.dart';
import 'app_business/fresh_fruits_business.dart';
import 'app_business/fruits_and_vegetables_business.dart';
import 'app_business/main_screen_business.dart';
import 'app_business/order_details_screen_business.dart';
import 'app_business/order_review_screen_business.dart';
import 'app_business/orders_screen_business.dart';
import 'app_business/payment_screen_business.dart';
import 'app_business/view_invoice_screen_business.dart';
import 'launch_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await CustomerPreferenceController().initSharedPreferences();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  // await UserPreferenceController().initSharedPreferences();
  // await CustomerPreferenceController().initSharedPreferences();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen':(context) => const LaunchScreen(),
        '/out_boarding_screen':(context) => const OutBoardingScreen(),
        '/authentication_screen':(context) => const AuthenticationScreen(),
        '/sign_up':(context) => const SignUp(),
        '/sign_in':(context) => const SignIn(),
        '/main_screen':(context) => const MainScreen(),
        '/confirm_phone_number':(context) => const ConfirmPhoneNumber(),
        '/fruits_and_vegetables':(context) => const FruitsAndVegetables(),
        '/fresh_fruits':(context) => const FreshFruits(),
        '/item_details':(context) => const ItemDetails(),
        '/item_details_vegetables':(context) => const ItemDetailsVegetables(),
        '/cart_screen':(context) => const CartScreen(),
        '/check_out':(context) => const CheckOut(),
        '/my_order_screen':(context) => const MyOrderScreen(),
        '/order_details_screen':(context) => const OrderDetailsScreen(),
        '/edit_order_screen':(context) => const EditOrderScreen(),
        '/order_review_screen':(context) => const OrderReviewScreen(),
        '/view_invoice_screen':(context) => const ViewInvoiceScreen(),
        '/payment_screen':(context) => const PaymentScreen(),
        '/my_address_screen':(context) => const MyAddressScreen(),
        '/new_address_screen':(context) => const NewAddressScreen(),
        '/notifications_screen':(context) => const NotificationsScreen(),
        '/profile_screen':(context) => const ProfileScreen(),
        '/edit_profile_screen':(context) => const EditProfileScreen(),
        '/about_screen':(context) => const AboutScreen(),
        '/add_card_screen':(context) => const AddCardScreen(),
        '/support_screen':(context) => const SupportScreen(),
        '/change_password_screen':(context) => const ChangePasswordScreen(),
        '/forgot_password_screen':(context) => const ForgotPasswordScreen(),
        '/invite_screen':(context) => const InviteScreen(),
        '/sign_in_business':(context) => const SignInBusiness(),
        '/main_screen_business':(context) => const MainScreenBusiness(),
        '/fruits_and_vegetables_business':(context) => const FruitsAndVegetablesBusiness(),
        '/fresh_fruits_business':(context) => const FreshFruitsBusiness(),
        '/new_item_screen':(context) => const NewItemScreen(),
        '/orders_screen_business':(context) => const OrdersScreenBusiness(),
        '/orders_details_screen_business':(context) => const OrderDetailsScreenBusiness(),
        '/order_review_screen_business':(context) => const OrderReviewScreenBusiness(),
        '/view_invoice_screen_business':(context) => const ViewInvoiceScreenBusiness(),
        '/payment_screen_business':(context) => const PaymentScreenBusiness(),
        '/notifications_screen_business':(context) => const NotificationsScreenBusiness(),

      },
    );
  }
}
