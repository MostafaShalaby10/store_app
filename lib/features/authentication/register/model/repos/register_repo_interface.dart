abstract class RegisterRepoInterface {
  Future register({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
}
