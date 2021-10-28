import 'package:flutter/material.dart';
import 'package:sfl_flutter_package/sfl_flutter_package.dart';

class SFLLoaderDemo extends StatelessWidget {
  static final String route = 'sfl-loader-demo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SFL Loader"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildRowItem(
              context,
              'Circular Native with specified progress value',
              SFLLoader(
                loaderType: SFLLoaderTypes.circularNative,
                value: 0.5,
              ),
            ),
            _buildRowItem(
              context,
              'Circular with specified progress value',
              SFLLoader(
                loaderType: SFLLoaderTypes.circular,
                valueColor: Colors.orange,
                backgroundColor: Colors.green,
                value: 0.4,
              ),
            ),
            _buildRowItem(
              context,
              'Circular Native Infinite Loader',
              SFLLoader(
                loaderType: SFLLoaderTypes.circularNative,
              ),
            ),
            _buildRowItem(
              context,
              'Circular Infinite Loader with customized color values',
              SFLLoader(
                loaderType: SFLLoaderTypes.circular,
                valueColor: Colors.orange,
                backgroundColor: Colors.green,
              ),
            ),
            _buildRowItem(
              context,
              'Linear Indicator with specified progress value',
              SFLLoader(
                loaderType: SFLLoaderTypes.linear,
                value: 0.6,
              ),
            ),
            _buildRowItem(
              context,
              'Linear Indicator with infinite value, specified color values',
              SFLLoader(
                loaderType: SFLLoaderTypes.linear,
                valueColor: Colors.orange,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Row item with Text on left and widget on right
  Widget _buildRowItem(BuildContext context, String title, Widget child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Center(
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
