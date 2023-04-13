import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x/app/app_preferences.dart';
import 'package:space_x/cubit/company/company_cubit.dart';
import 'package:space_x/cubit/launch/launch_cubit.dart';
import 'package:space_x/cubit/rocket/rocket_cubit.dart';

final instance = GetIt.instance;

Future<void> initAppDependences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance<SharedPreferences>()));

  instance.registerLazySingleton<LaunchCubit>(() => LaunchCubit());
  instance.registerLazySingleton<CompanyCubit>(() => CompanyCubit());
  instance.registerLazySingleton<RocketCubit>(() => RocketCubit());
}
