abstract class FavoriteRepoInterface {
  Future addOrRemoveFavorite(int productId);
  Future getFavorites();
}
