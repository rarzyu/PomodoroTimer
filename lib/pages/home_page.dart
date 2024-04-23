import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/%20components/footer_component.dart';
import 'package:pomodoro_timer/%20components/home/start_button_component.dart';
import 'package:pomodoro_timer/%20components/home/status_text_component.dart';
import 'package:pomodoro_timer/%20components/home/timer_progress_component.dart';
import 'package:pomodoro_timer/%20components/home/working_buttons_component.dart';
import 'package:pomodoro_timer/constants/timer_status.dart';
import 'package:pomodoro_timer/providers/timer_state_provider.dart';

/// ホーム画面
class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerStateProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Spacer(),
          StatusTextComponent(),
          TimerProgressComponent(),
          timerState.status == TimerStatus.stopped
              ? StartButtonComponent()
              : WorkingButtonsComponent(),
          Spacer(),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          FooterComponent(),
        ]),
      ),
    );
  }
}
