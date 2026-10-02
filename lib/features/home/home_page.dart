import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('집케어'),
        actions: [
          IconButton(
            tooltip: '검색',
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            Text('부동산 자료를 쉽고 편하게 관리하세요', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            _PrimaryActionCard(
              icon: Icons.home_work_outlined,
              title: '매물 보기',
              subtitle: '등록한 매물을 확인합니다',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _PrimaryActionCard(
              icon: Icons.add_home_work_outlined,
              title: '새 매물 등록',
              subtitle: '새로운 매물 정보를 기록합니다',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _CompactActionCard(
                    icon: Icons.people_alt_outlined,
                    label: '연락처',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _CompactActionCard(
                    icon: Icons.notifications_none_outlined,
                    label: '오늘 할 일',
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _PrimaryActionCard(
              icon: Icons.settings_backup_restore,
              title: '설정 / 백업',
              subtitle: '글자 크기와 자료 백업을 관리합니다',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimaryActionCard extends StatelessWidget {
  const _PrimaryActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Row(
            children: [
              Icon(icon, size: 42, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 6),
                    Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, size: 34),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompactActionCard extends StatelessWidget {
  const _CompactActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 124),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 38, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 10),
                Text(label, textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
