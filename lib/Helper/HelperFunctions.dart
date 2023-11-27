import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:opensource/Helper/HelperClasses.dart';
import 'package:readmore/readmore.dart';

class HelperFunctions {
  /// this function is used to show a snackbar
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
        backgroundColor: ColorService.loadAndGetColor('secondaryBackgroundColor'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        )
      ),
    );
  }

  /// this function is used to show a dialog
  static void showDialogBox(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// this function renders a post as a container with text/image and other widgets
  static Widget renderPost(
      BuildContext context, String description, List<Image> images) {
    bool hasImages = images.isNotEmpty;
    bool hasDescription = description.isNotEmpty;
    int index = 0;

    return Container(
      child: Center(
        child: Container(
          child: Column(
            children: [
              // Description container (added condition)
              if (hasDescription)
                Container(
                  margin: const EdgeInsets.all(15),
                  child: ReadMoreText(
                    description,
                    trimLines: 4,
                    textAlign: TextAlign.center,
                    colorClickableText: Colors.blue,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '   Show more',
                    trimExpandedText: '   Show less',
                    moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              // Image row (added condition)
              if (hasImages)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: () {
                            index--;
                          },
                        )),
                    Flexible(
                      flex: 4,
                      child: Container(
                        child: images.isEmpty
                            ? Container(
                                child: const Center(
                                    child: CircularProgressIndicator()))
                            : FullScreenWidget(
                                backgroundIsTransparent: true,
                                disposeLevel: DisposeLevel.High,
                                child: images[index]),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: () {
                          index++;
                      
                        },
                      ),
                    ),
                  ],
                ),
              if (hasImages) Text('Image ${index + 1} of ${images.length}'),
            ],
          ),
        ),
      ),
    );
  }
}
