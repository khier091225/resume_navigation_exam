import 'package:flutter/material.dart';

void main() {
  runApp(const MyResumeApp());
}

// ============================================================
// APP COLORS
// Students may customize these colors.
// ============================================================

class AppColors {
  static const Color primary = Color(0xFF1F4E78);
  static const Color secondary = Color(0xFF5B8DB8);
  static const Color background = Color(0xFFF4F6F8);
  static const Color card = Colors.white;
  static const Color text = Color(0xFF1F2937);
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
              color: AppColors.card,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'I am an IT Generalist with experience in technical '
                      'support, troubleshooting, and daily IT operations. '
                      'I am expanding my skills in mobile and web '
                      'development to create reliable applications that '
                      'are easy to use and support business needs.',
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
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
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
              title: 'Bachelor of Science in Information Technology',
              subtitle: 'Trimex Colleges',
              period: '2024 - Present',
              description:
                  'Currently pursuing a degree in Information '
                  'Technology with focus on programming, '
                  'software development, and mobile applications.',
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
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  'My goal is to grow as an IT Generalist with a '
                  'strong focus on mobile and web development, '
                  'creating reliable applications that are easy to '
                  'use and meet business needs while continuously '
                  'improving my technical and problem-solving skills.',
                  style: TextStyle(fontSize: 15, height: 1.5),
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

        Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
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
      elevation: 2,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

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
                color: AppColors.text,
              ),
            ),

            const SizedBox(height: 5),

            Text(subtitle, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 3),

            Text(period, style: const TextStyle(color: Colors.grey)),

            const SizedBox(height: 10),

            Text(description, style: const TextStyle(height: 1.5)),
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
      elevation: 2,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      child: Padding(
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 10),

            Text(description, style: const TextStyle(height: 1.5)),

            const SizedBox(height: 12),

            const Text(
              'Tools / Technologies:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            Text(tools),
          ],
        ),
      ),
    );
  }
}
