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
  late String _selectedModel;

  @override
  void initState() {
    super.initState();
    _selectedModel = ref.read(stockDetailProvider(widget.symbol).notifier).availableModels.first;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(stockDetailProvider(widget.symbol));
    
    // --- ADD THIS ROBUSTNESS CHECK ---
    // Get the currently available models for this specific symbol.
    final availableModels = ref.read(stockDetailProvider(widget.symbol).notifier).availableModels;
    // If the currently selected model is NOT in the new list, reset to the first one.
    if (!availableModels.contains(_selectedModel)) {
      _selectedModel = availableModels.first;
    }
    // --- END OF CHECK ---

return Scaffold(
      appBar: AppBar(
        title: Text(widget.symbol.toUpperCase()),
      ),
      // Use a switch statement on the state for clarity
      body: switch (state) {
        // When data is available, show the dropdown and chart
        AsyncData(:final value) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: DropdownButtonFormField<String>(
                value: _selectedModel,
                decoration: const InputDecoration(
                  labelText: 'Select Prediction Model',
                  border: OutlineInputBorder(),
                ),
                items: availableModels
                    .map((model) => DropdownMenuItem(
                          value: model,
                          child: Text(model.replaceAll('_', ' ').toUpperCase()),
                        ))
                    .toList(),
                onChanged: (String? newModel) {
                  if (newModel != null) {
                    setState(() { _selectedModel = newModel; });
                    ref.read(stockDetailProvider(widget.symbol).notifier)
                        .generateForecast(newModel);
                  }
                },
              ),
            ),
            Expanded(
              child: StockChart(
                data: value.historicalData,
                forecastData: value.forecast,
              ),
            ),
          ],
        ),
        // When an error occurs, display it clearly
        AsyncError(:final error) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Failed to load data:\n$error', textAlign: TextAlign.center),
          ),
        ),
        // By default (which is the loading state), show the progress indicator
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}