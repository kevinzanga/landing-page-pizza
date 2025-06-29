// lib/services/contact_service.dart
import 'package:hive/hive.dart';
import '../class/contact_model.dart';

class ContactService {
  static const _boxName = 'contact_messages';

  static Future<void> saveMessage(ContactMessage message) async {
    final box = await Hive.openBox(_boxName);
    await box.add(message.toMap());
  }

  static Future<List<Map<String, dynamic>>> getMessages() async {
    final box = await Hive.openBox(_boxName);
    return List.generate(box.length, (index) => box.getAt(index));
  }
}
