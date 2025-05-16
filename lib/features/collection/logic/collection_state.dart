import '../../collection/model/bottle.dart';

abstract class CollectionState {}

class CollectionInitial extends CollectionState {}

class CollectionLoading extends CollectionState {}

class CollectionLoaded extends CollectionState {
  final List<Bottle> bottles;

  CollectionLoaded(this.bottles);
}

class CollectionError extends CollectionState {
  final String message;

  CollectionError(this.message);
}
