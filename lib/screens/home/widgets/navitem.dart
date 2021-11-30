import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';

class NavItem extends StatelessWidget {
  const NavItem(
      {Key? key,
      required this.isSelected,
      required this.icon,
      required this.label,
      required this.ontap})
      : super(key: key);
  final Function ontap;
  final bool isSelected;
  final List<String> icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => ontap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isSelected ? icon[1] : icon[0],
              color: isSelected ? null : AppColors.darkgrey,
              width: 30,
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            isSelected
                ? Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.mainGreen),
                    height: 8,
                    width: 8)
                : Text(
                    label,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  )
          ],
        ),
      ),
    );
  }
}
