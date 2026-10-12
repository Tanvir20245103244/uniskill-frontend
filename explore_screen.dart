import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'orders_screen.dart';
import 'profile_screen.dart';
import 'service_details_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController =
  TextEditingController();

  String _selectedCategory = 'All';

  final List<Map<String, dynamic>> _services = [
    {
      'icon': Icons.phone_android,
      'title': 'Flutter App Development',
      'provider': 'Sakib Hasan',
      'rating': '4.9',
      'price': 'From ৳1,000',
      'category': 'Programming',
      'color': const Color(0xFFEEF2FF),
      'iconColor': const Color(0xFF4338CA),
    },
    {
      'icon': Icons.code,
      'title': 'Python Programming Help',
      'provider': 'Rahim Ahmed',
      'rating': '4.8',
      'price': 'From ৳500',
      'category': 'Programming',
      'color': const Color(0xFFECFDF5),
      'iconColor': const Color(0xFF059669),
    },
    {
      'icon': Icons.design_services_outlined,
      'title': 'UI/UX Design Consultation',
      'provider': 'Nusrat Jahan',
      'rating': '4.9',
      'price': 'From ৳800',
      'category': 'UI / Design',
      'color': const Color(0xFFFDF2F8),
      'iconColor': const Color(0xFFDB2777),
    },
    {
      'icon': Icons.video_camera_back_outlined,
      'title': 'Professional Video Editing',
      'provider': 'Sakib Hasan',
      'rating': '5.0',
      'price': 'From ৳1,200',
      'category': 'Video',
      'color': const Color(0xFFFFF7ED),
      'iconColor': const Color(0xFFEA580C),
    },
    {
      'icon': Icons.menu_book_outlined,
      'title': 'Calculus Tutoring',
      'provider': 'Arif Hossain',
      'rating': '4.9',
      'price': 'From ৳600',
      'category': 'Education',
      'color': const Color(0xFFECFDF5),
      'iconColor': const Color(0xFF059669),
    },
    {
      'icon': Icons.storage_rounded,
      'title': 'Database Management Help',
      'provider': 'Mahin Rahman',
      'rating': '4.8',
      'price': 'From ৳700',
      'category': 'Programming',
      'color': const Color(0xFFEEF2FF),
      'iconColor': const Color(0xFF4338CA),
    },
  ];

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ----------------------------------------------------------
  // BOTTOM NAVIGATION
  // ----------------------------------------------------------

  void _navigateTo(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OrdersScreen(),
        ),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      );
    }
  }

  // ----------------------------------------------------------
  // OPEN SERVICE DETAILS
  // ----------------------------------------------------------

  void _openServiceDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ServiceDetailsScreen(),
      ),
    );
  }

  // ----------------------------------------------------------
  // SELECT CATEGORY
  // ----------------------------------------------------------

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  // ----------------------------------------------------------
  // FILTER SERVICES
  // ----------------------------------------------------------

  List<Map<String, dynamic>> get _filteredServices {
    final String searchText =
    _searchController.text.trim().toLowerCase();

    return _services.where((service) {
      final String title =
      service['title'].toString().toLowerCase();

      final String provider =
      service['provider'].toString().toLowerCase();

      final String category =
      service['category'].toString().toLowerCase();

      final bool matchesSearch =
          searchText.isEmpty ||
              title.contains(searchText) ||
              provider.contains(searchText) ||
              category.contains(searchText);

      final bool matchesCategory =
          _selectedCategory == 'All' ||
              service['category'] == _selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  // ----------------------------------------------------------
  // BUILD
  // ----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> filteredServices =
        _filteredServices;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      // ------------------------------------------------------
      // APP BAR
      // ------------------------------------------------------

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: const Text(
          'Explore',
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      // ------------------------------------------------------
      // BODY
      // ------------------------------------------------------

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // ------------------------------------------------
            // SEARCH BAR
            // ------------------------------------------------

            Container(
              height: 52,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: TextField(
                controller: _searchController,

                decoration: InputDecoration(
                  hintText: 'Search services...',

                  hintStyle: const TextStyle(
                    color: Color(0xFF94A3B8),
                  ),

                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF64748B),
                  ),

                  suffixIcon:
                  _searchController.text.isNotEmpty
                      ? IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Color(0xFF64748B),
                    ),
                    onPressed: () {
                      _searchController.clear();
                    },
                  )
                      : null,

                  border: InputBorder.none,

                  contentPadding:
                  const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ------------------------------------------------
            // CATEGORIES
            // ------------------------------------------------

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  'Categories',

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF111827),
                  ),
                ),

                if (_selectedCategory != 'All')
                  TextButton(
                    onPressed: () {
                      _selectCategory('All');
                    },

                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        color: Color(0xFF4338CA),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 14),

            GridView.count(
              crossAxisCount: 2,

              shrinkWrap: true,

              physics:
              const NeverScrollableScrollPhysics(),

              crossAxisSpacing: 12,
              mainAxisSpacing: 12,

              childAspectRatio: 1.55,

              children: [
                _categoryCard(
                  icon: Icons.code,
                  title: 'Programming',
                  subtitle: '42 Services',
                  color: const Color(0xFFEEF2FF),
                  iconColor: const Color(0xFF4338CA),

                  selected:
                  _selectedCategory == 'Programming',

                  onTap: () {
                    _selectCategory('Programming');
                  },
                ),

                _categoryCard(
                  icon: Icons.design_services_outlined,
                  title: 'UI / Design',
                  subtitle: '35 Services',
                  color: const Color(0xFFFDF2F8),
                  iconColor: const Color(0xFFDB2777),

                  selected:
                  _selectedCategory == 'UI / Design',

                  onTap: () {
                    _selectCategory('UI / Design');
                  },
                ),

                _categoryCard(
                  icon: Icons.video_camera_back_outlined,
                  title: 'Video',
                  subtitle: '28 Services',
                  color: const Color(0xFFFFF7ED),
                  iconColor: const Color(0xFFEA580C),

                  selected:
                  _selectedCategory == 'Video',

                  onTap: () {
                    _selectCategory('Video');
                  },
                ),

                _categoryCard(
                  icon: Icons.menu_book_outlined,
                  title: 'Education',
                  subtitle: '31 Services',
                  color: const Color(0xFFECFDF5),
                  iconColor: const Color(0xFF059669),

                  selected:
                  _selectedCategory == 'Education',

                  onTap: () {
                    _selectCategory('Education');
                  },
                ),
              ],
            ),

            const SizedBox(height: 26),

            // ------------------------------------------------
            // POPULAR SERVICES
            // ------------------------------------------------

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  'Popular Services',

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF111827),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    _selectCategory('All');

                    if (_searchController.text.isNotEmpty) {
                      _searchController.clear();
                    }
                  },

                  child: const Text(
                    'See All',

                    style: TextStyle(
                      color: Color(0xFF4338CA),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // ------------------------------------------------
            // SERVICE RESULTS
            // ------------------------------------------------

            if (filteredServices.isEmpty)
              _emptyState()
            else
              ...filteredServices.map(
                    (service) => Padding(
                  padding:
                  const EdgeInsets.only(bottom: 12),

                  child: _serviceCard(
                    context,

                    icon: service['icon'],

                    title: service['title'],

                    provider: service['provider'],

                    rating: service['rating'],

                    price: service['price'],

                    color: service['color'],

                    iconColor: service['iconColor'],
                  ),
                ),
              ),

            const SizedBox(height: 8),
          ],
        ),
      ),

      // ------------------------------------------------------
      // BOTTOM NAVIGATION
      // ------------------------------------------------------

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,

        type: BottomNavigationBarType.fixed,

        selectedItemColor:
        const Color(0xFF4338CA),

        unselectedItemColor:
        const Color(0xFF94A3B8),

        onTap: (index) {
          _navigateTo(context, index);
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
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long),
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

  // ----------------------------------------------------------
  // CATEGORY CARD
  // ----------------------------------------------------------

  Widget _categoryCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
    required bool selected,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFF1F5FF)
              : Colors.white,

          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: selected
                ? const Color(0xFF4338CA)
                : Colors.transparent,

            width: selected ? 1.5 : 1,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,

              decoration: BoxDecoration(
                color: color,
                borderRadius:
                BorderRadius.circular(13),
              ),

              child: Icon(
                icon,
                color: iconColor,
                size: 23,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,

                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF64748B),
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

  // ----------------------------------------------------------
  // SERVICE CARD
  // ----------------------------------------------------------

  Widget _serviceCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String provider,
        required String rating,
        required String price,
        required Color color,
        required Color iconColor,
      }) {
    return GestureDetector(
      onTap: () {
        _openServiceDetails(context);
      },

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,

              decoration: BoxDecoration(
                color: color,
                borderRadius:
                BorderRadius.circular(15),
              ),

              child: Icon(
                icon,
                color: iconColor,
                size: 28,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    maxLines: 2,

                    overflow:
                    TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    provider,

                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF64748B),
                    ),
                  ),

                  const SizedBox(height: 7),

                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        size: 16,
                        color: Color(0xFFF59E0B),
                      ),

                      const SizedBox(width: 3),

                      Text(
                        rating,

                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF475569),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            Text(
              price,

              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Color(0xFF4338CA),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // EMPTY STATE
  // ----------------------------------------------------------

  Widget _emptyState() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 40,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),

      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,

            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius:
              BorderRadius.circular(16),
            ),

            child: const Icon(
              Icons.search_off_rounded,
              color: Color(0xFF64748B),
              size: 28,
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'No services found',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111827),
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Try another search or category.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}