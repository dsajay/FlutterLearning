import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/domain/entities/add_member.dart';
import 'package:flutter1/domain/use_case.dart';
import 'package:flutter1/fcm/local_notification.dart';
import 'package:flutter1/firebase_options.dart';
import 'package:flutter1/presentation/bloc/member/member_bloc.dart';

import 'package:flutter1/presentation/dashboard.dart';
import 'package:flutter1/tabs/tab_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:workmanager/workmanager.dart';

import 'data/remote/api/retrofit_client_service.dart';
import 'data/repositories/remote_data_repositories.dart';
import 'data/repositories/remote_data_repositories_impl.dart';
import 'domain/entities/my_entity.dart';
import 'domain/repositories/hive_repository.dart';
import 'domain/repositories/hive_repository_impl.dart';
import 'domain/repositories/member/member_repository.dart';
import 'domain/repositories/member/member_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    // Perform your periodic task here
    LocalNotification.showNotification(title: "title", body: "body", payload: "payload");
    print("Background Task: $task");
    return Future.value(true); // Indicate success
  });
}
void main() async{
  var logger = Logger();
  WidgetsFlutterBinding.ensureInitialized();
  await runZonedGuarded(() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await EasyLocalization.ensureInitialized();
    final fcmToken = await FirebaseMessaging.instance.getToken();
    logger.d("Token $fcmToken");
  }, (error, stackTrace) async {
    logger.d("Error  $error");
    //await Sentry.captureException(error, stackTrace: stackTrace);
  });



  await LocalNotification.initNotification();



  await Hive.initFlutter();
  Hive.registerAdapter(MyEntityAdapter()); // Register the adapter
  Hive.registerAdapter(AddMemberEntityAdapter()); // Register the adapter
  final box = await Hive.openBox<MyEntity>('myBox');
  final memberBox = await Hive.openBox<AddMemberEntity>('addMember');

  final HiveRepository myRepository = HiveRepositoryImpl(box,memberBox);
  final MemberRepository memberRepository = MemberRepositoryImpl(memberBox);

  GetIt.I.registerLazySingleton<HiveRepository>(() => myRepository);
  GetIt.I.registerLazySingleton<MemberRepository>(() => memberRepository);

  logger.d("Logger is working!");


  final dio=Dio();
  GetIt.I.registerLazySingleton<RestClientService>(() => RestClientService(dio));
  GetIt.I.registerLazySingleton<RemoteDataRepositories>(() => RemoteDataRepositoriesImpl());
  GetIt.I.registerLazySingleton<UseCase>(() => UseCase());
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('hi', 'IN')],
        path: 'resources/langs', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: TabScreen()
    ),
  );
}

class DemoFlutter extends StatelessWidget {
   DemoFlutter({super.key});
  final MemberRepository _memberRepository = GetIt.I<MemberRepository>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green, brightness: Brightness.light),
        useMaterial3: true,
      ),
      home:   MultiBlocProvider(
        providers: [
          BlocProvider<MemberBloc>(create:(BuildContext context) => MemberBloc(_memberRepository)),
        ],

        child: const Dashboard(),
      ),
    );
  }
}


