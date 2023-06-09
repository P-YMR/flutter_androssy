library widgets;

import 'dart:async';
import 'dart:io';
import 'dart:math' show max, min;

import 'package:badges/badges.dart' as b;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'builders/activity.dart';

part 'builders/fragment.dart';

part 'builders/notifier_view.dart';

part 'builders/render_time_builder.dart';

part 'builders/splash_view.dart';

part 'builders/theme.dart';

part 'builders/widget_wrapper.dart';

part 'views/avatar_view.dart';

part 'views/button.dart';

part 'views/content_view.dart';

part 'views/expendable_text_view.dart';

part 'views/expensive_scroll_view.dart';

part 'views/flexible_view.dart';

part 'views/icon_view.dart';

part 'views/image_view.dart';

part 'views/linear_layout.dart';

part 'views/material_image_view.dart';

part 'views/recycler_view.dart';

part 'views/slide_image_view.dart';

part 'views/stack_layout.dart';

part 'views/stream_view.dart';

part 'views/tab_layout.dart';

part 'views/tab_view.dart';

part 'views/text_view.dart';

part 'views/view.dart';

part 'views/view_pager.dart';

part 'widgets/badge_button.dart';

part 'widgets/border_button.dart';

part 'widgets/future_button.dart';

part 'widgets/image_button.dart';

part 'widgets/material_icon.dart';

part 'widgets/quantity_button.dart';

part 'widgets/toggle_button.dart';

typedef OnPagingListener = Function(dynamic value);

extension _ScrollControllerExtension on ScrollController {
  ScrollController paging({required OnPagingListener onListen}) {
    addListener(() {
      if (position.atEdge) {
        if (position.pixels != 0) {
          onListen.call(position.pixels);
        }
      }
    });
    return this;
  }
}
