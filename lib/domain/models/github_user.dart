class GithubUser {
  final String login;
  final int id;
  final String avatarUrl;
  final String name;
  final String company;
  final String email;
  final String bio;

  const GithubUser({
    required this.login,
    required this.id,
    this.avatarUrl = '',
    this.name = '',
    this.company = '',
    this.email = '',
    this.bio = '',
  });

  @override
  String toString() {
    return 'GithubUser(login: $login, id: $id, avatarUrl: $avatarUrl, name: $name, company: $company, email: $email, bio: $bio)';
  }

  factory GithubUser.fromMap(Map<String, dynamic> map) {
    return GithubUser(
      login: map['login'] ?? '',
      id: map['id']?.toInt() ?? 0,
      avatarUrl: map['avatar_url'] ?? '',
      name: map['name'] ?? '',
      company: map['company'] ?? '',
      email: map['email'] ?? '',
      bio: map['bio'] ?? '',
    );
  }
}
