import 'package:flutter/material.dart';
import './styles/app_styles.dart';

class NavigationBarComponente extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;
  
  const NavigationBarComponente({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: WidgetStateTextStyle.resolveWith((
          Set<WidgetState> states,
        ) {
          return TextStyle(color: AppStyles.kWhiteColor);
        }),
      ),
      child: NavigationBar(
        onDestinationSelected: onIndexChanged,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedIndex: currentIndex,
        indicatorColor: Color.fromRGBO(134, 134, 161, 1.0),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.history, color: AppStyles.kWhiteColor),
            label: 'Promedios',
          ),
          NavigationDestination(
            icon: Icon(Icons.star, color: AppStyles.kWhiteColor),
            label: 'Nota Total',
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: AppStyles.kWhiteColor),
            label: 'Nota Individual',
          ),
        ],
      ),
    );
  }
}