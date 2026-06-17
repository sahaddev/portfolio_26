import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_26/core/constants/app_assets.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      _Project(
        'View360',
        'View360 is a cross-platform enterprise communication app built with Flutter for iOS and Android, following Clean Architecture with the BLoC pattern. It serves as a unified business platform combining real-time communication, productivity tools, and secure data handling.',
        AppAssets.view360App,
        ['Flutter', 'Clean Architecture', 'BLoC', 'WebRTC', 'Socket.IO', 'FCM'],
        [
          _ProjectLink(
            'Play Store',
            'https://play.google.com/store/apps/details?id=com.v360.app&hl=en_IN&pli=1',
            Icons.shop,
            const [Color(0xFF3B82F6), Color(0xFFEF4444)],
          ),
          _ProjectLink(
            'App Store',
            'https://apps.apple.com/us/app/view360cx/id6747253088',
            Icons.apple,
            const [Color(0xFF00D1FF), Color(0xFF3B82F6)],
          ),
        ],
      ),
      _Project(
        'View360 Engage',
        'A cross-platform customer engagement application delivering real-time voice/video calling, support ticket management, and biometric authentication — powered by a custom pub.dev chat package independently authored and published.',
        AppAssets.view360EngageApp,
        ['Flutter', 'LiveKit', 'BLoC/Cubit', 'Freezed'],
        [
          _ProjectLink(
            'Play Store',
            'https://play.google.com/store/apps/details?id=com.v360.app&hl=en_IN',
            Icons.shop,
            const [Color(0xFF3B82F6), Color(0xFFEF4444)],
          ),
          _ProjectLink(
            'App Store',
            'https://apps.apple.com/us/app/view360cx/id6747253088',
            Icons.apple,
            const [Color(0xFF00D1FF), Color(0xFF3B82F6)],
          ),
        ],
      ),
      _Project(
        'Pathway',
        'A comprehensive learning app with user-friendly course exploration and mentor-student interaction. Enhanced user experience through push notifications, localization and real-time updates via web-sockets.',
        AppAssets.pathwayApp,
        ['Flutter', 'RESTful API', 'MVC', 'Bloc', 'WebSockets', 'AWS'],
        [
          _ProjectLink(
            'Play Store',
            'https://play.google.com/store/apps/details?id=com.learnpro.path_way_flu',
            Icons.shop,
            const [Color(0xFF3B82F6), Color(0xFFEF4444)],
          ),
          _ProjectLink(
            'GitHub',
            'https://github.com/SahadMPP/PATHWAY.git',
            Icons.code,
            const [Color(0xFF00D1FF), Color(0xFF3B82F6)],
          ),
        ],
      ),
      _Project(
        'FitMore',
        'A dynamic E-commerce app enabling seamless product browsing, secure purchases and order management. Integrated user authentication, personalized recommendations and real-time notifications.',
        AppAssets.fitmoreApp,
        ['Flutter', 'Dart', 'Hive', 'MVC'],
        [
          _ProjectLink(
            'Amazon',
            'https://www.amazon.com/dp/B0CMJS8PZK/ref=apps_sf_sta',
            Icons.shopping_cart,
            const [Color(0xFF3B82F6), Color(0xFFEF4444)],
          ),
          _ProjectLink(
            'GitHub',
            'https://github.com/SahadMPP/FITMORE.git',
            Icons.code,
            const [Color(0xFF00D1FF), Color(0xFF3B82F6)],
          ),
        ],
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
            'Here are some of the real-world projects I\'ve built.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              color: const Color(0xFF94A3B8),
              height: 1.5,
            ),
          ),
          SizedBox(height: 8.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            separatorBuilder: (context, index) => SizedBox(height: 4.h),
            itemBuilder: (context, index) {
              return _ProjectCard(project: projects[index]);
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectLink {
  final String title;
  final String url;
  final IconData icon;
  final List<Color> gradient;
  _ProjectLink(this.title, this.url, this.icon, this.gradient);
}

class _Project {
  final String title;
  final String description;
  final String imagePath;
  final List<String> tags;
  final List<_ProjectLink> links;
  _Project(this.title, this.description, this.imagePath, this.tags, this.links);
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isDesktop = constraints.maxWidth > 600;

              Widget imageWidget = ClipRRect(
                borderRadius: isDesktop
                    ? const BorderRadius.horizontal(left: Radius.circular(7))
                    : const BorderRadius.vertical(top: Radius.circular(7)),
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: Image.asset(
                    widget.project.imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFF1E293B),
                      child: Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.grey.withValues(alpha: 0.5),
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              );

              Widget contentWidget = Padding(
                padding: EdgeInsets.all(2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.project.title,
                      style: GoogleFonts.inter(
                        color: const Color(0xFFF8FAFC),
                        fontSize: isDesktop ? 16.sp : 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      widget.project.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF94A3B8),
                        fontSize: isDesktop ? 11.sp : 10.sp,
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
                      children: widget.project.links.map((link) {
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: link == widget.project.links.last
                                  ? 0
                                  : 1.w,
                            ),
                            child: _ActionButton(
                              text: link.title,
                              icon: link.icon,
                              gradient: link.gradient,
                              url: link.url,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );

              return isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2, child: imageWidget),
                        Expanded(flex: 3, child: contentWidget),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [imageWidget, contentWidget],
                    );
            },
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
  final String url;
  const _ActionButton({
    required this.text,
    required this.icon,
    required this.gradient,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
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
            const SizedBox(width: 4),
            Icon(icon, color: Colors.white, size: 14.sp),
          ],
        ),
      ),
    );
  }
}
