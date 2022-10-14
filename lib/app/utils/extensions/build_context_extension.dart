import 'package:flutter/material.dart';
import 'package:nursey/configs/configs.dart';

import '../design/design.dart';

extension BuildContextX on BuildContext {
  Future<T?> push<T extends Object?>(
    Route<T> route, {
    bool rootNavigator = false,
  }) {
    return Navigator.of(this, rootNavigator: rootNavigator).push<T>(route);
  }

  Future<T?> pushReplacement<T extends Object?>(
    Route<T> route, {
    bool rootNavigator = false,
  }) {
    return Navigator.of(this, rootNavigator: rootNavigator)
        .pushReplacement<T, T>(route);
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Route<T> route, {
    bool rootNavigator = false,
  }) {
    return Navigator.of(this, rootNavigator: rootNavigator)
        .pushAndRemoveUntil(route, (route) => false);
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
    bool rootNavigator = false,
  }) {
    return Navigator.of(this, rootNavigator: rootNavigator).pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
    bool rootNavigator = false,
  }) {
    return Navigator.of(this, rootNavigator: rootNavigator)
        .pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
    bool rootNavigator = false,
  }) {
    return Navigator.of(this, rootNavigator: rootNavigator)
        .pushNamedAndRemoveUntil(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  Future<T?> pushNamedAndRemoveAll<T extends Object?>(
    String newRouteName, {
    Object? arguments,
    bool rootNavigator = false,
  }) {
    return Navigator.of(this, rootNavigator: rootNavigator)
        .pushNamedAndRemoveUntil(
      newRouteName,
      (_) => false,
      arguments: arguments,
    );
  }

  void popUntil(RoutePredicate predicate) {
    return Navigator.of(this).popUntil(predicate);
  }

  void pop<T extends Object?>({T? result, bool rootNavigator = false}) {
    return Navigator.of(this, rootNavigator: rootNavigator).pop<T>(result);
  }

  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) =>
      ScaffoldMessenger.of(this)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: TextStyle(color: Theme.of(this).canvasColor),
            ),
            backgroundColor: Theme.of(this).textTheme.bodyText1?.color,
            duration: duration,
          ),
        );
  void showAppDialog(
    BuildContext context, {
    required Widget widget,
    bool? canDismiss,
  }) =>
      showDialog(
          context: this,
          barrierDismissible: canDismiss ?? true,
          builder: (context) {
            return widget;
          });
  void showBottomSheet(
    Widget widget, {
    Color backgroundColor = AppColors.primaryBg,
    double elevation = 0.0,
  }) =>
      Scaffold.of(this)
        ..showBottomSheet<bool>(
          (BuildContext context) {
            return widget;
          },
          backgroundColor: backgroundColor,
          elevation: elevation,
        );

  Future<T?> showMyModalBottomSheet<T>(Widget widget, {bool? enableDrag}) =>
      showModalBottomSheet<T>(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        isScrollControlled: true,
        enableDrag: enableDrag ?? false,
        context: this,
        builder: (context) => widget,
      );

  void showErrorToast({required String title, required String message}) {
    MotionToast.error(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      dismissable: true,
      toastDuration: const Duration(milliseconds: 5500),
      description: Text(message),
      animationType: AnimationType.fromLeft,
      position: MotionToastPosition.top,
    ).show(this);
  }

  void showInfoToast({required String title, required String message}) {
    MotionToast.info(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      dismissable: true,
      toastDuration: const Duration(milliseconds: 5500),
      description: Text(message),
      animationType: AnimationType.fromLeft,
      position: MotionToastPosition.top,
    ).show(this);
  }

  void showSuccessToast({required String title, required String message}) {
    MotionToast.success(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      dismissable: true,
      toastDuration: const Duration(milliseconds: 5500),
      description: Text(message),
      animationType: AnimationType.fromLeft,
      position: MotionToastPosition.top,
    ).show(this);
  }

  void unFocus() {
    return FocusScope.of(this).requestFocus(FocusNode());
  }
}
