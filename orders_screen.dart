import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'explore_screen.dart';
import 'profile_screen.dart';
import 'service_details_screen.dart';
import 'create_service_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  void _goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  void _goToExplore() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const ExploreScreen(),
      ),
    );
  }

  void _goToProfile() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
      ),
    );
  }

  // ============================================================
  // CREATE SERVICE
  // ============================================================

  void _createService() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CreateServiceScreen(),
      ),
    );
  }

  // ============================================================
  // SERVICE DETAILS
  // ============================================================

  void _openServiceDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ServiceDetailsScreen(),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      // ----------------------------------------------------------
      // APP BAR
      // ----------------------------------------------------------

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'Orders & My Services',
          style: TextStyle(
            color: Color(0xFF111111),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),

        bottom: TabBar(
          controller: _tabController,

          labelColor: const Color(0xFF1E7A35),
          unselectedLabelColor: Colors.grey,

          indicatorColor: const Color(0xFF1E7A35),
          indicatorWeight: 3,

          labelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),

          tabs: const [
            Tab(
              text: 'My Orders',
            ),
            Tab(
              text: 'My Services',
            ),
            Tab(
              text: 'Completed',
            ),
          ],
        ),
      ),

      // ----------------------------------------------------------
      // BODY
      // ----------------------------------------------------------

      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrders(),
          _buildMyServices(),
          _buildCompleted(),
        ],
      ),

      // ----------------------------------------------------------
      // CREATE SERVICE BUTTON
      // ----------------------------------------------------------

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createService,

        backgroundColor: const Color(0xFF1E7A35),

        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),

        label: const Text(
          'Create Service',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ----------------------------------------------------------
      // BOTTOM NAVIGATION
      // ----------------------------------------------------------

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,

        type: BottomNavigationBarType.fixed,

        selectedItemColor: const Color(0xFF1E7A35),
        unselectedItemColor: Colors.grey,

        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),

        onTap: (index) {
          if (index == 0) {
            _goToHome();
          } else if (index == 1) {
            _goToExplore();
          } else if (index == 2) {
            // Already on Orders
          } else if (index == 3) {
            _goToProfile();
          }
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MY ORDERS
  // ============================================================

  Widget _buildOrders() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        16,
        20,
        16,
        100,
      ),

      children: [
        _orderCard(
          title: 'Python Programming Help',
          provider: 'Rahim Ahmed',
          category: 'Programming',
          price: '৳500',
          status: 'In Progress',
          statusColor: Colors.orange,
          icon: Icons.code,
        ),

        _orderCard(
          title: 'UI/UX Design Consultation',
          provider: 'Nusrat Jahan',
          category: 'UI / Design',
          price: '৳800',
          status: 'Pending',
          statusColor: Colors.blue,
          icon: Icons.design_services,
        ),

        _orderCard(
          title: 'Video Editing Service',
          provider: 'Sakib Hasan',
          category: 'Video',
          price: '৳1,200',
          status: 'Accepted',
          statusColor: Colors.green,
          icon: Icons.video_camera_back,
        ),
      ],
    );
  }

  // ============================================================
  // MY SERVICES
  // ============================================================

  Widget _buildMyServices() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        16,
        20,
        16,
        100,
      ),

      children: [
        _myServiceCard(
          title: 'Flutter App Development',
          category: 'Programming',
          price: '৳1,000',
          orders: '8 orders',
          rating: '4.9',
          icon: Icons.phone_android,
        ),

        _myServiceCard(
          title: 'Python Assignment Help',
          category: 'Programming',
          price: '৳500',
          orders: '14 orders',
          rating: '4.8',
          icon: Icons.code,
        ),

        _myServiceCard(
          title: 'Video Editing',
          category: 'Video',
          price: '৳800',
          orders: '6 orders',
          rating: '5.0',
          icon: Icons.video_library,
        ),
      ],
    );
  }

  // ============================================================
  // COMPLETED
  // ============================================================

  Widget _buildCompleted() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        16,
        20,
        16,
        100,
      ),

      children: [
        _completedCard(
          title: 'Database Management Help',
          person: 'Completed with Arif',
          price: '৳600',
          date: 'Completed Sep 28',
        ),

        _completedCard(
          title: 'Logo Design',
          person: 'Completed with Farhana',
          price: '৳700',
          date: 'Completed Sep 24',
        ),

        _completedCard(
          title: 'Presentation Design',
          person: 'Completed with Mahin',
          price: '৳400',
          date: 'Completed Sep 20',
        ),
      ],
    );
  }

  // ============================================================
  // ORDER CARD
  // ============================================================

  Widget _orderCard({
    required String title,
    required String provider,
    required String category,
    required String price,
    required String status,
    required Color statusColor,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: _openServiceDetails,

      child: Container(
        margin: const EdgeInsets.only(bottom: 16),

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  height: 52,
                  width: 52,

                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5EA),
                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: Icon(
                    icon,
                    color: const Color(0xFF1E7A35),
                    size: 26,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF151515),
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        provider,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        category,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF777777),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),

                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            const Divider(
              height: 1,
            ),

            const SizedBox(height: 14),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  'Service Price',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),

                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF1E7A35),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                  color: Colors.grey,
                ),

                const SizedBox(width: 6),

                Text(
                  'Tap to view service details',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // MY SERVICE CARD
  // ============================================================

  Widget _myServiceCard({
    required String title,
    required String category,
    required String price,
    required String orders,
    required String rating,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,

                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5EA),
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Icon(
                  icon,
                  color: const Color(0xFF1E7A35),
                  size: 25,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      category,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Service options will be connected later.',
                      ),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Divider(
            height: 1,
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              _smallInfo(
                icon: Icons.payments_outlined,
                label: price,
              ),

              _smallInfo(
                icon: Icons.shopping_bag_outlined,
                label: orders,
              ),

              _smallInfo(
                icon: Icons.star,
                label: rating,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SMALL INFO
  // ============================================================

  Widget _smallInfo({
    required IconData icon,
    required String label,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: const Color(0xFF1E7A35),
        ),

        const SizedBox(width: 5),

        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF444444),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // COMPLETED CARD
  // ============================================================

  Widget _completedCard({
    required String title,
    required String person,
    required String price,
    required String date,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,

            decoration: BoxDecoration(
              color: const Color(0xFFE8F5EA),
              borderRadius: BorderRadius.circular(14),
            ),

            child: const Icon(
              Icons.check_circle,
              color: Color(0xFF1E7A35),
              size: 27,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  person,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          Text(
            price,
            style: const TextStyle(
              color: Color(0xFF1E7A35),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}