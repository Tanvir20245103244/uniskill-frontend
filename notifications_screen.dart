import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, dynamic>> _todayNotifications = [
    {
      'icon': Icons.shopping_bag_outlined,
      'iconColor': const Color(0xFF4338CA),
      'title': 'New service request',
      'message':
      'Someone requested your Python programming service.',
      'time': '10 minutes ago',
      'unread': true,
    },
    {
      'icon': Icons.chat_bubble_outline_rounded,
      'iconColor': const Color(0xFF0284C7),
      'title': 'New message',
      'message':
      'Farzana sent you a message about the project.',
      'time': '1 hour ago',
      'unread': true,
    },
    {
      'icon': Icons.star_outline_rounded,
      'iconColor': const Color(0xFFF59E0B),
      'title': 'New review',
      'message':
      'You received a 5-star review for your service.',
      'time': '3 hours ago',
      'unread': false,
    },
  ];

  final List<Map<String, dynamic>> _yesterdayNotifications = [
    {
      'icon': Icons.check_circle_outline_rounded,
      'iconColor': const Color(0xFF10B981),
      'title': 'Order completed',
      'message':
      'Your Calculus tutoring order has been completed.',
      'time': 'Yesterday',
      'unread': false,
    },
    {
      'icon': Icons.favorite_border_rounded,
      'iconColor': const Color(0xFFF43F5E),
      'title': 'Service saved',
      'message':
      'A service you saved has received a new update.',
      'time': 'Yesterday',
      'unread': false,
    },
  ];

  void _markAllAsRead() {
    setState(() {
      for (final notification in _todayNotifications) {
        notification['unread'] = false;
      }

      for (final notification in _yesterdayNotifications) {
        notification['unread'] = false;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All notifications marked as read'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _openNotification(Map<String, dynamic> notification) {
    if (notification['unread'] == true) {
      setState(() {
        notification['unread'] = false;
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(notification['title']),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF0F172A),
          ),
          onPressed: () => Navigator.pop(context),
        ),

        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.w800,
          ),
        ),

        actions: [
          TextButton(
            onPressed: _markAllAsRead,
            child: const Text(
              'Mark all read',
              style: TextStyle(
                color: Color(0xFF4338CA),
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'TODAY',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
              color: Color(0xFF64748B),
            ),
          ),

          const SizedBox(height: 12),

          ..._todayNotifications.map(
                (notification) => _notificationCard(
              notification: notification,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'YESTERDAY',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
              color: Color(0xFF64748B),
            ),
          ),

          const SizedBox(height: 12),

          ..._yesterdayNotifications.map(
                (notification) => _notificationCard(
              notification: notification,
            ),
          ),
        ],
      ),
    );
  }

  Widget _notificationCard({
    required Map<String, dynamic> notification,
  }) {
    final IconData icon = notification['icon'];
    final Color iconColor = notification['iconColor'];
    final String title = notification['title'];
    final String message = notification['message'];
    final String time = notification['time'];
    final bool unread = notification['unread'];

    return GestureDetector(
      onTap: () => _openNotification(notification),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: unread
              ? const Color(0xFFEEF2FF)
              : Colors.white,

          borderRadius: BorderRadius.circular(16),

          border: Border.all(
            color: const Color(0xFFE2E8F0),
          ),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,

              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Icon(
                icon,
                color: iconColor,
                size: 21,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ),

                      if (unread)
                        Container(
                          width: 7,
                          height: 7,

                          decoration: const BoxDecoration(
                            color: Color(0xFF4338CA),
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 11,
                      height: 1.4,
                      color: Color(0xFF64748B),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 9,
                      color: Color(0xFF94A3B8),
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