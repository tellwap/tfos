const baseURL = 'http://10.0.2.2:8000/api';
const baseImageURL = 'http://10.0.2.2:8000/Image/';

const String UNITS_LIST = baseURL + '/units';
const String CATEGORIES_LIST = baseURL + '/categories';
const String AREAS_LIST = baseURL + '/areas';
const String PRODUCT_LIST = baseURL + '/products';
const String RETAILERS_LIST = baseURL + '/retailers';
const String MANUFACTURES_LIST = baseURL + '/manufactures';
const String DISTRIBUTERS_LIST = baseURL + '/distributors';
const String ORDERS_LIST = baseURL + '/orders';

const String ORDER_DISTRIBUTOR_LIST = baseURL + '/orders_distributor';
const String ORDER_RETAILER_LIST = baseURL + '/orders_retailer';

// https://fahamupay-faas.bfast.fahamutech.com/functions/pay/check/02375676
//0237:bDCCi6fhcp0XWk6zNfI98trBth00pKwl1IH7Xnr0FAEJQeLa

// const baseURL = 'http://192.168.43.202:8000/api';

// const baseURL = 'http://192.168.43.202:8000/api';
// const baseImageURL = 'http://192.168.43.202:8000';

const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/profile';

//...............Errors...........
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';
