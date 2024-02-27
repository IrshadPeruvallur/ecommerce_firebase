import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQPage extends StatelessWidget {
  FAQPage({Key? key}) : super(key: key);

  // Data for FAQ items
  final List<Map<String, String>> faqList = [
    {
      'question': 'How do I create an account?',
      'answer': 'To create an account, click on the "Sign Up" button...'
    },
    {
      'question': 'How do I add a product to my wishlist?',
      'answer': 'To add a product to your wishlist, navigate to the product...'
    },
    {
      'question': 'How do I mark my product as sold?',
      'answer': 'To mark your product as sold, go to your active listings...'
    },
    {
      'question': 'How do I contact the seller?',
      'answer': 'To contact the seller, click on the "Contact Seller" button...'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 20),
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Build FAQ items dynamically from the provided data
          for (var faqItem in faqList)
            FAQItem(
              question: faqItem['question']!,
              answer: faqItem['answer']!,
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      textColor: const Color.fromARGB(255, 37, 157, 192),
      title: Text(
        question,
        style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
