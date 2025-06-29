class Testimonial {
  final String name;
  final String comment;

  const Testimonial({required this.name, required this.comment});

  String get avatarUrl {
    final encodedName = Uri.encodeComponent(name);
    return 'https://ui-avatars.com/api/?name=$encodedName&background=ffcd3c&color=000&bold=true';
  }
}
