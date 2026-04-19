import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../core/theme/app_theme.dart';
import '../widgets/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter', 'Dart', 'Node.js', 'React', 'MongoDB', 
      'TypeScript', 'AWS', 'Docker', 'Firebase', 'GraphQL'
    ];

    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Core Technologies',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 40.sp,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 6.h),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: skills.map((skill) => SkillChip(label: skill)).toList(),
          ),
        ],
      ),
    );
  }
}

