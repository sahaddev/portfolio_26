import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../core/theme/app_theme.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      constraints: BoxConstraints(minHeight: 100.h),
      decoration: const BoxDecoration(color: AppColors.background),
      child: Stack(
        children: [
          // Background Glow for Hero
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              const _Navbar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 900) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const _HeroContent(),
                          SizedBox(height: 10.h),
                          _ProfileIllustration(),
                        ],
                      );
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(flex: 5, child: _HeroContent()),
                        SizedBox(width: 5.w),
                        Expanded(flex: 5, child: _ProfileIllustration()),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Navbar extends StatelessWidget {
  const _Navbar();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant.withOpacity(0.4),
            border: Border(
              bottom: BorderSide(
                color: AppColors.outlineVariant.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LUMINESCENT.DEV',
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w900,
                  color: AppColors.onSurface,
                  letterSpacing: 1.5,
                ),
              ),
              if (MediaQuery.of(context).size.width > 700)
                Row(
                  children: [
                    _navItem('Home', active: true),
                    _navItem('About'),
                    _navItem('Services'),
                    _navItem('Projects'),
                    _navItem('Contact'),
                    SizedBox(width: 4.w),
                    const _HireMeButton(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title, {bool active = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.5.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (active)
            Positioned(
              top: -10,
              child: Container(
                width: 20,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          Text(
            title,
            style: GoogleFonts.inter(
              color: active ? AppColors.primary : AppColors.onSurfaceVariant,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _HireMeButton extends StatelessWidget {
  const _HireMeButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        'Hire Me',
        style: GoogleFonts.inter(
          color: AppColors.background,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          margin: EdgeInsets.only(top: 20.h),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.outlineVariant.withOpacity(0.2),
            ),
          ),
          child: Text(
            'AVAILABLE FOR NEW PROJECTS',
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(fontSize: 12.sp),
          ),
        ),
        SizedBox(height: 4.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Hi, I\'m ',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 28.sp,
                  height: 1.1,
                ),
              ),
              TextSpan(
                text: 'Sajid\nYaqub',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 28.sp,
                  height: 1.1,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [AppColors.primary, AppColors.primaryContainer],
                    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 40.w),
          child: Text(
            'I build scalable full-stack applications using Flutter, Node.js, and MongoDB. I love clean code and fast UIs.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 14.sp,
              letterSpacing: 0.5,
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            _PrimaryButton(text: 'View Projects', onPressed: () {}),
            SizedBox(width: 2.w),
            _SecondaryButton(text: 'Let\'s Collaborate', onPressed: () {}),
          ],
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _PrimaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDim],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.surfaceTint.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          color: AppColors.background,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _SecondaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}

class _ProfileIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Luminescent Glow (Aura)
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withOpacity(0.15),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Background Glow for image separation
          Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),

          // Floating Glass Icons
          ...List.generate(4, (index) {
            final angle = index * (2 * math.pi / 4) + (math.pi / 3.2);
            final radius = 18.w;
            return Transform.translate(
              offset: Offset(
                radius * math.cos(angle),
                radius * math.sin(angle),
              ),
              child: _FloatingGlassIcon(index: index),
            );
          }),
          // Circular Image
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingGlassIcon extends StatelessWidget {
  final int index;
  const _FloatingGlassIcon({required this.index});

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.flutter_dash,
      Icons.code,
      Icons.storage,
      Icons.terminal,
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: EdgeInsets.all(1.5.w),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHigh.withOpacity(0.4),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.outlineVariant.withOpacity(0.1),
            ),
          ),
          child: Icon(
            icons[index],
            color: index % 2 == 0 ? AppColors.primary : AppColors.secondary,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
