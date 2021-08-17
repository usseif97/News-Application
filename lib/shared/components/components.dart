import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webView/web_view_Screen.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  bool showKeyboard = true,
  required BuildContext context,
}) =>
    TextFormField(
      style: Theme.of(context).textTheme.bodyText2,
      showCursor: !showKeyboard,
      readOnly: !showKeyboard,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s) {
        if (onSubmit != null) onSubmit(s);
      },
      onChanged: (s) {
        if (onChange != null) onChange(s);
      },
      onTap: () {
        if (onTap != null) onTap();
      },
      validator: (s) {
        return validate(s);
      },
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.bodyText2,
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defaultSeperator() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[400],
    ),
  );
}

Widget buildArticleItem(article, context) {
  return InkWell(
    onTap: () {
      navigateTo(
        context,
        WebViewScreen(url: article['url']),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: article['urlToImage'] != null
                    ? NetworkImage(article['urlToImage'])
                    : NetworkImage('https://i.stack.imgur.com/mwFzF.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
