import 'package:flutter/material.dart';

typedef ValueChanged2Param<T,T2> = void Function(T value, T2 value2);
typedef ValueChanged3Param<T,T2, T3> = void Function(T value, T2 value2, T3 value3);
typedef ValueChanged4Param<T,T2, T3, T4> = void Function(T value, T2 value2, T3 value3, T4 value4);
typedef ValueChanged5Param<T,T2, T3, T4, T5> = void Function(T value, T2 value2, T3 value3, T4 value4, T5 value5);
typedef ValueChanged6Param<T,T2, T3, T4, T5, T6> = void Function(T value, T2 value2, T3 value3, T4 value4, T5 value5, T6 value6 );
typedef ChildReader<T> = T Function(Map<String, dynamic> json);
typedef WidgetFromDataBuilder<T> = Widget Function(T value);
typedef WidgetFromDataBuilder2<T,T2> = Widget Function(T value, T2 index);
typedef ObjectBuilder<T> = T Function();
typedef ListWidgetBuilder = List<Widget> Function();