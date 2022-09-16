import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:siba_cms_2/components/constants.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final TextEditingController feedbackmsg = TextEditingController();
  late final _ratingController;
  late double _rating;
  late int _likes;
  List modes = ["Very Bad", "Bad", "Normal", "Good", 'Very Good'];

  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  double _modeinitialRate = 3.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
    _likes = 3;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    "Feedback From",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Flexible(
                  child: Text(
                    "we would love to hear your thoughts, suggestions, concerns or problems with anything so we can improve",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                _heading('How Would You Rate Our App'),
                _ratingBar(1),
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    'Rating: $_rating',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20.0),
                _heading('How satisfied are you with our App service'),
                _ratingBar(2),
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    'Like :' + modes[_likes - 1],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20.0),
                _heading('How satisfied are you with the usability of the App'),
                Center(
                  child: RatingBarIndicator(
                    rating: _userRating,
                    itemBuilder: (context, index) => Icon(
                      _selectedIcon ?? Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 30.0,
                    unratedColor: Colors.amber.withAlpha(50),
                    direction: _isVertical ? Axis.vertical : Axis.horizontal,
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _ratingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter rating',
                    labelText: 'Enter rating',
                    suffixIcon: MaterialButton(
                      onPressed: () {
                        _userRating =
                            double.parse(_ratingController.text ?? '0.0');
                        setState(() {});
                      },
                      child: Text('Rate'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: feedbackmsg,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Please Leave your Feedback',
                  ),
                  maxLines: 4,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: myColor),
                  onPressed: () => {},
                  child: const Text("Send"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ratingBar(int mode) {
    switch (mode) {
      case 1:
        return Center(
          child: RatingBar.builder(
            initialRating: _initialRating,
            minRating: 1,
            direction: _isVertical ? Axis.vertical : Axis.horizontal,
            allowHalfRating: true,
            unratedColor: Colors.amber.withAlpha(50),
            itemCount: 5,
            itemSize: 30.0,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              _selectedIcon ?? Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
            },
            updateOnDrag: true,
          ),
        );
      case 2:
        return Center(
          child: RatingBar.builder(
            initialRating: _modeinitialRate,
            direction: _isVertical ? Axis.vertical : Axis.horizontal,
            itemCount: 5,
            itemSize: 30,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                  );
                case 1:
                  return Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.lightGreen,
                  );
                case 4:
                  return Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
                default:
                  return Container();
              }
            },
            onRatingUpdate: (double rating) {
              setState(() {
                _likes = rating.toInt();

                // ignore: avoid_print
                // print(int.parse(_likes.toString()));
                print(_likes);
              });
            },
            updateOnDrag: true,
          ),
        );
      default:
        return Container();
    }
  }

  Widget _heading(String text) => Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 17.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
}
