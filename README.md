# Event Hub

[![Star this Repo](https://img.shields.io/github/stars/zhanghuanchong/event_hub)](https://github.com/zhanghuanchong/event_hub)
[![Pub Package](https://img.shields.io/pub/v/event_hub.svg)](https://pub.dev/packages/event_hub)

## What

Dispatch and listen events everywhere and whenever using Dart [Stream](https://api.dartlang.org/stable/dart-async/Stream-class.html). Also know as `Event Bus`.

## How

### 1. Create an Event Hub

You can define a global event bus in your app, just like this:

```dart
import 'package:event_hub/event_hub.dart';

EventHub eventHub = EventHub();
```

### 2. Register Listeners

```dart
eventHub.on('yourEventName', (dynamic data) {
  // Your handler
  print(data); // some optional data
});
```

You can cancel the subscription later if you want:

```dart
StreamSubscription subscription = eventHub.on('yourEventName', (_) {});
// ...
subscription.cancel();
```

### 3. Fire a event

```dart
eventHub.fire('yourEventName', 'some optional data');
```

That's all!

You can define your listeners or fire the events everywhere in your app. For instance, in a Flutter app, register the listeners in the `initState` method in a Widget State and fire the event in another widget's tap handler.

## Why

The `Event Hub` allows publishers to fire events and listeners to subscribe for events, everywhere in a Web or Flutter application.

For instance, in a Flutter application, we need below technology to communicate between components:

#### Notifications

  Works only when you want to notify ancestor widgets. You need to define the notification class, trigger a notification and create a notification listener.
  
#### ValueListenable / InheritedWidget / ChangeNotifierProvider

  More powerful, but it's heavy. You need to define the `ChangeNotifier` class, when to notifier, notify whether or not, insert into the render tree, etc. Sometimes the elements will be rendered frequently when value changes, which is not expected, and will affect the performance.
  
#### Callbacks

  You can pass callback as parameters, but this is dirty and not flexible. When there are many levels between the widgets you want to communicate, you have to pass the callback to each level.

### Event Bus

This package is inspired by the `EventBus` package: [https://github.com/marcojakob/dart-event-bus](https://github.com/marcojakob/dart-event-bus), but with `EventHub`, you even don't need to define a event class.

## License
The MIT License (MIT)
