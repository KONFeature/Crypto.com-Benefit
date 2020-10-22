// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionsViewModel on _TransactionsViewModelBase, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_TransactionsViewModelBase.isLoading'))
          .value;
  Computed<List<dynamic>> _$transactionsComputed;

  @override
  List<dynamic> get transactions => (_$transactionsComputed ??=
          Computed<List<dynamic>>(() => super.transactions,
              name: '_TransactionsViewModelBase.transactions'))
      .value;

  final _$_transactionsAtom =
      Atom(name: '_TransactionsViewModelBase._transactions');

  @override
  ObservableStream<List<dynamic>> get _transactions {
    _$_transactionsAtom.reportRead();
    return super._transactions;
  }

  @override
  set _transactions(ObservableStream<List<dynamic>> value) {
    _$_transactionsAtom.reportWrite(value, super._transactions, () {
      super._transactions = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
transactions: ${transactions}
    ''';
  }
}
