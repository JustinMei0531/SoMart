class Apis {
  static const String baseURL = "http://127.0.0.1:5000";

  static const String login = "$baseURL/admin/login";

  static const String updateAvatar = "$baseURL/admin/update-avatar";

  static const String updateProfile = "$baseURL/admin/update-profile";

  static const String verifyToken = "$baseURL/admin/verify-token";

  static const String getAllCategories = "$baseURL/category/get-categories";
}


class ProductApis{
  static const String imagePath = "http://127.0.0.1:5000/static/products/";

  static const String baseURL = "http://127.0.0.1:5000/product";

  static const String testProductID = "$baseURL/inspect-product-id";

  static const String allocateID = "$baseURL/get-valid-product-id";

  static const String searchProduct = "$baseURL/search-product";

}