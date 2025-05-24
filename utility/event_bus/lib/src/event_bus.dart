import 'package:rxdart/rxdart.dart';

final _subject = PublishSubject<dynamic>();

Stream<T> on<T>() => _subject.stream.where((event) => event is T).cast<T>();

void fire(dynamic event) => _subject.add(event);

void dispose() => _subject.close();
