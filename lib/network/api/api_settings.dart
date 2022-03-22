
class ApiSettings{

  static const _baseURL = 'https://smart-store.mr-dev.tech/';

  static const _apiURL = _baseURL + 'api/';

  static const _authURL = _apiURL + 'auth/';
  static const login = _authURL + 'login';
  static const logout = _authURL + 'logout';
  static const register = _authURL + 'register';
  static const activate = _authURL + 'activate';
  static const forgetPassword = _authURL + 'forget-password';
  static const resetPassword = _authURL + 'reset-password';


  static const CITIES_URL = _apiURL + 'cities';
  static const HOME_URL = _apiURL + 'home';
  static const CATEGORIES_URL = _apiURL + 'categories';
  static const PRODUCTS_URL = _apiURL + 'products';
  static const OFFERS_URL = _apiURL + 'offers';
  static const FAVORITE_PRODUCTS_URL = _apiURL + 'favorite-products';
  static const ADDRESSES_URL = _apiURL + 'addresses';
  static const PAYMENT_CARDS_URL = _apiURL + 'payment-cards';
  static const ORDERS_URL = _apiURL + 'orders';
  static const FAQS_URL = _apiURL + 'faqs';
  static const CONTACT_REQUESTS_URL = _apiURL + 'contact-requests';
  static const NOTIFICATIONS_URL = _apiURL + 'notifications';

}