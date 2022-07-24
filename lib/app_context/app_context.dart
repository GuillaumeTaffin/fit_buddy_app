import 'package:fit_buddy_app/auth/data/supabase_auth_repository.dart';
import 'package:fit_buddy_app/auth/domain/auth_repository.dart';
import 'package:fit_buddy_app/auth/presentation/presenter/auth_presenter.dart';

class AppContext {
  final AuthPresenter _authPresenter;

  AppContext._(this._authPresenter);

  factory AppContext({AuthRepository? authRepository}) {
    final repo = authRepository ?? AuthRepositorySupabase();
    return AppContext._(AuthPresenter(repo));
  }

  AuthPresenter get authPresenter => _authPresenter;
}
