class CardData {
  final String cardNumber;
  final String expiryDate;
  final String cardholderName;
  final String cardType;

  CardData({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardholderName,
    required this.cardType,
  });

   factory CardData.fromBytes(Map<String, dynamic> data) {
    return CardData(
      cardNumber: data['cardNumber'] ?? 'Unknown',
      expiryDate: data['expiryDate'] ?? 'Unknown',
      cardholderName: data['cardholderName'] ?? 'Unknown',
      cardType: data['cardType'] ?? 'Unknown',
    );
  }
}