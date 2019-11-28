import 'dart:async';

class EventHub {
  final StreamController<_EventHubEvent> _streamController;

  EventHub({bool sync = false})
      : _streamController =
  StreamController<_EventHubEvent>.broadcast(sync: sync);

  StreamSubscription on(String name, void Function(dynamic) callback) {
    return _streamController.stream
        .where((_EventHubEvent event) => event.name == name)
        .listen((_EventHubEvent event) => callback(event.data));
  }

  void fire(String name, [dynamic data]) {
    _EventHubEvent event = _EventHubEvent(name, data);
    _streamController.add(event);
  }

  void destroy() {
    _streamController.close();
  }
}

class _EventHubEvent {
  final String name;
  final dynamic data;

  _EventHubEvent(this.name, this.data);
}
