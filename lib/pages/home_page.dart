import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer/%20components/common/show_dialog.component.dart';
import 'package:pomodoro_timer/%20components/footer_component.dart';
import 'package:pomodoro_timer/%20components/home/start_button_component.dart';
import 'package:pomodoro_timer/%20components/home/status_text_component.dart';
import 'package:pomodoro_timer/%20components/home/timer_progress_component.dart';
import 'package:pomodoro_timer/%20components/home/working_buttons_component.dart';
import 'package:pomodoro_timer/constants/timer_status.dart';
import 'package:pomodoro_timer/generated/l10n.dart';
import 'package:pomodoro_timer/providers/timer_state_provider.dart';

/// ホーム画面
class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerStateProvider);
    final ShowDialogComponent _showDialogComponent = ShowDialogComponent();

    // タイマーが終了した場合はダイアログを表示
    // ウィジェットが描画された後にダイアログを実行する必要があるので、
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.watch(timerStateProvider.notifier).isFinished) {
        _showDialogComponent.showInfoDialogAfterAd(
            context, "", S.of(context).finishMessage);
      }
    });

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
