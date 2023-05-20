part of '../widgets.dart';

typedef FrameBuilder<T> = Widget Function(
  BuildContext context,
  FrameLayer layer,
  T item,
);

class FrameView<T extends Object> extends YMRView<FrameViewController<T>> {
  final FrameBuilder<T>? frameBuilder;

  final Color? itemBackground;
  final double? itemSpace;
  final List<T>? items;

  const FrameView({
    Key? key,
    super.controller,
    super.width,
    super.height,
    super.flex,
    super.background,
    super.borderRadius,
    super.borderRadiusTL,
    super.borderRadiusTR,
    super.borderRadiusBL,
    super.borderRadiusBR,
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,
    super.visibility,
    this.frameBuilder,
    this.itemBackground,
    this.itemSpace,
    this.items,
  }) : super(key: key);

  @override
  FrameViewController<T> attachController() {
    return FrameViewController<T>();
  }

  @override
  FrameViewController<T> initController(
    FrameViewController<T> controller,
  ) {
    return controller.attach(
      this,
      frameBuilder: frameBuilder,
      itemBackground: itemBackground,
      itemSpace: itemSpace,
      items: items,
    );
  }

  @override
  Widget? attach(
    BuildContext context,
    FrameViewController<T> controller,
  ) {
    controller.setContext(context);
    switch (controller.layer) {
      case FrameLayer.single:
        return _FrameLayerSingle<T>(controller: controller);
      case FrameLayer.double:
        return _FrameLayerDouble<T>(controller: controller);
      case FrameLayer.triple:
        return _FrameLayerTriple<T>(controller: controller);
      case FrameLayer.fourth:
        return _FrameLayerFourth<T>(controller: controller);
      case FrameLayer.fifth:
        return _FrameLayerFifth<T>(controller: controller);
      case FrameLayer.sixth:
        return _FrameLayerSixth<T>(controller: controller);
      case FrameLayer.seventh:
        return _FrameLayerSeventh<T>(controller: controller);
      case FrameLayer.eighth:
        return _FrameLayerEighth<T>(controller: controller);
      case FrameLayer.ninth:
      case FrameLayer.multiple:
        return _FrameLayerMultiple<T>(controller: controller);
      default:
        return const SizedBox();
    }
  }
}

class _FrameLayerSingle<T> extends StatelessWidget {
  final FrameViewController<T> controller;

  const _FrameLayerSingle({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _FrameBuilder(
      controller: controller,
      item: controller.items[0],
      resizable: true,
    );
  }
}

class _FrameLayerDouble<T> extends StatelessWidget {
  final FrameViewController<T> controller;

  const _FrameLayerDouble({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        _FrameBuilder(
          controller: controller,
          flexible: true,
          item: controller.items[0],
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        _FrameBuilder(
          controller: controller,
          flexible: true,
          item: controller.items[1],
        ),
      ],
    );
  }
}

class _FrameLayerTriple<T> extends StatelessWidget {
  final FrameViewController<T> controller;

