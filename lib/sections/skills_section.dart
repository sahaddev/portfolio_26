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
        'Tailwind CSS',
        'Creating responsive, modern, and clean layouts quickly using utility-first styling.',
        'https://static-00.iconduck.com/assets.00/tailwind-css-icon-2048x1229-9vo9v881.png',
      ),
      _Skill(
        'JavaScript',
        'Writing efficient, modern, and optimized code for both frontend and backend logic.',
        'https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png',
      ),
      _Skill(
        'React',
        'Building fast, interactive, and component-based UIs with clean state management.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/2300px-React-icon.svg.png',
      ),
      _Skill(
        'Node.js',
        'Developing scalable backend logic and high-performance server-side applications.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Node.js_logo.svg/2560px-Node.js_logo.svg.png',
      ),
      _Skill(
        'MongoDB',
        'Managing NoSQL databases with flexible schemas for high-performance data storage.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/MongoDB_Logo.svg/2560px-MongoDB_Logo.svg.png',
      ),
      _Skill(
        'HTML',
        'Creating clean, well-structured page layouts with semantic markup for better accessibility and SEO.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1024px-HTML5_logo_and_wordmark.svg.png',
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
