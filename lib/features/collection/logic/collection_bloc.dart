import 'package:flutter_bloc/flutter_bloc.dart';
import 'collection_event.dart';
import 'collection_state.dart';
import '../data/bottle_repository.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final BottleRepository repository;

  CollectionBloc(this.repository) : super(CollectionInitial()) {
    on<LoadCollection>((event, emit) async {
      emit(CollectionLoading());
      try {
        final bottles = await repository.loadBottles();
        emit(CollectionLoaded(bottles));
      } catch (e) {
        emit(CollectionError(e.toString()));
      }
    });
  }
}
