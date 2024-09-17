// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/login/data/data_sources/remote_data_source/impl/login_remote_data_source_impl.dart'
    as _i633;
import '../../features/login/data/data_sources/remote_data_source/login_remote_data_source.dart'
    as _i905;
import '../../features/login/data/repositories/login_repository_impl.dart'
    as _i1066;
import '../../features/login/domain/repositories/login_repository.dart'
    as _i902;
import '../../features/login/domain/use_cases/login_use_case.dart' as _i191;
import '../../features/login/presentation/manager/cubit/login_screen_view_model.dart'
    as _i83;
import '../../features/register/data/data_sources/remote_data_source/impl/register_remote_data_source_impl.dart'
    as _i519;
import '../../features/register/data/data_sources/remote_data_source/register_remote_data_source.dart'
    as _i365;
import '../../features/register/data/repositories/register_repository_impl.dart'
    as _i68;
import '../../features/register/domain/repositories/register_repository.dart'
    as _i994;
import '../../features/register/domain/use_cases/register_use_case.dart'
    as _i51;
import '../../features/register/presentation/manager/cubit/register_screen_view_model.dart'
    as _i205;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i365.RegisterRemoteDataSource>(
        () => _i519.RegisterRemoteDataSourceImpl());
    gh.factory<_i905.LoginRemoteDataSource>(
        () => _i633.LoginRemoteDataSourceImpl());
    gh.factory<_i994.RegisterRepository>(() => _i68.RegisterRepositoryImpl(
        registerRemoteDataSource: gh<_i365.RegisterRemoteDataSource>()));
    gh.factory<_i51.RegisterUseCase>(() => _i51.RegisterUseCase(
        registerRepository: gh<_i994.RegisterRepository>()));
    gh.factory<_i902.LoginRepository>(() => _i1066.LoginRepositoryImpl(
        loginRemoteDataSource: gh<_i905.LoginRemoteDataSource>()));
    gh.factory<_i205.RegisterScreenViewModel>(() =>
        _i205.RegisterScreenViewModel(
            registerUseCase: gh<_i51.RegisterUseCase>()));
    gh.factory<_i191.LoginUseCase>(
        () => _i191.LoginUseCase(loginRepository: gh<_i902.LoginRepository>()));
    gh.factory<_i83.LoginScreenViewModel>(() =>
        _i83.LoginScreenViewModel(loginUseCase: gh<_i191.LoginUseCase>()));
    return this;
  }
}
