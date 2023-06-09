part of '../widgets.dart';

class SplashView extends StatefulWidget {
  final PositionalFlex flex;
  final int duration;
  final EdgeInsetsGeometry? contentPadding;
  final Color? statusBarColor;
  final Brightness statusBarBrightness;
  final Color? backgroundColor;
  final Widget? custom;
  final String? title, subtitle;
  final Color? titleColor, subtitleColor;
  final double titleExtraSize, subtitleExtraSize;
  final EdgeInsetsGeometry? titlePadding, subtitleMargin;
  final double? titleSize, subtitleSize;
  final TextStyle titleStyle;
  final TextStyle? subtitleStyle;
  final FontWeight? titleWeight, subtitleWeight;
  final String? logo;
  final Color? logoColor;
  final EdgeInsetsGeometry? logoPadding;
  final double? logoRadius;
  final double? logoSize;

  final Future Function()? onExecute;
  final Function(BuildContext context)? onRoute;

  const SplashView({
    Key? key,
    this.contentPadding,
    this.flex = const PositionalFlex(),
    this.duration = 5000,
    this.statusBarColor = Colors.white,
    this.statusBarBrightness = Brightness.dark,
    this.backgroundColor = Colors.white,
    this.custom,
    this.onRoute,
    this.onExecute,
    this.title,
    this.subtitle,
    this.titleColor,
    this.subtitleColor,
    this.titleExtraSize = 1,
    this.subtitleExtraSize = 1,
    this.titlePadding,
    this.subtitleMargin,
    this.titleSize = 20,
    this.subtitleSize,
    this.titleStyle = const TextStyle(),
    this.subtitleStyle,
    this.titleWeight = FontWeight.bold,
    this.subtitleWeight = FontWeight.w300,
    this.logo,
    this.logoColor,
    this.logoPadding,
    this.logoRadius,
    this.logoSize,
  }) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(milliseconds: widget.duration), () {
      if (widget.onExecute != null) {
        widget.onExecute?.call().whenComplete(() {
          return widget.onRoute?.call(context);
        });
      } else {
        widget.onRoute?.call(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: widget.statusBarColor,
          statusBarIconBrightness: widget.statusBarBrightness,
          statusBarBrightness: widget.statusBarBrightness,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: widget.backgroundColor,
        child: Column(
          children: [
            Spacer(flex: widget.flex.top),
            Container(
              padding: widget.contentPadding,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: widget.custom ??
                          Column(
                            children: [
                              Container(
                                margin: widget.logoPadding,
                                width: widget.logoSize ?? 70,
                                height: widget.logoSize ?? 70,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    widget.logoRadius ?? 0,
                                  ),
                                ),
                                child: Image.asset(
                                  widget.logo ?? "",
                                  fit: BoxFit.cover,
                                  color: widget.logoColor,
                                ),
                              ),
                              Container(
                                margin: widget.titlePadding ??
                                    const EdgeInsets.only(top: 16),
                                child: Text(
                                  widget.title ?? "",
                                  textAlign: TextAlign.center,
                                  style: widget.titleStyle.copyWith(
                                    color: widget.titleColor,
                                    fontSize: widget.titleSize,
                                    fontWeight: widget.titleWeight,
                                    letterSpacing: widget.titleExtraSize / 10,
                                  ),
                                ),
                              ),
                              Container(
                                padding: widget.subtitleMargin ??
                                    const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                child: Text(
                                  widget.subtitle ?? "",
                                  textAlign: TextAlign.center,
                                  style: (widget.subtitleStyle ??
                                          widget.titleStyle)
                                      .copyWith(
                                    color: widget.subtitleColor,
                                    fontSize: widget.subtitleSize ??
                                        ((widget.titleSize ?? 1) * 0.5),
                                    fontWeight: widget.subtitleWeight,
                                    letterSpacing:
                                        widget.subtitleExtraSize / 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: widget.flex.bottom),
          ],
        ),
      ),
    );
  }
}

class PositionalFlex {
  final int top;
  final int bottom;

  const PositionalFlex({
    int top = 2,
    int bottom = 3,
  })  : top = top > 0 ? top : 1,
        bottom = bottom > 0 ? bottom : 2;
}
