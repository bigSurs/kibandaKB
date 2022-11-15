import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/transactions/transactions.dart';
import 'package:kibanda_kb/services/api_service/rest_service.dart';

part 'transaction_state.dart';
part 'transaction_cubit.freezed.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionState.initial());

  getallTransactions() async {
    emit(const TransactionState.loading());
    try {
      var response = await RestService().getData(
        path: 'customer/transactions/AllTransactions',
      );
      List pendingTransactions = response['data']['pending_transactions'];
      List successfulTransactions = response['data']['success_transactions'];
      List cancelledTransactions = response['data']['cancelled_transactions'];
      emit(TransactionState.success(
        pendingTransactions: List.generate(pendingTransactions.length,
            (index) => Transactions.fromJson(pendingTransactions[index])),
        successfulTransactions: List.generate(successfulTransactions.length,
            (index) => Transactions.fromJson(successfulTransactions[index])),
        cancelledTransactions: List.generate(cancelledTransactions.length,
            (index) => Transactions.fromJson(cancelledTransactions[index])),
      ));
    } catch (e) {
      emit(TransactionState.failed(e.toString()));
    }
  }
}
