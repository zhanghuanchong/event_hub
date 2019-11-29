import 'dart:async';

/// Dispatch and listen events everywhere using Dart [Stream] API.
/// Also know as `Event Bus`.
class EventHub {
  /// [StreamController] for the event hub stream
  final StreamController<_EventHubEvent> _streamController;

  /// Create a [EventHub]
  EventHub({bool sync = false})
      : _streamController =
  StreamController<_EventHubEvent>.broadcast(sync: sync);

  /// Register a event listener. The [callback] will be called once the [name]
  /// is fired.
  StreamSubscription on(String name, void Function(dynamic) callback) {
    return _streamController.stream
        .where((_EventHubEvent event) => event.name == name)
        .listen((_EventHubEvent event) => callback(event.data));
  }

  /// Fire a event, which will notify all the event listeners
  /// that listen to the event [name]. You can also pass an optional [data]
  void fire(String name, [dynamic data]) {
    _EventHubEvent event = _EventHubEvent(name, data);
    _streamController.add(event);
  }

  /// You don't have to destroy it explicitly
  void destroy() {
    _streamController.close();
  }
}

/// The underlying event which is fired. You won't need it.
class _EventHubEvent {
  final String name;
  final dynamic data;

  _EventHubEvent(this.name, this.data);
}
