import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auravest/src/presentation/providers/stock_providers.dart';
import 'package:auravest/src/presentation/widgets/stock_chart.dart';

class StockDetailScreen extends ConsumerStatefulWidget {
  final String symbol;
  const StockDetailScreen({Key? key, required this.symbol}) : super(key: key);

  @override
  ConsumerState<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends ConsumerState<StockDetailScreen> {
  // A state variable to store the currently selected model.
  late String _selectedModel;

  @override
  void initState() {
    super.initState();
    // Initialize the selected model with the first one from the notifier's list.
    // We use ref.read here because initState is called only once.
    _selectedModel = ref.read(stockDetailProvider(widget.symbol).notifier).availableModels.first;
  }

  @override
  Widget build(BuildContext context) {
    // Watch the StateNotifierProvider for state changes (loading, data, error).
    final state = ref.watch(stockDetailProvider(widget.symbol));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.symbol.toUpperCase()),
      ),
      body: state.when(
        // When data is successfully loaded, build the UI.
        data: (stockDetailState) => Column(
          children: [
            // --- Dropdown Menu for Model Selection ---
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: DropdownButtonFormField<String>(
                value: _selectedModel,
                decoration: const InputDecoration(
                  labelText: 'Select Prediction Model',
                  border: OutlineInputBorder(),
                ),
                // Build the dropdown items from the notifier's list of models.
                items: ref.read(stockDetailProvider(widget.symbol).notifier)
                    .availableModels
                    .map((model) => DropdownMenuItem(
                          value: model,
                          child: Text(model.replaceAll('_', ' ').toUpperCase()),
                        ))
                    .toList(),
                onChanged: (String? newModel) {
                  if (newModel != null) {
                    // Update the local state to show the new selection.
                    setState(() {
                      _selectedModel = newModel;
                    });
                    // Call the notifier to generate a new forecast with the selected model.
                    ref.read(stockDetailProvider(widget.symbol).notifier)
                        .generateForecast(newModel);
                  }
                },
              ),
            ),
            // Use an Expanded widget to make the chart fill the remaining screen space.
            Expanded(
              child: StockChart(
                data: stockDetailState.historicalData,
                // Pass the forecast data (which can be null) to the chart widget.
                forecastData: stockDetailState.forecast,
              ),
            ),
          ],
        ),
        // Show a loading indicator while data is being fetched.
        loading: () => const Center(child: CircularProgressIndicator()),
        // Show an error message if something goes wrong.
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Error: $err'),
          ),
        ),
      ),
    );
  }
}