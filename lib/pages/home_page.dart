import 'package:compo_builder/bloc/logic_bloc.dart';
import 'package:compo_builder/widgets/left_panel.dart';
import 'package:compo_builder/widgets/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

import '../widgets/small_screen_warning.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WindowListener {
  bool isCorrectSize = true;

  @override
  void initState() {
    super.initState();
    // Add a window resize listener
    windowManager.addListener(this);
  }

  @override
  void onWindowResize() async {
    // Get the current window size
    final windowSize = await windowManager.getSize();
    // Get the screen size
    final screenSize = await screenRetriever
        .getPrimaryDisplay()
        .then((display) => display.size);

    // Check if the window size is less than half of the screen
    if (windowSize.width < screenSize.width / 2 ||
        windowSize.height < screenSize.height / 2) {
      isCorrectSize
          ? setState(() {
              isCorrectSize = false;
            })
          : isCorrectSize;
    } else {
      !isCorrectSize
          ? setState(() {
              isCorrectSize = true;
            })
          : isCorrectSize;
    }
    super.onWindowResize();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1E2529),
        body: BlocProvider(
          create: (context) => LogicBloc(),
          child: BlocConsumer<LogicBloc, LogicState>(
            listener: (BuildContext context, LogicState state) {},
            builder: (BuildContext context, LogicState state) {
              return isCorrectSize
                  ? Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: 280,
                          color: const Color(0xFF14181B),
                          child: LeftPanel(components: state.components),
                        ),
                         Expanded(
                          flex: 4,
                          child:
                              FittedBox(fit: BoxFit.none, child: PhoneScreen(droppedComponents: state.droppedComponents)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: 280,
                          color: const Color(0xFF14181B),
                        )
                      ],
                    )
                  : const SmallScreenWarning();
            },
          ),
        ),
      ),
    );
  }
}
