import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/domain/entities/add_member.dart';
import 'package:flutter1/domain/use_case.dart';
import 'package:flutter1/presentation/bloc/member/member_bloc.dart';

import 'package:flutter1/presentation/dashboard.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

import 'data/remote/api/retrofit_client_service.dart';
import 'data/repositories/remote_data_repositories.dart';
import 'data/repositories/remote_data_repositories_impl.dart';
import 'domain/entities/my_entity.dart';
import 'domain/repositories/hive_repository.dart';
import 'domain/repositories/hive_repository_impl.dart';
import 'domain/repositories/member/member_repository.dart';
import 'domain/repositories/member/member_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(MyEntityAdapter()); // Register the adapter
  Hive.registerAdapter(AddMemberEntityAdapter()); // Register the adapter
  final box = await Hive.openBox<MyEntity>('myBox');
  final memberBox = await Hive.openBox<AddMemberEntity>('addMember');

  final HiveRepository myRepository = HiveRepositoryImpl(box,memberBox);
  final MemberRepository memberRepository = MemberRepositoryImpl(memberBox);

  GetIt.I.registerLazySingleton<HiveRepository>(() => myRepository);
  GetIt.I.registerLazySingleton<MemberRepository>(() => memberRepository);
  var logger = Logger();
  logger.d("Logger is working!");

  final dio=Dio();
  GetIt.I.registerLazySingleton<RestClientService>(() => RestClientService(dio));
  GetIt.I.registerLazySingleton<RemoteDataRepositories>(() => RemoteDataRepositoriesImpl());
  GetIt.I.registerLazySingleton<UseCase>(() => UseCase());

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('hi', 'IN')],
        path: 'resources/langs', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: DemoFlutter()
    ),
  );
}

class DemoFlutter extends StatelessWidget {
  final Locale _locale = Locale('en');
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
