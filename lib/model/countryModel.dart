import 'dart:convert';

class Country {
  final String name;
  final String native;
  final String phone;
  final String continent;
  final String capital;
  final String currency;
  final List languages;
  final String emoji;
  final String emojiU;

  Country({
    required this.name,
    required this.native,
    required this.phone,
    required this.continent,
    required this.capital,
    required this.currency,
    required this.languages,
    required this.emoji,
    required this.emojiU,
  });

  factory Country.fromJSON(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      native: json['native'],
      phone: json['phone'],
      continent: json['continent'],
      capital: json['capital'],
      currency: json['currency'],
      languages: json['languages'],
      emoji: json['emoji'],
      emojiU: json['emojiU'],
    );
  }
  static Map<String, dynamic> toMap(Country country) => {
        'name': country.name,
        'native': country.native,
        'phone': country.phone,
        'continent': country.continent,
        'capital': country.capital,
        'currency': country.currency,
        'languages': country.languages,
        'emoji': country.emoji,
        'emojiU': country.emojiU,
      };

  static String encode(List<Country> countries) => json.encode(
        countries
            .map<Map<String, dynamic>>((music) => Country.toMap(music))
            .toList(),
      );

  static List<Country> decode(String countries) =>
      (json.decode(countries) as List<dynamic>)
          .map<Country>((item) => Country.fromJSON(item))
          .toList();
}
