class GithubRepo {
  final int id;
  final String name;
  final String language;
  final int forks;
  final int stars;

  const GithubRepo({
    required this.id,
    required this.name,
    required this.language,
    required this.forks,
    required this.stars,
  });

  @override
  String toString() {
    return 'GithubRepo(id: $id, name: $name, language: $language, forks: $forks, stars: $stars)';
  }

  factory GithubRepo.fromMap(Map<String, dynamic> map) {
    return GithubRepo(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      language: map['language'] ?? '',
      forks: map['forks']?.toInt() ?? 0,
      stars: map['stargazers_count']?.toInt() ?? 0,
    );
  }
}
