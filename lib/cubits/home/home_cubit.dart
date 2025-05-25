import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/home_repository.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit({required this.homeRepository}) : super(HomeInitial());
}
