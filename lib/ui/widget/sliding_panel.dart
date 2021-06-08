import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingPanel extends StatelessWidget {
  final bool isDraggable;
  final PanelState defaultPanelState;
  final bool backdropClosePanel;
  final double minHeight;
  final double maxHeight;
  final Widget child;
  final PanelController panelController;
  final bool backdropEnabled;

  SlidingPanel({
    this.isDraggable = true,
    this.defaultPanelState = PanelState.CLOSED,
    this.backdropClosePanel = false,
    this.minHeight = 0.0,
    this.maxHeight = 500,
    this.backdropEnabled = true,
    @required this.child,
    @required this.panelController,
  });

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      isDraggable: isDraggable,
      defaultPanelState: defaultPanelState,
      backdropTapClosesPanel: backdropClosePanel,
      minHeight: minHeight,
      maxHeight: maxHeight,
      backdropEnabled: backdropEnabled,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 16.0,
          spreadRadius: 0.2,
          offset: Offset(0.0, 1),
        ),
      ],
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: FaIcon(
              FontAwesomeIcons.minus,
              color: Colors.grey[400],
            ),
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
