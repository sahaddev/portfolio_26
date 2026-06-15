import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../core/theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      _Skill(
        'Languages',
        'Dart, JavaScript',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Dart_programming_language_logo.svg/1024px-Dart_programming_language_logo.svg.png',
      ),
      _Skill(
        'Frameworks',
        'Flutter',
        'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
      ),
      _Skill(
        'Database',
        'Hive, sqflite, MongoDB',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/MongoDB_Logo.svg/2560px-MongoDB_Logo.svg.png',
      ),
      _Skill(
        'AWS',
        'EC2, Route53',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Amazon_Web_Services_Logo.svg/1024px-Amazon_Web_Services_Logo.svg.png',
      ),
      _Skill(
        'Architecture',
        'Model-View-Controller (MVC), Clean Architecture',
        'https://cdn-icons-png.flaticon.com/512/2115/2115958.png',
      ),
      _Skill(
        'State Management',
        'BLoC, Cubit, Provider, GetX',
        'https://cdn-icons-png.flaticon.com/512/3242/3242257.png',
      ),
      _Skill(
        'Familiar',
        'Data Structures and Algorithms, RESTful API, Asynchronous Programming',
        'https://cdn-icons-png.flaticon.com/512/1006/1006363.png',
      ),
      _Skill(
        'Dev Tools',
        'Visual Studio Code, Git, GitHub, Postman, Bruno, Flutter Inspector, Dart DevTools',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/2048px-Visual_Studio_Code_1.35_icon.svg.png',
      ),
    ];

    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      color: AppColors.background,
      child: Column(
        children: [
          Text(
            'Skills & Technologies',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'I work with modern tools and technologies to build fast,\nscalable and efficient web applications.',
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
              int crossAxisCount = constraints.maxWidth > 1000
                  ? 3
                  : (constraints.maxWidth > 650 ? 2 : 1);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 3.h,
                  childAspectRatio: 1.1,
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
          padding: EdgeInsets.all(2.w),
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
                  height: 6.h,
                  color: AppColors.primary,
                  colorBlendMode: BlendMode.srcIn,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.code, size: 6.h, color: AppColors.primary),
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                widget.skill.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurface,
                ),
              ),
              SizedBox(height: 1.5.h),
              Text(
                widget.skill.description,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
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
