import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Bridges a Riverpod provider to go_router's `refreshListenable`, so route
/// redirects re-evaluate whenever auth state changes.
class RouterRefreshNotifier extends ChangeNotifier {
  RouterRefreshNotifier(Ref ref, ProviderListenable<Object?> provider) {
    ref.listen(provider, (_, __) => notifyListeners());
  }
}
