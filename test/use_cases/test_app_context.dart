import 'package:fit_buddy_app/app_context/app_context.dart';
import 'package:fit_buddy_app/auth/presentation/presenter/auth_presenter.dart';

import 'auth_repository_in_memory.dart';

class TestAppContext implements AppContext {
  final AuthRepositoryInMemory _authRepositoryInMemory;
  final AppContext _context;

  TestAppContext._(this._context, this._authRepositoryInMemory);

  factory TestAppContext({AuthRepositoryInMemory? authRepository}) {
    final authRepositoryInMemory = authRepository ?? AuthRepositoryInMemory();
    final context = AppContext(authRepository: authRepositoryInMemory);
    return TestAppContext._(
      context,
      authRepositoryInMemory,
    );
  }

  @override
  AuthPresenter get authPresenter => _context.authPresenter;

  AuthRepositoryInMemory get authRepository => _authRepositoryInMemory;
}
