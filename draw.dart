import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'package:book/quiz_mark.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:scribble/scribble.dart';
import 'package:screenshot/screenshot.dart';
import 'package:http/http.dart' as http;
import 'package:starflut/starflut.dart';


class DrawPage extends StatefulWidget {
  const DrawPage(int correctCounter, {Key? key}) : super(key: key);

 // final String title;

  @override
  State<DrawPage> createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  ScreenshotController controller = ScreenshotController();
  late ScribbleNotifier notifier;
  var response;
  int get correctCounter => correctCounter;


  @override
  void initState() {
    notifier = ScribbleNotifier();
    super.initState();
    //initPlatformState();
  }

  captureImage() {
     final image = controller.capture();
     return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اختبار الإملاء", style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 2,
            child: Stack(
              children: [
                const Text("أكتب كلمة 'شاسع' في المساحة الفارغة بأكبر خط لديك", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Scribble(
                  notifier: notifier,
                  drawPen: true,
                ),
                Screenshot(
                  controller: controller,
                  child: Positioned(
                    top: 16,
                    right: 16,
                    child: Column(
                      children: [
                        _buildColorToolbar(context),
                        const Divider(
                          height: 32,
                        ),
                        _buildStrokeToolbar(context),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 130,
                  top: 580,
                  child: ElevatedButton(
                    onPressed: () async {
                      final img = captureImage();
                      const url = 'http://10.0.2.2:5000/img';
                      final response = await http.post(Uri.parse(url), body: json.encode({'image': img}));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber, ),
                    child: const Text('تسليم الإجابة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
                ),
                Positioned(
                  right: 160,
                  top: 630,
                  child: ElevatedButton(
                    onPressed: ()  {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizMark() ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, ),
                    child: const Text('التالي', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Future<void> _saveImage(BuildContext context) async {
    final image = await notifier.renderImage();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your Image"),
        content: Image.memory(image.buffer.asUint8List()),
      ),
    );
  }

  Widget _buildStrokeToolbar(BuildContext context) {
    return StateNotifierBuilder<ScribbleState>(
      stateNotifier: notifier,
      builder: (context, state, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (final w in notifier.widths)
            _buildStrokeButton(
              context,
              strokeWidth: w,
              state: state,
            ),
        ],
      ),
    );
  }

  Widget _buildStrokeButton(
      BuildContext context, {
        required double strokeWidth,
        required ScribbleState state,
      }) {
    final selected = state.selectedWidth == strokeWidth;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
        elevation: selected ? 4 : 0,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: () => notifier.setStrokeWidth(strokeWidth),
          customBorder: const CircleBorder(),
          child: AnimatedContainer(
            duration: kThemeAnimationDuration,
            width: strokeWidth * 2,
            height: strokeWidth * 2,
            decoration: BoxDecoration(
                color: state.map(
                  drawing: (s) => Color(s.selectedColor),
                  erasing: (_) => Colors.transparent,
                ),
                border: state.map(
                  drawing: (_) => null,
                  erasing: (_) => Border.all(width: 1),
                ),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ),
    );
  }

  Widget _buildColorToolbar(BuildContext context) {
    return StateNotifierBuilder<ScribbleState>(
      stateNotifier: notifier,
      builder: (context, state, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildUndoButton(context),
          const Divider(
            height: 4.0,
          ),
          _buildRedoButton(context),
          const Divider(
            height: 4.0,
          ),
          _buildClearButton(context),
          const Divider(
            height: 20.0,
          ),
          _buildPointerModeSwitcher(context,
              penMode:
              state.allowedPointersMode == ScribblePointerMode.penOnly),
          const Divider(
            height: 20.0,
          ),
          _buildEraserButton(context, isSelected: state is Erasing),
          _buildColorButton(context, color: Colors.black, state: state),
          _buildColorButton(context, color: Colors.red, state: state),
          _buildColorButton(context, color: Colors.green, state: state),
          _buildColorButton(context, color: Colors.blue, state: state),
          _buildColorButton(context, color: Colors.yellow, state: state),
        ],
      ),
    );
  }

  Widget _buildPointerModeSwitcher(BuildContext context,
      {required bool penMode}) {
    return FloatingActionButton.small(
      onPressed: () => notifier.setAllowedPointersMode(
        penMode ? ScribblePointerMode.all : ScribblePointerMode.penOnly,
      ),
      tooltip:
      "Switch drawing mode to " + (penMode ? "all pointers" : "pen only"),
      child: AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: !penMode
            ? const Icon(
          Icons.touch_app,
          key: ValueKey(true),
        )
            : const Icon(
          Icons.do_not_touch,
          key: ValueKey(false),
        ),
      ),
    );
  }

  Widget _buildEraserButton(BuildContext context, {required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FloatingActionButton.small(
        tooltip: "Erase",
        backgroundColor: const Color(0xFFF7FBFF),
        elevation: isSelected ? 10 : 2,
        shape: !isSelected
            ? const CircleBorder()
            : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.remove, color: Colors.blueGrey),
        onPressed: notifier.setEraser,
      ),
    );
  }

  Widget _buildColorButton(
      BuildContext context, {
        required Color color,
        required ScribbleState state,
      }) {
    final isSelected = state is Drawing && state.selectedColor == color.value;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FloatingActionButton.small(
          backgroundColor: color,
          elevation: isSelected ? 10 : 2,
          shape: !isSelected
              ? const CircleBorder()
              : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(),
          onPressed: () => notifier.setColor(color)),
    );
  }

  Widget _buildUndoButton(
      BuildContext context,
      ) {
    return FloatingActionButton.small(
      tooltip: "Undo",
      onPressed: notifier.canUndo ? notifier.undo : null,
      disabledElevation: 0,
      backgroundColor: notifier.canUndo ? Colors.blueGrey : Colors.grey,
      child: const Icon(
        Icons.undo_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget _buildRedoButton(
      BuildContext context,
      ) {
    return FloatingActionButton.small(
      tooltip: "Redo",
      onPressed: notifier.canRedo ? notifier.redo : null,
      disabledElevation: 0,
      backgroundColor: notifier.canRedo ? Colors.blueGrey : Colors.grey,
      child: const Icon(
        Icons.redo_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget _buildClearButton(BuildContext context) {
    return FloatingActionButton.small(
      tooltip: "Clear",
      onPressed: notifier.clear,
      disabledElevation: 0,
      backgroundColor: Colors.blueGrey,
      child: const Icon(Icons.clear),
    );
  }
}