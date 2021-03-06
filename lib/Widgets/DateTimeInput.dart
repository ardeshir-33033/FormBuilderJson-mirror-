import 'package:flutter/cupertino.dart';
// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:intl/intl.dart';

class CupertinoPickerDemo extends StatefulWidget {
  DateTime enteredVal;
  CupertinoPickerDemo({this.enteredVal});

  @override
  _CupertinoPickerDemoState createState() => _CupertinoPickerDemoState();
}

class _CupertinoPickerDemoState extends State<CupertinoPickerDemo> {
  Duration timer = const Duration();

  DateTime date = DateTime.now();

  DateTime time = DateTime.now();

  DateTime dateTime = DateTime.now();

  void _showDemoPicker({
    @required BuildContext context,
    @required Widget child,
  }) {
    final themeData = CupertinoTheme.of(context);
    final dialogBody = CupertinoTheme(
      data: themeData,
      child: child,
    );

    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => dialogBody,
    );
  }

  Widget _buildTimePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDemoPicker(
          context: context,
          child: _BottomPicker(
            child: CupertinoDatePicker(
              backgroundColor:
              CupertinoColors.systemBackground.resolveFrom(context),
              mode: CupertinoDatePickerMode.time,
              initialDateTime: time,
              onDateTimeChanged: (newDateTime) {
                setState(() => time = newDateTime);
              },
            ),
          ),
        );
      },
      child: _Menu(
        children: [
          Text('ساعت'),
          Text(
            DateFormat.jm().format(time),
            style: const TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ],
      ),
    );
  }
  //
  // Widget _buildDateAndTimePicker(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {
  //       _showDemoPicker(
  //         context: context,
  //         child: _BottomPicker(
  //           child: CupertinoDatePicker(
  //             backgroundColor:
  //             CupertinoColors.systemBackground.resolveFrom(context),
  //             mode: CupertinoDatePickerMode.dateAndTime,
  //             initialDateTime: dateTime,
  //             onDateTimeChanged: (newDateTime) {
  //               setState(() => dateTime = newDateTime);
  //             },
  //           ),
  //         ),
  //       );
  //     },
  //     child: _Menu(
  //       children: [
  //         Text(GalleryLocalizations.of(context).demoCupertinoPickerDateTime),
  //         Flexible(
  //           child: Text(
  //             DateFormat.yMMMd().add_jm().format(dateTime),
  //             style: const TextStyle(color: CupertinoColors.inactiveGray),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildCountdownTimerPicker(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {
  //       _showDemoPicker(
  //         context: context,
  //         child: _BottomPicker(
  //           child: CupertinoTimerPicker(
  //             backgroundColor:
  //             CupertinoColors.systemBackground.resolveFrom(context),
  //             initialTimerDuration: timer,
  //             onTimerDurationChanged: (newTimer) {
  //               setState(() => timer = newTimer);
  //             },
  //           ),
  //         ),
  //       );
  //     },
  //     child: _Menu(
  //       children: [
  //         Text(GalleryLocalizations.of(context).demoCupertinoPickerTimer),
  //         Text(
  //           '${timer.inHours}:'
  //               '${(timer.inMinutes % 60).toString().padLeft(2, '0')}:'
  //               '${(timer.inSeconds % 60).toString().padLeft(2, '0')}',
  //           style: const TextStyle(color: CupertinoColors.inactiveGray),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
      //   automaticallyImplyLeading: false,
      //   middle: Text(GalleryLocalizations.of(context).demoCupertinoPickerTitle),
      // ),
      child: DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(height: 32),
            // _buildDatePicker(context),
            _buildTimePicker(context),
            // _buildDateAndTimePicker(context),
            // _buildCountdownTimerPicker(context),
          ],
        ),
      ),
    );
  }
}

class _BottomPicker extends StatelessWidget {
  const _BottomPicker({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 6),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key key,
    @required this.children,
  })  : assert(children != null),
        super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}

