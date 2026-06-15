import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      color: const Color(0xFF020617),
      child: Column(
        children: [
          Text(
            'Contact Us',
            style: GoogleFonts.inter(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFF8FAFC),
              letterSpacing: -1,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'Have a project in mind? Let\'s connect and discuss how I\ncan help bring your ideas to life.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              color: const Color(0xFF94A3B8),
              height: 1.5,
            ),
          ),
          SizedBox(height: 10.h),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _ContactDetails()),
                    SizedBox(width: 5.w),
                    Expanded(child: _ContactForm()),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _ContactDetails(),
                    SizedBox(height: 8.h),
                    _ContactForm(),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _ContactDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in touch today',
          style: GoogleFonts.inter(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFF8FAFC),
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          'I\'m always open to discussing new projects,\ncreative ideas, or opportunities to be part of\nyour vision.',
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            color: const Color(0xFF94A3B8),
            height: 1.6,
          ),
        ),
        SizedBox(height: 5.h),
        _ContactInfoItem(
          icon: Icons.email_outlined,
          text: 'sahaddev@gmail.com',
        ),
        SizedBox(height: 2.h),
        _ContactInfoItem(icon: Icons.phone_outlined, text: '+91 7306713024'),
        SizedBox(height: 2.h),
        _ContactInfoItem(
          icon: Icons.location_on_outlined,
          text: 'Kannur, Kerala, India',
        ),
      ],
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ContactInfoItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF00D1FF), size: 18.sp),
        SizedBox(width: 1.5.w),
        Text(
          text,
          style: GoogleFonts.inter(
            color: const Color(0xFFF8FAFC),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}

class _ContactForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B).withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: _buildField('Name', 'John Carter')),
                  SizedBox(width: 2.w),
                  Expanded(child: _buildField('Email', 'example@email.com')),
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  Expanded(child: _buildField('Phone', '(123) 456 - 789')),
                  SizedBox(width: 2.w),
                  Expanded(child: _buildField('Company', 'Facebook')),
                ],
              ),
              SizedBox(height: 3.h),
              _buildField(
                'Message',
                'Please type your message here...',
                maxLines: 5,
              ),
              SizedBox(height: 5.h),
              Container(
                width: double.infinity,
                height: 7.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D1FF), Color(0xFFFF4D4D)],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Send message',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: const Color(0xFFF8FAFC),
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 1.h),
        TextField(
          maxLines: maxLines,
          style: GoogleFonts.inter(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: const Color(0xFF94A3B8),
              fontSize: 10.sp,
            ),
            filled: true,
            fillColor: const Color(0xFF0F172A),
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFF334155)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFF334155)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFF00D1FF),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
