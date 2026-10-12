import 'package:flutter/material.dart';

import 'orders_screen.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({super.key});

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState
    extends State<OrderConfirmationScreen> {
  final TextEditingController _messageController =
  TextEditingController();

  bool _isSending = false;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  // ----------------------------------------------------------
  // SEND REQUEST
  // ----------------------------------------------------------

  void _sendRequest() {
    if (_isSending) return;

    setState(() {
      _isSending = true;
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;

      setState(() {
        _isSending = false;
      });

      _showSuccessDialog();
    });
  }

  // ----------------------------------------------------------
  // SUCCESS DIALOG
  // ----------------------------------------------------------

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF10B981),
                size: 28,
              ),
              SizedBox(width: 10),
              Text(
                'Request Sent!',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),
          content: const Text(
            'Your service request has been submitted successfully.',
            style: TextStyle(
              color: Color(0xFF64748B),
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'Done',
                style: TextStyle(
                  color: Color(0xFF4338CA),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const OrdersScreen(),
                  ),
                      (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4338CA),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'View My Orders',
              ),
            ),
          ],
        );
      },
    );
  }

  // ----------------------------------------------------------
  // BUILD
  // ----------------------------------------------------------

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
            color: Color(0xFF111827),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Confirm Your Request',
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------------------------------------
            // SERVICE SUMMARY
            // ------------------------------------------------

            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),

                boxShadow: [
                  BoxShadow(
                    color:
                    Colors.black.withValues(alpha: 0.04),
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
                        width: 54,
                        height: 54,

                        decoration: BoxDecoration(
                          color: const Color(0xFFECFDF5),
                          borderRadius:
                          BorderRadius.circular(15),
                        ),

                        child: const Icon(
                          Icons.code_rounded,
                          color: Color(0xFF059669),
                          size: 27,
                        ),
                      ),

                      const SizedBox(width: 14),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Python Programming Help',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color:
                                Color(0xFF111827),
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Rahim Ahmed',
                              style: TextStyle(
                                fontSize: 11,
                                color:
                                Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Divider(
                    color: Color(0xFFE2E8F0),
                  ),

                  const SizedBox(height: 14),

                  _infoRow(
                    icon: Icons.payments_outlined,
                    title: 'Price',
                    value: '৳500',
                  ),

                  const SizedBox(height: 12),

                  _infoRow(
                    icon: Icons.schedule_outlined,
                    title: 'Delivery',
                    value: 'Within 2 days',
                  ),

                  const SizedBox(height: 12),

                  _infoRow(
                    icon: Icons.chat_bubble_outline_rounded,
                    title: 'Communication',
                    value: 'UniSkill Chat',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ------------------------------------------------
            // MESSAGE
            // ------------------------------------------------

            const Text(
              'Message to Service Provider',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _messageController,
              maxLines: 5,

              decoration: InputDecoration(
                hintText:
                'Tell the service provider what you need...',

                hintStyle: const TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 12,
                ),

                filled: true,
                fillColor: Colors.white,

                contentPadding:
                const EdgeInsets.all(16),

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFE2E8F0),
                  ),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFE2E8F0),
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFF4338CA),
                    width: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ------------------------------------------------
            // DEMO INFORMATION
            // ------------------------------------------------

            Container(
              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(14),
              ),

              child: const Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Color(0xFF4338CA),
                    size: 20,
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      'This is a frontend demonstration. '
                          'Your request will be connected to '
                          'the UniSkill backend later.',
                      style: TextStyle(
                        fontSize: 11,
                        height: 1.5,
                        color: Color(0xFF4338CA),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ------------------------------------------------
            // SEND BUTTON
            // ------------------------------------------------

            SizedBox(
              width: double.infinity,
              height: 56,

              child: ElevatedButton(
                onPressed:
                _isSending ? null : _sendRequest,

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xFF4338CA),
                  foregroundColor: Colors.white,

                  disabledBackgroundColor:
                  const Color(0xFF94A3B8),

                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(16),
                  ),
                ),

                child: _isSending
                    ? const SizedBox(
                  width: 22,
                  height: 22,
                  child:
                  CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
                    : const Text(
                  'Send Service Request',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
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
}