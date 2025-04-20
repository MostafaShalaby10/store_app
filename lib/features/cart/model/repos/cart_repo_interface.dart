abstract class CartRepoInterface {
  Future addOrRemoveCart(int productId);
  Future getCart();
}
