import 'package:flutter/material.dart';

class CreditRepairPage extends StatefulWidget {
  final VoidCallback onBookPackage;

  const CreditRepairPage({super.key, required this.onBookPackage});

  @override
  State<CreditRepairPage> createState() => _CreditRepairPageState();
}

class _CreditRepairPageState extends State<CreditRepairPage> {
  final ScrollController _imageScrollController = ScrollController();
  final GlobalKey _packageKey = GlobalKey();

  void _scrollGallery(bool isRight) {
    final offset = isRight ? 200.0 : -200.0;
    _imageScrollController.animateTo(
      _imageScrollController.offset + offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Repair'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Welcome to Credit Repair Services!",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // INDUSTRY SECRETS SECTION
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Center(
                    child: Text(
                      "YOU'LL GET THE\nINDUSTRY CREDIT SECRETS",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      "NO ONE TALKS ABOUT:",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  BulletPoint(
                      text:
                          "The hidden negatives on your account that are ruining your scores."),
                  BulletPoint(
                      text:
                          "The step-by-step 3FJ system to \"hack\" your profile and increase your scores by hundreds of points."),
                  BulletPoint(
                      text:
                          "How to get your first win in as little as 24 hours."),
                  BulletPoint(
                      text:
                          "How to leverage your credit to get approved for \$100,000+ \"invite-only\" credit lines at 0% interest."),
                  BulletPoint(
                      text:
                          "Little-known online sources that will never deny you for a loan."),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // BOOK PACKAGE BUTTON (top)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ElevatedButton(
                onPressed: widget.onBookPackage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Book Your Package',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // TESTIMONIAL SECTION
            const Text(
              "DON'T TAKE OUR WORD FOR IT",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "These people and thousands of others started\nwith this FREE credit consultation.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "Will you be next?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),

            // GALLERY SLIDER
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  ListView.builder(
                    controller: _imageScrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: InteractiveViewer(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          'assets/images/img${index + 1}.jpeg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/img${index + 1}.jpeg',
                                width: 160,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // Slide Left
                  Positioned(
                    left: 0,
                    top: 80,
                    child: GestureDetector(
                      onTap: () => _scrollGallery(false),
                      child: const CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                    ),
                  ),

                  // Slide Right
                  Positioned(
                    right: 0,
                    top: 80,
                    child: GestureDetector(
                      onTap: () => _scrollGallery(true),
                      child: const CircleAvatar(
                        backgroundColor: Colors.black54,
                        child:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // FINAL CTA
            const Text(
              "CLAIM YOUR FREE\nCREDIT IMPROVEMENT CONSULTATION",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "This will be a 100% custom strategy tailored to your current situation.\n\nNo generic advice allowed.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "Don't worry, we won’t pull your credit and your answers are 100% confidential.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // BOOK PACKAGE BUTTON (bottom)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ElevatedButton(
                onPressed: widget.onBookPackage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Book Your Package',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Placeholder target box (optional visual cue)
            Container(
              key: _packageKey,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "Package Section\n(Scroll target here)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16, color: Colors.white)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
