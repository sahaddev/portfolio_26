import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../controllers/contact_controller.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final ContactController _controller = ContactController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                    Expanded(child: _ContactForm(controller: _controller)),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _ContactDetails(),
                    SizedBox(height: 8.h),
                    _ContactForm(controller: _controller),
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
        const _ContactInfoItem(
          icon: Icons.email_outlined,
          text: 'muhdsahad4916@gmail.com',
        ),
        SizedBox(height: 2.h),
        const _ContactInfoItem(
          icon: Icons.phone_outlined,
          text: '+91 7306713024',
        ),
        SizedBox(height: 2.h),
        const _ContactInfoItem(
          icon: Icons.location_on_outlined,
          text: 'Kannur, Kerala, India',
        ),
      ],
    );
  }
}

class _ContactInfoItem extends StatefulWidget {
  final IconData icon;
  final String text;
  const _ContactInfoItem({required this.icon, required this.text});

  @override
  State<_ContactInfoItem> createState() => _ContactInfoItemState();
}

class _ContactInfoItemState extends State<_ContactInfoItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(_isHovered ? 10 : 0, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.icon, color: const Color(0xFF00D1FF), size: 18.sp),
            SizedBox(width: 1.5.w),
            Text(
              widget.text,
              style: GoogleFonts.inter(
                color: _isHovered
                    ? const Color(0xFF00D1FF)
                    : const Color(0xFFF8FAFC),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactForm extends StatelessWidget {
  final ContactController controller;

  const _ContactForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B).withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 500) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _HoverField(
                                label: 'Name *',
                                hint: 'John Carter',
                                textController: controller.nameController,
                                errorText: controller.nameError,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: _HoverField(
                                label: 'Email *',
                                hint: 'example@email.com',
                                textController: controller.emailController,
                                errorText: controller.emailError,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            _HoverField(
                              label: 'Name *',
                              hint: 'John Carter',
                              textController: controller.nameController,
                              errorText: controller.nameError,
                            ),
                            SizedBox(height: 2.h),
                            _HoverField(
                              label: 'Email *',
                              hint: 'example@email.com',
                              textController: controller.emailController,
                              errorText: controller.emailError,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  SizedBox(height: 3.h),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 500) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _HoverField(
                                label: 'Phone',
                                hint: '(123) 456 - 789',
                                textController: controller.phoneController,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: _HoverField(
                                label: 'Company',
                                hint: 'Facebook',
                                textController: controller.companyController,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            _HoverField(
                              label: 'Phone',
                              hint: '(123) 456 - 789',
                              textController: controller.phoneController,
                            ),
                            SizedBox(height: 2.h),
                            _HoverField(
                              label: 'Company',
                              hint: 'Facebook',
                              textController: controller.companyController,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  SizedBox(height: 3.h),
                  _HoverField(
                    label: 'Message *',
                    hint: 'Please type your message here...',
                    maxLines: 5,
                    textController: controller.messageController,
                    errorText: controller.messageError,
                  ),
                  SizedBox(height: 5.h),
                  _SubmitButton(controller: controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HoverField extends StatefulWidget {
  final String label;
  final String hint;
  final int maxLines;
  final TextEditingController textController;
  final String? errorText;

  const _HoverField({
    required this.label,
    required this.hint,
    this.maxLines = 1,
    required this.textController,
    this.errorText,
  });

  @override
  State<_HoverField> createState() => _HoverFieldState();
}

class _HoverFieldState extends State<_HoverField> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.inter(
            color: const Color(0xFFF8FAFC),
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 1.h),
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(0, _isHovered ? -2 : 0, 0),
            decoration: BoxDecoration(
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: const Color(0xFF00D1FF).withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : [],
            ),
            child: TextField(
              controller: widget.textController,
              maxLines: widget.maxLines,
              style: GoogleFonts.inter(color: Colors.white),
              decoration: InputDecoration(
                hintText: widget.hint,
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
                  borderSide: BorderSide(
                    color: widget.errorText != null
                        ? Colors.red.shade400
                        : const Color(0xFF334155),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: widget.errorText != null
                        ? Colors.red.shade400
                        : const Color(0xFF00D1FF),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (widget.errorText != null) ...[
          SizedBox(height: 0.5.h),
          Text(
            widget.errorText!,
            style: GoogleFonts.inter(
              color: Colors.red.shade400,
              fontSize: 9.sp,
            ),
          ),
        ],
      ],
    );
  }
}

class _SubmitButton extends StatefulWidget {
  final ContactController controller;

  const _SubmitButton({required this.controller});

  @override
  State<_SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<_SubmitButton> {
  bool _isHovered = false;

  void _submit(BuildContext context) async {
    if (widget.controller.isLoading) return;

    final success = await widget.controller.submitForm();

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Message sent successfully!',
            style: GoogleFonts.inter(color: Colors.white),
          ),
          backgroundColor: Colors.green.shade600,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (widget.controller.nameError == null &&
        widget.controller.emailError == null &&
        widget.controller.messageError == null) {
      // Show error only if it wasn't a validation error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to send message. Please try again.',
            style: GoogleFonts.inter(color: Colors.white),
          ),
          backgroundColor: Colors.red.shade600,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = widget.controller.isLoading;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: isLoading ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _submit(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: 7.h,
          transform: Matrix4.translationValues(
            0,
            _isHovered && !isLoading ? -2 : 0,
            0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Color(0xFF00D1FF), Color(0xFFFF4D4D)],
            ),
            boxShadow: _isHovered && !isLoading
                ? [
                    BoxShadow(
                      color: const Color(0xFF00D1FF).withValues(alpha: 0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                : Text(
                    'Send message',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
