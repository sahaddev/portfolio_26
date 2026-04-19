import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ReviewSection extends StatefulWidget {
  const ReviewSection({super.key});

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_Testimonial> _testimonials = [
    _Testimonial(
      review:
          "Sajid handled both frontend and backend tasks smoothly and always ensured the codebase stayed clean, structured, and easy to maintain. He identified performance bottlenecks early, proposed solid solutions, and implemented them without disrupting the workflow.",
      author: "Wambui Muli",
      date: "17/05/2023",
      rating: 5,
    ),
    _Testimonial(
      review:
          "An exceptional developer who brings both technical skill and creative problem solving to the table. The project was delivered ahead of schedule with zero major bugs.",
      author: "Alex Rivera",
      date: "12/08/2024",
      rating: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      color: const Color(0xFF020617),
      child: Column(
        children: [
          Text(
            'Testimonials',
            style: GoogleFonts.inter(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFF8FAFC),
              letterSpacing: -1,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'Feedback from clients and collaborators I\'ve worked with\non real projects and web applications.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              color: const Color(0xFF94A3B8),
              height: 1.5,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (MediaQuery.of(context).size.width > 900)
                _NavArrow(
                  icon: Icons.chevron_left,
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              SizedBox(width: 4.w),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 350,
                    maxHeight: 600,
                  ),
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) =>
                        setState(() => _currentPage = index),
                    itemCount: _testimonials.length,
                    itemBuilder: (context, index) {
                      return _TestimonialCard(
                        testimonial: _testimonials[index],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              if (MediaQuery.of(context).size.width > 900)
                _NavArrow(
                  icon: Icons.chevron_right,
                  onPressed: () {
                    if (_currentPage < _testimonials.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _testimonials.length,
              (index) => _PageIndicator(isActive: _currentPage == index),
            ),
          ),
        ],
      ),
    );
  }
}

class _Testimonial {
  final String review;
  final String author;
  final String date;
  final int rating;
  _Testimonial({
    required this.review,
    required this.author,
    required this.date,
    required this.rating,
  });
}

class _TestimonialCard extends StatelessWidget {
  final _Testimonial testimonial;
  const _TestimonialCard({required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF3B82F6).withOpacity(0.5),
              const Color(0xFFEF4444).withOpacity(0.5),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              width: MediaQuery.of(context).size.width < 600 ? 90.w : 60.w,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B).withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star_rounded,
                          color: index < testimonial.rating
                              ? const Color(0xFFFF8A00)
                              : Colors.grey.withOpacity(0.3),
                          size: 24.sp,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Text(
                      testimonial.review,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: const Color(0xFFF8FAFC),
                        fontSize: 12.sp,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Text(
                      testimonial.author,
                      style: GoogleFonts.inter(
                        color: const Color(0xFFEF4444),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      testimonial.date,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF94A3B8),
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavArrow extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _NavArrow({required this.icon, required this.onPressed});

  @override
  State<_NavArrow> createState() => _NavArrowState();
}

class _NavArrowState extends State<_NavArrow> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF3B82F6), Color(0xFFEF4444)],
            ),
            boxShadow: _isHovering
                ? [
                    BoxShadow(
                      color: const Color(0xFFEF4444).withOpacity(0.3),
                      blurRadius: 15,
                    ),
                  ]
                : [],
          ),
          child: Icon(widget.icon, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final bool isActive;
  const _PageIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? const Color(0xFFEF4444)
            : Colors.white.withOpacity(0.3),
      ),
    );
  }
}
