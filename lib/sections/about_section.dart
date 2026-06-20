import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../core/constants/app_assets.dart';
import '../core/theme/app_theme.dart';
import '../utils/download_cv.dart';

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
          bool isMobile = constraints.maxWidth <= 900;

          if (!isMobile) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 4, child: _PortraitImage(isMobile: false)),
                SizedBox(width: 8.w),
                Expanded(flex: 6, child: _AboutContent(isMobile: false)),
              ],
            );
          } else {
            return Column(
              children: [
                _PortraitImage(isMobile: true),
                SizedBox(height: 6.h),
                _AboutContent(isMobile: true),
              ],
            );
          }
        },
      ),
    );
  }
}

class _PortraitImage extends StatelessWidget {
  final bool isMobile;
  const _PortraitImage({this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? 40.h : 50.h,
      width: isMobile ? 80.w : 45.w,
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
        child: Image.asset(AppAssets.aboutImage, fit: BoxFit.cover),
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  final bool isMobile;
  const _AboutContent({this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    final textAlign = isMobile ? TextAlign.center : TextAlign.left;
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 24.sp : 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
          textAlign: textAlign,
        ),
        SizedBox(height: 4.h),
        Text(
          'Full Stack Mobile Developer with 2+ years of experience delivering high-quality mobile applications and end-to-end solutions. Passionate about building reliable, user-focused products and continuously improving through learning and innovation.',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14.sp : 12.sp,
            color: AppColors.onSurfaceVariant,
            height: 1.6,
          ),
          textAlign: textAlign,
        ),
        SizedBox(height: 2.h),
        Text(
          'Along with strong problem-solving skills, I follow clean architecture principles and modern development patterns. I\'m passionate about writing maintainable code, improving UI/UX flows, and building applications that feel fast, secure, and intuitive. I actively explore new tools in the MERN ecosystem to stay updated and keep improving my development workflow.',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 14.sp : 12.sp,
            color: AppColors.onSurfaceVariant,
            height: 1.6,
          ),
          textAlign: textAlign,
        ),
        SizedBox(height: 6.h),
        const _ResumeButton(),
      ],
    );
  }
}

class _ResumeButton extends StatefulWidget {
  const _ResumeButton();

  @override
  State<_ResumeButton> createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<_ResumeButton> {
  bool _isDownloading = false;

  /// Downloads the CV PDF using rootBundle and dart:html
  /// This implementation works specifically for Flutter Web.
  Future<void> _downloadCV() async {
    setState(() {
      _isDownloading = true;
    });

    try {
      if (!kIsWeb) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'CV download is only available on the Web version.',
              ),
              backgroundColor: Colors.orange,
            ),
          );
        }
        return;
      }

      // 1. Load the PDF asset using rootBundle
      final byteData = await rootBundle.load('asset/pdf/SahadMp.pdf');

      // 2. Convert ByteData to Uint8List
      final buffer = byteData.buffer;
      final bytes = buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );

      // 3. Trigger download using our cross-platform conditional export
      downloadPdfFromBytes(bytes, 'SahadMp_CV.pdf');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('CV downloaded successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download CV: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isDownloading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isDownloading ? null : _downloadCV,
      child: Container(
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
                _isDownloading ? 'Downloading...' : 'Download Resume',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ),
            if (_isDownloading)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            else
              const Icon(Icons.download_rounded, color: Colors.white, size: 20),
            SizedBox(width: 1.w),
          ],
        ),
      ),
    );
  }
}