  const _FrameLayerTriple({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        _FrameBuilder(
          controller: controller,
          item: controller.items[0],
          flexible: true,
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                item: controller.items[1],
                flexible: true,
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                item: controller.items[2],
                flexible: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FrameLayerFourth<T> extends StatelessWidget {
  final FrameViewController<T> controller;

  const _FrameLayerFourth({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[0],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[1],
              ),
            ],
          ),
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[2],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[3],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FrameLayerFifth<T> extends StatelessWidget {
  final FrameViewController<T> controller;

  const _FrameLayerFifth({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        _FrameBuilder(
          controller: controller,
          item: controller.items[0],
          flexible: true,
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[1],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[2],
              ),
            ],
          ),
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[3],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[4],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FrameLayerSixth<T> extends StatelessWidget {
  final FrameViewController<T> controller;

  const _FrameLayerSixth({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[0],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[1],
              ),
            ],
          ),
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[2],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[3],
              ),
            ],
          ),
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[4],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[5],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FrameLayerSeventh<T> extends StatelessWidget {
  final FrameViewController<T> controller;

  const _FrameLayerSeventh({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        _FrameBuilder(
          controller: controller,
          flexible: true,
          item: controller.items[0],
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[1],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[2],
              ),
            ],
          ),
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[3],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[4],
              ),
            ],
          ),
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[5],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[6],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FrameLayerEighth<T> extends StatelessWidget {
  final FrameViewController<T> controller;

  const _FrameLayerEighth({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[0],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[1],
              ),
            ],
          ),
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[2],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[3],
              ),
            ],
          ),
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[4],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[5],
              ),
            ],
          ),
        ),
        SizedBox(
          height: controller.spaceBetween,
        ),
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[6],
              ),
              SizedBox(
                width: controller.spaceBetween,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[7],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FrameLayerMultiple<T> extends StatelessWidget {
  final FrameViewController<T> controller;

  const _FrameLayerMultiple({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: controller.y,
      children: [
        Expanded(
          child: Flex(
            direction: controller.x,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[0],
              ),
              SizedBox(
                width: controller.spaceY,
                height: controller.spaceX,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[1],
              ),
            ],
          ),
        ),
        SizedBox(
          width: controller.spaceX,
          height: controller.spaceY,
        ),
        Expanded(
          child: Flex(
            direction: controller.x,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[2],
              ),
              SizedBox(
                width: controller.spaceY,
                height: controller.spaceX,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[3],
              ),
            ],
          ),
        ),
        SizedBox(
          width: controller.spaceX,
          height: controller.spaceY,
        ),
        Expanded(
          child: Flex(
            direction: controller.x,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[4],
              ),
              SizedBox(
                width: controller.spaceY,
                height: controller.spaceX,
              ),
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[5],
              ),
            ],
          ),
        ),
        SizedBox(
          width: controller.spaceX,
          height: controller.spaceY,
        ),
        Expanded(
          child: Flex(
            direction: controller.x,
            children: [
              _FrameBuilder(
                controller: controller,
                flexible: true,
                item: controller.items[6],
              ),
              SizedBox(
                width: controller.spaceY,
                height: controller.spaceX,
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _FrameBuilder(
                        controller: controller,
                        item: controller.items[7],
                      ),
                      TextView(
                        width: double.infinity,
                        height: double.infinity,
                        gravity: Alignment.center,
                        text: "+${controller.invisibleItemSize}",
                        textColor: Colors.white,
                        textSize: 24,
                        fontWeight: FontWeight.bold,
                        background: Colors.black.withOpacity(0.35),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FrameBuilder<T> extends StatelessWidget {
  final FrameViewController<T> controller;
  final double? maxHeight;
  final T item;
  final double? dimension;
  final bool flexible, resizable;

  const _FrameBuilder({
    Key? key,
    required this.controller,
    required this.item,
    this.flexible = false,
    this.resizable = false,
    this.maxHeight,
    this.dimension,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YMRView(
      flex: flexible ? 1 : null,
      width: double.infinity,
      height: resizable ? null : double.infinity,
      heightMax: maxHeight,
      background: controller.itemBackground,
      child: controller.frameBuilder?.call(
        context,
        controller.layer,
        item,
      ),
    );
  }
}

class FrameViewController<T> extends ViewController {
  late Size size;
  FrameBuilder<T>? frameBuilder;
  Color? itemBackground;
  double spaceBetween = 4;
  ImageType? imageType;
  List<T> items = [];

  void setContext(BuildContext context) {
    this.size = MediaQuery.of(context).size;
  }

  @override
  FrameViewController<T> attach(
    YMRView<ViewController> view, {
    FrameBuilder<T>? frameBuilder,
    Color? itemBackground,
    double? itemSpace,
    List<T>? items,
  }) {
    super.attach(view);
    this.frameBuilder = frameBuilder ?? this.frameBuilder;
    this.itemBackground = itemBackground ?? this.itemBackground;
    this.spaceBetween = itemSpace ?? this.spaceBetween;
    this.items = items ?? this.items;
    return this;
  }

  int get invisibleItemSize => items.length - 7;

  int get itemSize => items.length;

  FrameLayer get layer => FrameLayer.from(itemSize);

  bool get isX {
    return size.width < size.height;
  }

  double? get spaceX => isX ? null : spaceBetween;

  double? get spaceY => isX ? spaceBetween : null;

  Axis get x => isX ? Axis.horizontal : Axis.vertical;

  Axis get y => isX ? Axis.vertical : Axis.horizontal;
}

enum FrameLayer {
  none,
  single,
  double,
  triple,
  fourth,
  fifth,
  sixth,
  seventh,
  eighth,
  ninth,
  multiple;

  factory FrameLayer.from(int size) {
    if (size == 1) {
      return FrameLayer.single;
    } else if (size == 2) {
      return FrameLayer.double;
    } else if (size == 3) {
      return FrameLayer.triple;
    } else if (size == 4) {
      return FrameLayer.fourth;
    } else if (size == 5) {
      return FrameLayer.fifth;
    } else if (size == 6) {
      return FrameLayer.sixth;
    } else if (size == 7) {
      return FrameLayer.seventh;
    } else if (size == 8) {
      return FrameLayer.eighth;
    } else if (size == 9) {
      return FrameLayer.ninth;
    } else if (size > 9) {
      return FrameLayer.multiple;
    } else {
      return FrameLayer.none;
    }
  }
}