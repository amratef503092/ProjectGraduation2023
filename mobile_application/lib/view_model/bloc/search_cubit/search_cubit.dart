import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/faliuar.dart';
import '../../../model/hotel_model/hotel_model.dart';
import '../../repo/search_repo/serarch_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState>
{
  SearchCubit(this.searchRepo) : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  SearchRepo searchRepo;

  Future<void> searchHotel({required String searchKey}) async
  {
    emit(SearchLoading());
    final result = await searchRepo.getHotelInfo(searchKey: searchKey);
    result.fold((error) {
      emit(SearchError(error: error));
    }, (data) {
      emit(SearchLoaded(hotelModel: data));
    });
  }

}
