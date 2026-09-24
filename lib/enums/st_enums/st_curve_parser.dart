import 'package:flutter/material.dart';

import 'st_curves.dart';

/// Converts the JSON-friendly [StCurves] value to Flutter's [Curve].
extension StacCurveParser on StCurves {
  Curve get parse {
    switch (this) {
      case StCurves.bounceIn:
        return Curves.bounceIn;
      case StCurves.bounceInOut:
        return Curves.bounceInOut;
      case StCurves.bounceOut:
        return Curves.bounceOut;
      case StCurves.decelerate:
        return Curves.decelerate;
      case StCurves.ease:
        return Curves.ease;
      case StCurves.easeIn:
        return Curves.easeIn;
      case StCurves.easeInBack:
        return Curves.easeInBack;
      case StCurves.easeInCirc:
        return Curves.easeInCirc;
      case StCurves.easeInCubic:
        return Curves.easeInCubic;
      case StCurves.easeInExpo:
        return Curves.easeInExpo;
      case StCurves.easeInOut:
        return Curves.easeInOut;
      case StCurves.easeInOutBack:
        return Curves.easeInOutBack;
      case StCurves.easeInOutCirc:
        return Curves.easeInOutCirc;
      case StCurves.easeInOutCubic:
        return Curves.easeInOutCubic;
      case StCurves.easeInOutCubicEmphasized:
        return Curves.easeInOutCubicEmphasized;
      case StCurves.easeInOutExpo:
        return Curves.easeInOutExpo;
      case StCurves.easeInOutQuad:
        return Curves.easeInOutQuad;
      case StCurves.easeInOutQuart:
        return Curves.easeInOutQuart;
      case StCurves.easeInOutQuint:
        return Curves.easeInOutQuint;
      case StCurves.easeInOutSine:
        return Curves.easeInOutSine;
      case StCurves.easeInQuad:
        return Curves.easeInQuad;
      case StCurves.easeInQuart:
        return Curves.easeInQuart;
      case StCurves.easeInQuint:
        return Curves.easeInQuint;
      case StCurves.easeInSine:
        return Curves.easeInSine;
      case StCurves.easeInToLinear:
        return Curves.easeInToLinear;
      case StCurves.easeOut:
        return Curves.easeOut;
      case StCurves.easeOutBack:
        return Curves.easeOutBack;
      case StCurves.easeOutCirc:
        return Curves.easeOutCirc;
      case StCurves.easeOutCubic:
        return Curves.easeOutCubic;
      case StCurves.easeOutExpo:
        return Curves.easeOutExpo;
      case StCurves.easeOutQuad:
        return Curves.easeOutQuad;
      case StCurves.easeOutQuart:
        return Curves.easeOutQuart;
      case StCurves.easeOutQuint:
        return Curves.easeOutQuint;
      case StCurves.easeOutSine:
        return Curves.easeOutSine;
      case StCurves.elasticIn:
        return Curves.elasticIn;
      case StCurves.elasticInOut:
        return Curves.elasticInOut;
      case StCurves.elasticOut:
        return Curves.elasticOut;
      case StCurves.fastEaseInToSlowEaseOut:
        return Curves.fastEaseInToSlowEaseOut;
      case StCurves.fastLinearToSlowEaseIn:
        return Curves.fastLinearToSlowEaseIn;
      case StCurves.fastOutSlowIn:
        return Curves.fastOutSlowIn;
      case StCurves.linear:
        return Curves.linear;
      case StCurves.linearToEaseOut:
        return Curves.linearToEaseOut;
      case StCurves.slowMiddle:
        return Curves.slowMiddle;
    }
  }
}
