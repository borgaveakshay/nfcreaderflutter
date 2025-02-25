import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import '../services/nfc_service.dart';
import '../models/card_data.dart';
import '../widgets/card_details_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NFCService _nfcService = NFCService();
  CardData? _cardData;
  bool _isScanning = false;

  @override
  void initState() {
    super.initState();
    _checkNFCAvailability();
  }

  Future<void> _checkNFCAvailability() async {
    bool isAvailable = await NfcManager.instance.isAvailable();
    if (!isAvailable) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('NFC is not available on this device')),
        );
      }
    }
  }

  Future<void> _startNFCScan() async {
    setState(() => _isScanning = true);
    try {
      final cardData = await _nfcService.startCardReading();
      setState(() => _cardData = cardData);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      setState(() => _isScanning = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC Card Reader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isScanning)
              const Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Place your card near the device...'),
                ],
              )
            else if (_cardData != null)
              CardDetailsWidget(cardData: _cardData!)
            else
              const Text('Tap the button below to scan a card'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _isScanning ? null : _startNFCScan,
              child: Text(_isScanning ? 'Scanning...' : 'Scan Card'),
            ),
          ],
        ),
      ),
    );
  }
}