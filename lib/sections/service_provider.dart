import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../core/theme/app_theme.dart';

class ServiceProvider extends StatelessWidget {
  const ServiceProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      _Skill(
        'Full-Stack Web Development',
        'End-to-end web applications using React, Node.js, Express, and MongoDB with clean architecture and scalable code.',
        'https://cdn-icons-png.flaticon.com/512/2721/2721297.png',
      ),
      _Skill(
        'Frontend Development',
        'Fast, responsive, and user-friendly interfaces built with React and modern UI frameworks like Tailwind CSS.',
        'https://cdn-icons-png.flaticon.com/512/1055/1055687.png',
      ),
      _Skill(
        'Backend & API Development',
        'Secure and efficient REST APIs using Node.js and Express, optimized for performance and scalability.',
        'https://cdn-icons-png.flaticon.com/512/2721/2721269.png',
      ),
      _Skill(
        'Database Design & Management',
        'Well-structured MongoDB databases with optimized queries for speed, reliability, and data integrity.',
        'https://cdn-icons-png.flaticon.com/512/4248/4248443.png',
      ),
      _Skill(
        'Authentication & Authorization',
        'Implementation of secure login systems using JWT, role-based access control, and best security practices.',
        'https://cdn-icons-png.flaticon.com/512/3064/3064155.png',
      ),
      _Skill(
        'E-Commerce Development',
        'Product listings, cart systems, checkout flows, and payment gateway integrations for real-world applications.',
        'https://cdn-icons-png.flaticon.com/512/3144/3144456.png',
      ),
      _Skill(
        'Performance Optimization',
        'Improving load times, API response speed, and overall application performance for better user experience.',
        'https://cdn-icons-png.flaticon.com/512/1828/1828919.png',
      ),
      _Skill(
        'Deployment & Hosting Support',
        'Deploying applications on cloud platforms with proper environment setup and production-ready configuration.',
        'https://cdn-icons-png.flaticon.com/512/4144/4144785.png',
      ),
    ];

    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      color: AppColors.background,
      child: Column(
        children: [
          Text(
            'Services I Provide',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'I offer a range of services to help businesses and individuals achieve their goals.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              color: AppColors.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          SizedBox(height: 8.h),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isDesktop = constraints.maxWidth > 1000;
              bool isTablet =
                  constraints.maxWidth > 650 && constraints.maxWidth <= 1000;

              int crossAxisCount = isDesktop ? 4 : (isTablet ? 2 : 1);
              double aspectRatio = isDesktop ? 0.7 : (isTablet ? 0.85 : 1.2);

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 3.h,
                  childAspectRatio: aspectRatio,
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return _SkillCard(skill: skills[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Skill {
  final String title;
  final String description;
  final String iconUrl;
  _Skill(this.title, this.description, this.iconUrl);
}

class _SkillCard extends StatefulWidget {
  final _Skill skill;
  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovering
            ? Matrix4.translationValues(0, -10, 0)
            : Matrix4.identity(),
        padding: const EdgeInsets.all(1), // Border thickness
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: _isHovering
              ? const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    AppColors.outlineVariant.withValues(alpha: 0.2),
                    AppColors.outlineVariant.withValues(alpha: 0.1),
                  ],
                ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                child: Image.network(
                  widget.skill.iconUrl,
                  height: 40.0,
                  color: AppColors.primary,
                  colorBlendMode: BlendMode.srcIn,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.code, size: 40.0, color: AppColors.primary),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                widget.skill.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurface,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.skill.description,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  color: AppColors.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
