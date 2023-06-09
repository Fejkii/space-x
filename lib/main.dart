import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/app/app_preferences.dart';
import 'package:space_x/app/dependency_injection.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/cubit/company/company_cubit.dart';
import 'package:space_x/cubit/launch/launch_cubit.dart';
import 'package:space_x/cubit/rocket/rocket_cubit.dart';
import 'package:space_x/ui/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppDependences();
  await instance<AppPreferences>().initSP();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LaunchCubit>(create: (context) => instance<LaunchCubit>()),
        BlocProvider<CompanyCubit>(create: (context) => instance<CompanyCubit>()),
        BlocProvider<RocketCubit>(create: (context) => instance<RocketCubit>()),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeView(),
      ),
    );
  }
}
