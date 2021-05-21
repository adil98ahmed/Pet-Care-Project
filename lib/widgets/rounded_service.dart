import 'package:flutter/material.dart';

class RoundedService extends StatelessWidget {
  const RoundedService({
    Key key,
    @required String serviceName,
    @required String img,
    @required Function onTap,
    double size,
    double padding = 8,
    double imgScale = 0.8,
  })  : _img = img,
        _serviceName = serviceName,
        _size = size,
        _padding = padding,
        _imgScale = imgScale,
        _onTap = onTap,
        super(key: key);

  final String _img;
  final String _serviceName;
  final double _size;
  final double _padding;
  final double _imgScale;
  final Function _onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size,
      width: _size,
      child: Material(
        borderRadius: BorderRadius.circular(_size / 2),
        elevation: 20,
        shadowColor: Colors.black26,
        child: InkWell(
          borderRadius: BorderRadius.circular(_size / 2),
          onTap: _onTap,
          child: Padding(
            padding: EdgeInsets.all(_padding),
            child: Column(
              children: [
                Image.asset(
                  _img,
                  scale: _imgScale,
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    _serviceName,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
