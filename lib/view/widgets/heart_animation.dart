import 'package:flutter/cupertino.dart';

class HeartAnimation extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  HeartAnimation(
      {Key? key,
      required this.child,
      required this.isAnimating,
      this.duration = const Duration(milliseconds: 200),
      this.onEnd,
      })
      : super(key: key);

  @override
  State<HeartAnimation> createState() => _HeartAnimationState();
}

class _HeartAnimationState extends State<HeartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    final halfDuration = widget.duration.inMilliseconds ~/ 2;
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: halfDuration));

    scale = Tween<double>(begin: 1, end: 1.2).animate(animationController);

  }


  @override
  void didUpdateWidget(covariant HeartAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(widget.isAnimating!= oldWidget.isAnimating){
      doAnimation();
    }
  }

  Future doAnimation()async{
   if(widget.isAnimating){
     await animationController.forward();
     await animationController.reverse();
     if(widget.onEnd != null){
       widget.onEnd!();
     }
   }
  }

  @override
  void dispose() {

    animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: scale,
        child: widget.child);
  }
}
