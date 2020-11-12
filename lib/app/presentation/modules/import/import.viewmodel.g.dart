// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImportViewModel on _ImportViewModelBase, Store {
  final _$importedFilesStreamAtom =
      Atom(name: '_ImportViewModelBase.importedFilesStream');

  @override
  ObservableStream<Iterable<dynamic>> get importedFilesStream {
    _$importedFilesStreamAtom.reportRead();
    return super.importedFilesStream;
  }

  @override
  set importedFilesStream(ObservableStream<Iterable<dynamic>> value) {
    _$importedFilesStreamAtom.reportWrite(value, super.importedFilesStream, () {
      super.importedFilesStream = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_ImportViewModelBase.errorMessage');

  @override
  Observable<String> get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(Observable<String> value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$importAsyncAction = AsyncAction('_ImportViewModelBase.import');

  @override
  Future import() {
    return _$importAsyncAction.run(() => super.import());
  }

  final _$clearImportsAsyncAction =
      AsyncAction('_ImportViewModelBase.clearImports');

  @override
  Future clearImports() {
    return _$clearImportsAsyncAction.run(() => super.clearImports());
  }

  @override
  String toString() {
    return '''
importedFilesStream: ${importedFilesStream},
errorMessage: ${errorMessage}
    ''';
  }
}
