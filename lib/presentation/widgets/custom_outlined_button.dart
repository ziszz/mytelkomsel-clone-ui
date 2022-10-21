import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final AssetImage icon;
  final Color color;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.icon,
    this.color = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: BorderSide(
            color: color,
            width: 1.5,
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              icon,
              color: color,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.button?.copyWith(
                    color: color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
