import 'package:flutter/material.dart';
import 'package:homework_week7/week9/model/settings/app_settings.dart';
import 'package:homework_week7/week9/ui/screens/settings/widget/theme_color_button.dart';
import 'package:homework_week7/week9/ui/states/settings_state.dart';
import 'package:homework_week7/week9/ui/theme/theme.dart';
import 'package:provider/provider.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettingsState settingsState = context.watch<AppSettingsState>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 16),
        Text("Settings", style: AppTextStyles.heading),
    
        SizedBox(height: 50),
    
        Text(
          "Theme",
          style: AppTextStyles.label.copyWith(color: AppColors.textLight),
        ),
    
        SizedBox(height: 10),
    
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ThemeColor.values
              .map(
                (theme) => ThemeColorButton(
                  themeColor: theme,
                  isSelected: theme == settingsState.theme,
                  onTap: (value) {
                    settingsState.changeTheme(theme);
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
