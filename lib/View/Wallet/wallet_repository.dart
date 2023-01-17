import 'package:shared_account_book/View/Wallet/wallet_model.dart';

class WalletRepository{
  final List<WalletModel> _user = [
    WalletModel(
      user: '공동',
      budget: 1000000,
      spend: 360000
    ),
    WalletModel(
        user: '나',
        budget: 300000,
        spend: 175000
    ),
    WalletModel(
        user: '상대방',
        budget: 300000,
        spend: 71500
    ),
  ];
  Future<List<WalletModel>> getAccountUser() async {
    return _user;
  }
}