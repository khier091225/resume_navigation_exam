import 'package:flutter/material.dart';

void main() {
  runApp(const MyResumeApp());
}

// ============================================================
// APP COLORS
// Students may customize these colors.
// ============================================================

class AppColors {
  static const Color primary = Color(0xFF164C43);
  static const Color secondary = Color(0xFF496D63);
  static const Color background = Color(0xFFF6F4EF);
  static const Color card = Colors.white;
  static const Color text = Color(0xFF21352F);
}

// ============================================================
// MAIN APPLICATION
// ============================================================

class MyResumeApp extends StatelessWidget {
  const MyResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Resume',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        cardTheme: const CardThemeData(
          color: AppColors.card,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.black26,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// ============================================================
// SCREEN 1: HOME / PROFILE
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'My Resume',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // PROFILE IMAGE
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),

            const SizedBox(height: 20),

            // NAME
            const Text(
              'KIERVIN P. DIXON',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 6),

            // CAREER TITLE
            const Text(
              'Aspiring Mobile Application Developer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 12),

            // LOCATION
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, size: 20, color: AppColors.primary),
                SizedBox(width: 5),
                Flexible(
                  child: Text(
                    'Calamba City, Laguna',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ABOUT ME
            Card(
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'I am an IT Generalist with experience in technical '
                      'support and troubleshooting. I am pursuing BS '
                      'Information Technology at Trimex Colleges, '
                      'specializing in Mobile and Web Development.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: AppColors.text,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // RESUME DETAILS BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResumeDetailsScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.description),
                label: const Text('VIEW RESUME DETAILS'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // SKILLS & PROJECTS BUTTON
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SkillsProjectsScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.code),
                label: const Text('SKILLS & PROJECTS'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // CERTIFICATES & TRAINING BUTTON
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CertificatesTrainingScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.workspace_premium_outlined),
                label: const Text('CERTIFICATES & TRAINING'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  minimumSize: const Size.fromHeight(48),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SCREEN 2: RESUME DETAILS
// ============================================================

class ResumeDetailsScreen extends StatelessWidget {
  const ResumeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Resume Details'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CONTACT INFORMATION
            const SectionTitle(
              icon: Icons.contact_mail,
              title: 'Contact Information',
            ),

            const SizedBox(height: 10),

            Card(
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    ContactRow(
                      icon: Icons.email,
                      text: 'syntaxx.error404@gmail.com',
                    ),

                    Divider(),

                    ContactRow(icon: Icons.phone, text: '0991-219-7679'),

                    Divider(),

                    ContactRow(
                      icon: Icons.location_on,
                      text: 'Calamba City, Laguna',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // EDUCATION
            const SectionTitle(icon: Icons.school, title: 'Education'),

            const SizedBox(height: 10),

            const ResumeCard(
              title:
                  'BS Information Technology Specialized in '
                  'Mobile and Web Development',
              subtitle: 'Trimex Colleges',
              period: '2024 - Present',
              description:
                  'Currently pursuing a degree in Information '
                  'Technology with a specialization in Mobile and Web '
                  'Development, focusing on programming and building '
                  'practical web and mobile applications.',
            ),

            const SizedBox(height: 25),

            // EXPERIENCE
            const SectionTitle(icon: Icons.work, title: 'Experience'),

            const SizedBox(height: 10),

            const ResumeCard(
              title: 'IT Generalist',
              subtitle: 'Laguna Carparts Mfg., Inc.,',
              period: '2025 - Present',
              description:
                  'Provided broad IT support, assisted employees with '
                  'technical issues, and helped maintain reliable '
                  'workplace systems for daily business operations.',
            ),
            const SizedBox(height: 10),

            const ResumeCard(
              title: 'IT Staff',
              subtitle: 'San Roque Human Resources Corp.,',
              period: '2016 - 2022',
              description:
                  'Supported day-to-day IT operations, assisted users '
                  'with technical concerns, and helped troubleshoot '
                  'computer and software issues.',
            ),

            const SizedBox(height: 25),

            // CAREER OBJECTIVE
            const SectionTitle(icon: Icons.flag, title: 'Career Objective'),

            const SizedBox(height: 10),

            Card(
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  'My goal is to grow as an IT Generalist with a '
                  'strong focus on mobile and web development, '
                  'creating reliable applications that are easy to '
                  'use and meet business needs while continuously '
                  'improving my technical and problem-solving skills.',
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: AppColors.text,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // BACK BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('BACK TO HOME'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SCREEN 3: SKILLS & PROJECTS
// ============================================================

class SkillsProjectsScreen extends StatelessWidget {
  const SkillsProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Skills & Projects'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SKILLS
            const SectionTitle(icon: Icons.star, title: 'My Skills'),

            const SizedBox(height: 15),

            const Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SkillChip(skill: 'Flutter'),
                SkillChip(skill: 'Dart'),
                SkillChip(skill: 'HTML'),
                SkillChip(skill: 'CSS'),
                SkillChip(skill: 'JavaScript'),
                SkillChip(skill: 'PHP'),
                SkillChip(skill: 'AI'),
                SkillChip(skill: 'Laravel'),
                SkillChip(skill: 'UI/UX Design'),
                SkillChip(skill: 'Database'),
              ],
            ),

            const SizedBox(height: 30),

            // PROJECTS
            const SectionTitle(icon: Icons.folder, title: 'My Projects'),

            const SizedBox(height: 15),

            const ProjectCard(
              title: 'Barangay Information System',
              description:
                  'A web application designed to organize barangay '
                  'records and resident information, support '
                  'administrative workflows, and provide email and '
                  'SMS notifications for more efficient communication.',
              tools: 'Laravel, PHP, MariaDB, SMTP, PhilSMS, Claude API',
            ),

            const SizedBox(height: 15),

            const ProjectCard(
              title: 'Learning Management System',
              description:
                  'A web application designed to organize learning '
                  'materials, manage course activities, and support '
                  'communication between instructors and students '
                  'through email and SMS notifications.',
              tools:
                  'HTML, CSS, JavaScript, PHP, MySQL, SMTP, '
                  'PhilSMS, Claude API',
            ),

            const SizedBox(height: 25),

            // BACK BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('BACK TO HOME'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SCREEN 4: CERTIFICATES & TRAINING
// ============================================================

class CertificatesTrainingScreen extends StatelessWidget {
  const CertificatesTrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'Certificates & Training',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Professional Development',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Completed training in IT support, system administration, '
                'and mobile and web development.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 24),
              const SectionTitle(
                icon: Icons.workspace_premium_outlined,
                title: 'Certificates',
              ),
              const SizedBox(height: 12),
              // Fictional completion records for this classroom resume project.
              const TrainingCard(
                icon: Icons.workspace_premium_outlined,
                status: 'Certificate of Completion',
                title: 'IT Support Fundamentals',
                provider: 'TechSkills Training Center',
                completionDate: 'March 2024',
                description:
                    'Completed practical training in computer maintenance, '
                    'software installation, and technical troubleshooting.',
              ),
              const SizedBox(height: 14),
              const TrainingCard(
                icon: Icons.workspace_premium_outlined,
                status: 'Certificate of Completion',
                title: 'Web Development Fundamentals',
                provider: 'Digital Learning Academy',
                completionDate: 'August 2025',
                description:
                    'Completed training in developing responsive websites '
                    'and database-driven applications using PHP and Laravel.',
              ),
              const SizedBox(height: 24),
              const SectionTitle(
                icon: Icons.school_outlined,
                title: 'Completed Training',
              ),
              const SizedBox(height: 12),
              const TrainingCard(
                icon: Icons.computer_outlined,
                title: 'Hardware & Technical Support',
                provider: 'TechSkills Training Center',
                completionDate: 'March 2024',
                description:
                    'Trained in PC assembly, software installation, '
                    'troubleshooting, and everyday technical support.',
              ),
              const SizedBox(height: 14),
              const TrainingCard(
                icon: Icons.lan_outlined,
                title: 'Networking Fundamentals',
                provider: 'TechSkills Training Center',
                completionDate: 'June 2024',
                description:
                    'Practiced IP addressing, LAN and Wi-Fi setup, '
                    'connectivity troubleshooting, and basic network security.',
              ),
              const SizedBox(height: 14),
              const TrainingCard(
                icon: Icons.admin_panel_settings_outlined,
                title: 'Windows & System Administration',
                provider: 'TechSkills Training Center',
                completionDate: 'August 2024',
                description:
                    'Trained in Windows setup, user accounts, access '
                    'permissions, software updates, and routine maintenance.',
              ),
              const SizedBox(height: 14),
              const TrainingCard(
                icon: Icons.security_outlined,
                title: 'Cybersecurity Fundamentals',
                provider: 'Digital Learning Academy',
                completionDate: 'November 2024',
                description:
                    'Completed training in password security, phishing '
                    'awareness, safe browsing, and workplace data protection.',
              ),
              const SizedBox(height: 14),
              const TrainingCard(
                icon: Icons.backup_outlined,
                title: 'Database & Backup Fundamentals',
                provider: 'Digital Learning Academy',
                completionDate: 'April 2025',
                description:
                    'Practiced SQL queries, MySQL and MariaDB management, '
                    'database backups, and record restoration.',
              ),
              const SizedBox(height: 14),
              const TrainingCard(
                icon: Icons.web_outlined,
                title: 'Web Application Development',
                provider: 'Digital Learning Academy',
                completionDate: 'August 2025',
                description:
                    'Built responsive web applications using HTML, CSS, '
                    'JavaScript, PHP, and Laravel during hands-on training.',
              ),
              const SizedBox(height: 14),
              const TrainingCard(
                icon: Icons.phone_android_outlined,
                title: 'Mobile Application Development',
                provider: 'Digital Learning Academy',
                completionDate: 'February 2026',
                description:
                    'Developed Flutter and Dart applications with responsive '
                    'layouts and navigation between screens.',
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('BACK TO HOME'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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
}

class TrainingCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String provider;
  final String completionDate;
  final String description;
  final String status;

  const TrainingCard({
    super.key,
    required this.icon,
    required this.title,
    required this.provider,
    required this.completionDate,
    required this.description,
    this.status = 'Completed',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 26, color: AppColors.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    provider,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Completed: $completionDate',
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: AppColors.text,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// REUSABLE WIDGET: SECTION TITLE
// ============================================================

class SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const SectionTitle({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary),

        const SizedBox(width: 8),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// REUSABLE WIDGET: CONTACT ROW
// ============================================================

class ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 15, color: AppColors.text),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// REUSABLE WIDGET: RESUME CARD
// ============================================================

class ResumeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String period;
  final String description;

  const ResumeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.period,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: AppColors.text),
            ),

            const SizedBox(height: 3),

            Text(
              period,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),

            const SizedBox(height: 10),

            Text(
              description,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// REUSABLE WIDGET: SKILL CHIP
// ============================================================

class SkillChip extends StatelessWidget {
  final String skill;

  const SkillChip({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(
        Icons.check_circle,
        size: 18,
        color: AppColors.primary,
      ),
      label: Text(skill),
    );
  }
}

// ============================================================
// REUSABLE WIDGET: PROJECT CARD
// ============================================================

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String tools;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.tools,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              description,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: AppColors.text,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Tools / Technologies:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              tools,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
