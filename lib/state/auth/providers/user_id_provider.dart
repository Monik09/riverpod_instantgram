import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instant_gram/state/auth/providers/auth_state_provider.dart';
import 'package:instant_gram/state/posts/typedef/user_id.dart';

final userIdProvider = Provider<UserId?>((ref) {
  return ref.watch(authStateProvider).userId;
});
