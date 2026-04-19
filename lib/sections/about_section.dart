import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../core/theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      color: AppColors.surface, // Using surface color for a subtle layer shift
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 900;
          
          if (isDesktop) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 4, child: _PortraitImage()),
                SizedBox(width: 8.w),
                Expanded(flex: 6, child: _AboutContent()),
              ],
            );
          } else {
            return Column(
              children: [
                _PortraitImage(),
                SizedBox(height: 6.h),
                _AboutContent(),
              ],
            );
          }
        },
      ),
    );
  }
}

class _PortraitImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 45.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // 1.5rem
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.network(
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?fit=crop&w=800&q=80',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: GoogleFonts.inter(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'I am a MERN Stack Web Developer focusing on building production-ready applications! I enjoy designing APIs, creating interactive user interfaces, and optimizing performance to deliver smooth and efficient user experiences.',
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            color: AppColors.onSurfaceVariant,
            height: 1.6,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          'Along with strong problem-solving skills, I follow clean architecture principles and modern development patterns. I\'m passionate about writing maintainable code, improving UI/UX flows, and building applications that feel fast, secure, and intuitive. I actively explore new tools in the MERN ecosystem to stay updated and keep improving my development workflow.',
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            color: AppColors.onSurfaceVariant,
            height: 1.6,
          ),
        ),
        SizedBox(height: 6.h),
        const _ResumeButton(),
      ],
    );
  }
}

class _ResumeButton extends StatelessWidget {
  const _ResumeButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFFEF4444)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: Text(
              'Download Resume',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
          ),
          const Icon(Icons.download_rounded, color: Colors.white, size: 20),
          SizedBox(width: 1.w),
        ],
      ),
    );
  }
}

