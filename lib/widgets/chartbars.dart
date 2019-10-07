import 'package:flutter/material.dart';

class Bars extends StatelessWidget {
  final String lable;
  final double expensOfDay;
  final double prcntgOfWeek;
  

  Bars(this.lable, this.expensOfDay, this.prcntgOfWeek);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  ' ₹ ${expensOfDay.toStringAsFixed(0)}',
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
                height: constraints.maxHeight * 0.6,
                width: constraints.maxWidth * 0.16,
                child: Stack(
                  alignment: Alignment(0, 1),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[350],
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: prcntgOfWeek,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: constraints.maxHeight * 0.025),
            Container(
              child: FittedBox(child: Text('$lable')),
              height: constraints.maxHeight * 0.15,
            ),
            SizedBox(height: constraints.maxHeight * 0.025),
          ],
        );
      },
    );
  }
}
