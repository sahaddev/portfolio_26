import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../core/theme/app_theme.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      color: AppColors.surfaceDim, // Setting a deep base for the section
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Projects',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 40.sp,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'A curation of my best work in digital craftsmanship.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 8.h),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 1200 ? 3 : (constraints.maxWidth > 800 ? 2 : 1);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.85,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const ProjectCard(
                    title: 'Luminescent UI Kit',
                    description: 'A high-performance design system for luxury digital experiences.',
                    imageUrl: 'https://images.unsplash.com/photo-1558655146-d09347e92766?auto=format&fit=crop&q=80&w=800',
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

