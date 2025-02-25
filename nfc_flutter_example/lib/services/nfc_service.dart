import 'package:nfc_manager/nfc_manager.dart';
import '../models/card_data.dart';
import '../utils/emv_parser.dart';

class NFCService {
  Future<CardData?> startCardReading() async {
    CardData? cardData = null;

    try {
      await NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          final emvData = await EMVParser.parseTag(tag);
          cardData = CardData.fromBytes(emvData);
        },
      );
      
      if (cardData == null) {
        throw Exception('Failed to read card');
      }
      
      return cardData;
    } catch (e) {
      throw Exception('Error reading card: ${e.toString()}');
    } finally {
      NfcManager.instance.stopSession();
    }
  }
}