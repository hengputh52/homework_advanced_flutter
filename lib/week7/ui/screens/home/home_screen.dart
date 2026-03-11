import 'package:flutter/material.dart';
import 'package:homework_week7/week7/data/repositories/user_history/user_history_repository.dart';
import 'package:homework_week7/week7/ui/screens/home/view_model/home_view_model.dart';
import 'package:homework_week7/week7/ui/screens/home/widget/home_content.dart';
import 'package:homework_week7/week7/ui/states/settings_state.dart';
import 'package:homework_week7/week7/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettingsState settingsState = context.read<AppSettingsState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Home", style: AppTextStyles.heading),
          SizedBox(height: 30),
          
          ChangeNotifierProvider(
            create: (context) => HomeViewModel(userHistoryRepostiory: context.read<UserHistoryRepository>(),
            ),child: HomeContent(),
            )
        ],
      ),
    );
  }
  
}