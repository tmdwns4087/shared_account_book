import 'package:flutter/cupertino.dart';
import 'package:shared_account_book/View/Wallet/wallet_model.dart';
import 'package:shared_account_book/View/Wallet/wallet_repository.dart';

class WalletController extends ChangeNotifier{
  List<WalletModel> accountUser = [];
  final WalletRepository _walletRepository = WalletRepository();
  void loadAccountUser() async {
    var user = await _walletRepository.getAccountUser();
    accountUser = user;
    notifyListeners();
    print('여기:$accountUser');
  }
}