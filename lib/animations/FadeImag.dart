import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

// class FadeImg extends StatelessWidget {
//   final double delay;
//   final Widget child;

//   FadeImg(this.delay, this.child);

//   @override
//   Widget build(BuildContext context) {
//     final tween = MovieTween()
//       ..tween('opacity', Tween(begin: 0.0, end: 1.0),
//               duration: const Duration(milliseconds: 500))
//           .thenTween('x', Tween(begin: 50.0, end: 0.0),
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.easeOut);

//     return PlayAnimationBuilder<Movie>(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builder: (context, value, child) => Opacity(
//         opacity: value.get('opacity'),
//         child: Transform.translate(
//             offset: Offset(value.get('x'), 0), child: child),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeImg extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeImg(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('opacity', Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500))
      ..tween('rotation', Tween(begin: 0.0, end: 2 * 3.14),
          duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: value.get('opacity'),
        child: Transform.rotate(
          angle: value.get('rotation'),
          child: child,
        ),
      ),
    );
  }
}
