import 'package:flutter/material.dart';

import 'package:olek_udemy_portfolio/components.dart';
import 'package:olek_udemy_portfolio/contact_form.dart';
import 'package:olek_udemy_portfolio/content.dart';
import 'package:olek_udemy_portfolio/theme.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _worksKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      alignment: 0.05,
    );
  }

  Map<String, GlobalKey> get _sections => <String, GlobalKey>{
    'Home': _homeKey,
    'About': _aboutKey,
    'Services': _servicesKey,
    'Works': _worksKey,
    'Contact': _contactKey,
  };

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final fieldWidth = (width - 48).clamp(220.0, 420.0);

    return Scaffold(
      appBar: AppBar(
        title: SansBold(Profile.name, 18),
        actions: const [ThemeToggleButton()],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 48),
          children: [
            Center(
              child: CircleAvatar(
                radius: 64,
                backgroundColor: scheme.primary,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(Profile.avatar),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(child: SansBold(Profile.name, 22)),
            Center(child: Sans(Profile.role, 15)),
            const SizedBox(height: 24),
            for (final section in _sections.entries) ...[
              Center(
                child: TabsMobile(
                  text: section.key,
                  onTap: () {
                    Navigator.of(context).pop();
                    _scrollTo(section.value);
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
            const SizedBox(height: 12),
            const SocialLinks(
              instagramUrl: Profile.instagram,
              githubUrl: Profile.github,
            ),
          ],
        ),
      ),
      floatingActionButton: ScrollToTopButton(controller: _scrollController),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Intro
            Column(
              key: _homeKey,
              children: [
                CircleAvatar(
                  radius: 104,
                  backgroundColor: scheme.primary,
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(Profile.avatarAlt),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: scheme.primaryContainer,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Sans(
                    "Hello, I'm",
                    14,
                    color: scheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 8),
                SansBold(Profile.name, 28, align: TextAlign.center),
                Sans(Profile.role, 18, color: scheme.primary),
                const SizedBox(height: 12),
                Sans(
                  Profile.tagline,
                  15,
                  align: TextAlign.center,
                  color: scheme.onSurfaceVariant,
                ),
                const SizedBox(height: 20),
                ContactLine(
                  icon: Icons.email_outlined,
                  text: Profile.email,
                  uri: Uri(scheme: 'mailto', path: Profile.email),
                  size: 15,
                ),
                ContactLine(
                  icon: Icons.call_outlined,
                  text: Profile.phone,
                  uri: Uri(
                    scheme: 'tel',
                    path: Profile.phone.replaceAll(' ', ''),
                  ),
                  size: 15,
                ),
                ContactLine(
                  icon: Icons.location_pin,
                  text: Profile.location,
                  uri: Uri.parse(
                    'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(Profile.location)}',
                  ),
                  size: 15,
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    FilledButton.icon(
                      onPressed: () => _scrollTo(_contactKey),
                      icon: const Icon(Icons.chat_bubble_outline),
                      label: const Text('Hire me'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _scrollTo(_worksKey),
                      icon: const Icon(Icons.work_outline),
                      label: const Text('See my work'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 72),

            // About
            Column(
              key: _aboutKey,
              children: [
                const SectionTitle('About me'),
                const SizedBox(height: 20),
                Sans(
                  'I specialize in Flutter, which lets one codebase run on Android, iOS, '
                  'web and desktop. I care about clean architecture, performance and security.',
                  15,
                  align: TextAlign.center,
                  color: scheme.onSurfaceVariant,
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    for (final skill in Profile.skills) SkillChip(skill),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 72),

            // Services
            Column(
              key: _servicesKey,
              children: [
                const SectionTitle('What I do'),
                const SizedBox(height: 24),
                for (final service in services) ...[
                  AnimatedCard(
                    imagePath: service.imagePath,
                    text: service.title,
                    description: service.description,
                    width: 220,
                    height: 140,
                    reverse: services.indexOf(service).isEven,
                  ),
                  const SizedBox(height: 24),
                ],
              ],
            ),
            const SizedBox(height: 48),

            // Works
            Column(
              key: _worksKey,
              children: [
                const SectionTitle('Selected works'),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    for (final project in projects)
                      ProjectCard(
                        title: project.title,
                        description: project.description,
                        imagePath: project.imagePath,
                        tags: project.tags,
                        url: project.url,
                        width: fieldWidth,
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 72),

            // Contact
            Column(
              key: _contactKey,
              children: [
                const SectionTitle('Contact me'),
                const SizedBox(height: 24),
                ContactForm(fieldWidth: fieldWidth, twoColumns: false),
                const SizedBox(height: 24),
                const SocialLinks(
                  instagramUrl: Profile.instagram,
                  githubUrl: Profile.github,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: Sans(
                '© ${DateTime.now().year} ${Profile.name}',
                13,
                color: scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
