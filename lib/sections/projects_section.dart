import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      _Project(
        'MERN Todo App (2025)',
        'A fully functional Todo application with authentication, CRUD operations, and a clean, responsive UI.',
        'https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=2070&auto=format&fit=crop',
        ['React', 'Node.js', 'Express.js', 'MongoDB'],
      ),
      _Project(
        'E-Commerce Demo (2025)',
        'A demo e-commerce platform featuring product listing, cart system, and checkout flow.',
        'https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=2015&auto=format&fit=crop',
        ['React', 'Node.js', 'Express.js', 'MongoDB'],
      ),
    ];

    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      color: const Color(0xFF020617),
      child: Column(
        children: [
          Text(
            'Recent Projects',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFF8FAFC),
              letterSpacing: -1,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'Here are some of the real-world projects I\'ve built using\nthe MERN stack.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              color: const Color(0xFF94A3B8),
              height: 1.5,
            ),
          ),
          SizedBox(height: 8.h),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 900 ? 2 : 1;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 4.h,
                  childAspectRatio: 0.82,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return _ProjectCard(project: projects[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> tags;
  _Project(this.title, this.description, this.imageUrl, this.tags);
}

class _ProjectCard extends StatefulWidget {
  final _Project project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: _isHovering
                ? [const Color(0xFF00D1FF), const Color(0xFFEF4444)]
                : [
                    const Color(0xFF334155).withValues(alpha: 0.4),
                    const Color(0xFF334155).withValues(alpha: 0.1),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(7),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: Image.network(
                    widget.project.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: GoogleFonts.inter(
                        color: const Color(0xFFF8FAFC),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      widget.project.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF94A3B8),
                        fontSize: 11.sp,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.tags
                          .map((tag) => _TagCapsule(label: tag))
                          .toList(),
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Expanded(
                          child: _ActionButton(
                            text: 'GitHub',
                            icon: Icons.north_east_rounded,
                            gradient: const [
                              Color(0xFF3B82F6),
                              Color(0xFFEF4444),
                            ],
                          ),
                        ),
                        SizedBox(width: 1.w),
                        Expanded(
                          child: _ActionButton(
                            text: 'Live Demo',
                            icon: Icons.north_east_rounded,
                            gradient: const [
                              Color(0xFF00D1FF),
                              Color(0xFF3B82F6),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TagCapsule extends StatelessWidget {
  final String label;
  const _TagCapsule({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: const Color(0xFF3B82F6),
          fontSize: 8.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final List<Color> gradient;
  const _ActionButton({
    required this.text,
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 4),
          Icon(icon, color: Colors.white, size: 14.sp),
        ],
      ),
    );
  }
}
