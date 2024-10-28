import 'package:continuation_control/view_models/doing_view_model.dart';
import 'package:continuation_control/widgets/base/base_image_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Confirm extends StatelessWidget {
  const Confirm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DoingViewModel>(
      builder: (context, doingViewModel, child) {
        final doings = doingViewModel.doings;
        return BaseImageContainer(
          imagePath: 'images/confirm.jpg',
          child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var doing in doings) Text(doing.name),
              ],
            ),
          ),
        );
      },
    );
  }
}
