import 'package:flutter/material.dart';

import '../../provider/provider.dart';
import '../consts.dart';

class ContactRow extends StatelessWidget {
  ContactRow({this.command, this.data, this.path});
  String? command, data, path;
  @override
  Widget build(BuildContext context) {
    final state = App.get(context);
    return InkWell(
      onTap: () => state.customLaunch(command),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: gryColor.withOpacity(.25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                child: Image.asset(
                  path!,
                  color: gryColor,
                ),
                width: 30,
              ),
              SizedBox(width: 8),
              Flexible(
                child: Text(
                  data!,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
