import 'package:flutter/material.dart';
import 'package:auravest/src/presentation/screens/stock_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Step 1: Create a simple data class for our company list ---
class Company {
  final String name;
  final String symbol;
  final String countryCode; // e.g., 'US', 'IN'

  const Company({
    required this.name,
    required this.symbol,
    required this.countryCode,
  });
}

// --- Step 2: Convert to a StatefulWidget ---
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // --- Step 3: Define the list of popular companies ---
  final List<Company> _popularCompanies = const [
    // US Companies
    Company(name: 'Apple', symbol: 'AAPL', countryCode: 'US'),
    Company(name: 'Google', symbol: 'GOOGL', countryCode: 'US'),
    Company(name: 'Microsoft', symbol: 'MSFT', countryCode: 'US'),
    Company(name: 'Tesla', symbol: 'TSLA', countryCode: 'US'),
    // Indian Companies
    Company(name: 'Reliance Industries', symbol: 'RELIANCE.NS', countryCode: 'IN'),
    Company(name: 'Infosys', symbol: 'INFY.NS', countryCode: 'IN'),
    Company(name: 'Tata Consultancy', symbol: 'TCS.BO', countryCode: 'IN'),
    Company(name: 'HDFC Bank', symbol: 'HDFCBANK.BO', countryCode: 'IN'),
  ];

  // State variable to hold the selected company
  Company? _selectedCompany;
  final TextEditingController _symbolController = TextEditingController();

  // --- Step 4: Create a helper function to convert country code to flag emoji ---
  String countryCodeToEmoji(String countryCode) {
    // 0x1F1E6 is the regional indicator symbol letter A
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  void _navigateToDetailScreen(String symbol) {
    if (symbol.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => StockDetailScreen(symbol: symbol),
        ),
      );
    }
  }

@override
  Widget build(BuildContext context) {
    // Build the list of DropdownMenuItem widgets in a separate variable first.
    // This simplifies the code inside the widget tree and helps the Dart analyzer.
    final List<DropdownMenuItem<Company>> dropdownItems =
        _popularCompanies.map((Company company) {
      return DropdownMenuItem<Company>(
        value: company,
        child: Row(
          children: [
            Text(
              countryCodeToEmoji(company.countryCode),
              style: GoogleFonts.notoColorEmoji(
                fontSize: 24,
              ).copyWith(
                fontFamilyFallback: ['Apple Color Emoji', 'Segoe UI Emoji'],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(company.name)),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('AuraVest'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<Company>(
              value: _selectedCompany,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Select a Popular Company',
                border: OutlineInputBorder(),
              ),
              hint: const Text('Choose a company'),
              onChanged: (Company? newValue) {
                setState(() {
                  _selectedCompany = newValue;
                  // When a company is selected, update the text field as well
                  if (newValue != null) {
                    _symbolController.text = newValue.symbol;
                  }
                });
              },
              // Assign the pre-built list to the items property.
              items: dropdownItems,
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('OR', style: TextStyle(color: Colors.grey)),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _symbolController,
              decoration: const InputDecoration(
                labelText: 'Enter Custom Stock Symbol (e.g., INFY.NS)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // If user types, deselect the dropdown
                if (_selectedCompany != null) {
                  setState(() {
                    _selectedCompany = null;
                  });
                }
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              // The search button uses the text from the controller
              onPressed: () =>
                  _navigateToDetailScreen(_symbolController.text.trim()),
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}