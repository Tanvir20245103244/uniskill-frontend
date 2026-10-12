import 'package:flutter/material.dart';

import 'order_confirmation_screen.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key});

  @override
  State<ServiceDetailsScreen> createState() =>
      _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState
    extends State<ServiceDetailsScreen> {
  bool _isFavorite = false;

  // ----------------------------------------------------------
  // REQUEST SERVICE
  // ----------------------------------------------------------

  void _requestService() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
        const OrderConfirmationScreen(),
      ),
    );
  }

  // ----------------------------------------------------------
  // SHARE SERVICE
  // ----------------------------------------------------------

  void _shareService() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Service sharing will be connected later.',
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // ----------------------------------------------------------
  // TOGGLE FAVORITE
  // ----------------------------------------------------------

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite
              ? 'Service saved to favorites'
              : 'Service removed from favorites',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // ----------------------------------------------------------
  // BUILD
  // ----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      // ------------------------------------------------------
      // APP BAR
      // ------------------------------------------------------

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF111827),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Service Details',
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.w800,
          ),
        ),

        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(
              _isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: _isFavorite
                  ? const Color(0xFFF43F5E)
                  : const Color(0xFF64748B),
            ),
          ),

          IconButton(
            onPressed: _shareService,
            icon: const Icon(
              Icons.share_outlined,
              color: Color(0xFF64748B),
            ),
          ),

          const SizedBox(width: 4),
        ],
      ),

      // ------------------------------------------------------
      // BODY
      // ------------------------------------------------------

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            // ------------------------------------------------
            // SERVICE HEADER
            // ------------------------------------------------

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Container(
                        width: 64,
                        height: 64,

                        decoration: BoxDecoration(
                          color:
                          const Color(0xFFECFDF5),
                          borderRadius:
                          BorderRadius.circular(16),
                        ),

                        child: const Icon(
                          Icons.code_rounded,
                          color:
                          Color(0xFF059669),
                          size: 32,
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Python Programming Help',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight:
                                FontWeight.w800,
                                color:
                                Color(0xFF111827),
                              ),
                            ),

                            const SizedBox(height: 7),

                            Container(
                              padding:
                              const EdgeInsets
                                  .symmetric(
                                horizontal: 9,
                                vertical: 5,
                              ),

                              decoration: BoxDecoration(
                                color:
                                const Color(
                                    0xFFEEF2FF),
                                borderRadius:
                                BorderRadius
                                    .circular(8),
                              ),

                              child: const Text(
                                'Programming',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight:
                                  FontWeight.w700,
                                  color:
                                  Color(0xFF4338CA),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Rating

                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color:
                        Color(0xFFF59E0B),
                        size: 21,
                      ),

                      const SizedBox(width: 5),

                      const Text(
                        '4.9',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                          FontWeight.w800,
                          color:
                          Color(0xFF111827),
                        ),
                      ),

                      const SizedBox(width: 6),

                      const Text(
                        '(24 reviews)',
                        style: TextStyle(
                          fontSize: 11,
                          color:
                          Color(0xFF64748B),
                        ),
                      ),

                      const Spacer(),

                      const Text(
                        '৳500',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                          FontWeight.w900,
                          color:
                          Color(0xFF4338CA),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // ------------------------------------------------
            // SERVICE PROVIDER
            // ------------------------------------------------

            const Text(
              'Service Provider',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(18),

                border: Border.all(
                  color:
                  const Color(0xFFE2E8F0),
                ),
              ),

              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,

                    decoration: BoxDecoration(
                      color:
                      const Color(0xFFEEF2FF),
                      borderRadius:
                      BorderRadius.circular(15),
                    ),

                    child: const Center(
                      child: Text(
                        'RA',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                          FontWeight.w900,
                          color:
                          Color(0xFF4338CA),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 13),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Rahim Ahmed',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight:
                                FontWeight.w800,
                                color:
                                Color(0xFF111827),
                              ),
                            ),

                            SizedBox(width: 6),

                            Icon(
                              Icons.verified_rounded,
                              size: 16,
                              color:
                              Color(0xFF2563EB),
                            ),
                          ],
                        ),

                        SizedBox(height: 5),

                        Text(
                          'CSE Student',
                          style: TextStyle(
                            fontSize: 11,
                            color:
                            Color(0xFF64748B),
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'University Verified',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight:
                            FontWeight.w700,
                            color:
                            Color(0xFF059669),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7,
                    ),

                    decoration: BoxDecoration(
                      color:
                      const Color(0xFFF8FAFC),
                      borderRadius:
                      BorderRadius.circular(10),
                    ),

                    child: const Text(
                      'View Profile',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight:
                        FontWeight.w700,
                        color:
                        Color(0xFF4338CA),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ------------------------------------------------
            // DESCRIPTION
            // ------------------------------------------------

            const Text(
              'About This Service',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(18),

                border: Border.all(
                  color:
                  const Color(0xFFE2E8F0),
                ),
              ),

              child: const Text(
                'Need help with Python programming? '
                    'I can help you understand Python concepts, '
                    'debug your code, build small projects, '
                    'and explain programming problems clearly. '
                    'Perfect for university students who need '
                    'guidance with their programming work.',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.6,
                  color: Color(0xFF475569),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ------------------------------------------------
            // FEATURES
            // ------------------------------------------------

            const Text(
              'What You Will Get',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 12),

            _featureItem(
              icon: Icons.code_rounded,
              text: 'Python programming guidance',
            ),

            _featureItem(
              icon: Icons.bug_report_outlined,
              text: 'Code debugging and error fixing',
            ),

            _featureItem(
              icon: Icons.school_outlined,
              text: 'University-level programming support',
            ),

            _featureItem(
              icon: Icons.chat_outlined,
              text: 'Direct communication with provider',
            ),

            const SizedBox(height: 24),

            // ------------------------------------------------
            // SERVICE INFORMATION
            // ------------------------------------------------

            const Text(
              'Service Information',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(18),

                border: Border.all(
                  color:
                  const Color(0xFFE2E8F0),
                ),
              ),

              child: Column(
                children: [
                  _infoRow(
                    icon:
                    Icons.payments_outlined,
                    title: 'Starting Price',
                    value: '৳500',
                  ),

                  const Divider(
                    height: 24,
                    color:
                    Color(0xFFE2E8F0),
                  ),

                  _infoRow(
                    icon:
                    Icons.schedule_outlined,
                    title: 'Delivery Time',
                    value: 'Within 2 days',
                  ),

                  const Divider(
                    height: 24,
                    color:
                    Color(0xFFE2E8F0),
                  ),

                  _infoRow(
                    icon:
                    Icons.category_outlined,
                    title: 'Category',
                    value: 'Programming',
                  ),

                  const Divider(
                    height: 24,
                    color:
                    Color(0xFFE2E8F0),
                  ),

                  _infoRow(
                    icon:
                    Icons.verified_outlined,
                    title: 'Provider Status',
                    value: 'Verified',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ------------------------------------------------
            // REVIEWS
            // ------------------------------------------------

            const Text(
              'Recent Reviews',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 12),

            _reviewCard(
              name: 'Arif Hossain',
              rating: '5.0',
              review:
              'Very helpful and explained the Python concepts clearly.',
              date: '2 days ago',
            ),

            const SizedBox(height: 10),

            _reviewCard(
              name: 'Mahin Rahman',
              rating: '4.8',
              review:
              'Good service and quick response. Highly recommended.',
              date: '1 week ago',
            ),

            const SizedBox(height: 110),
          ],
        ),
      ),

      // ------------------------------------------------------
      // REQUEST BUTTON
      // ------------------------------------------------------

      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(
          20,
          10,
          20,
          14,
        ),

        child: SizedBox(
          height: 56,

          child: ElevatedButton(
            onPressed: _requestService,

            style: ElevatedButton.styleFrom(
              backgroundColor:
              const Color(0xFF4338CA),

              foregroundColor: Colors.white,

              elevation: 0,

              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(16),
              ),
            ),

            child: const Text(
              'Request This Service',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // FEATURE ITEM
  // ----------------------------------------------------------

  Widget _featureItem({
    required IconData icon,
    required String text,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),

      padding: const EdgeInsets.all(13),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(14),

        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),

      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,

            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius:
              BorderRadius.circular(10),
            ),

            child: Icon(
              icon,
              size: 19,
              color: const Color(0xFF4338CA),
            ),
          ),

          const SizedBox(width: 11),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF475569),
              ),
            ),
          ),

          const Icon(
            Icons.check_circle_rounded,
            size: 18,
            color: Color(0xFF10B981),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // INFO ROW
  // ----------------------------------------------------------

  Widget _infoRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 19,
          color: const Color(0xFF64748B),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
            ),
          ),
        ),

        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111827),
          ),
        ),
      ],
    );
  }

  // ----------------------------------------------------------
  // REVIEW CARD
  // ----------------------------------------------------------

  Widget _reviewCard({
    required String name,
    required String rating,
    required String review,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(16),

        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,

                decoration: BoxDecoration(
                  color:
                  const Color(0xFFF1F5F9),
                  borderRadius:
                  BorderRadius.circular(11),
                ),

                child: Center(
                  child: Text(
                    name.substring(0, 1),
                    style: const TextStyle(
                      fontWeight:
                      FontWeight.w800,
                      color:
                      Color(0xFF4338CA),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight:
                        FontWeight.w800,
                        color:
                        Color(0xFF111827),
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 9,
                        color:
                        Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.star_rounded,
                size: 17,
                color: Color(0xFFF59E0B),
              ),

              const SizedBox(width: 3),

              Text(
                rating,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight:
                  FontWeight.w700,
                  color:
                  Color(0xFF475569),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            review,
            style: const TextStyle(
              fontSize: 11,
              height: 1.5,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}