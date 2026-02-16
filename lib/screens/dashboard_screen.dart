import 'package:flutter/material.dart';
import '../models/policy_model.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/summary_card.dart';
import '../widgets/category_filter.dart';
import '../widgets/policy_card.dart';

/// Main dashboard screen displaying insurance policies and summary
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PolicyCategory _selectedCategory = PolicyCategory.all;
  final List<Policy> _allPolicies = PolicyData.getSamplePolicies();

  /// Get filtered policies based on selected category
  List<Policy> get _filteredPolicies {
    if (_selectedCategory == PolicyCategory.all) {
      return _allPolicies;
    }
    return _allPolicies
        .where((policy) => policy.category == _selectedCategory)
        .toList();
  }

  /// Calculate total annual premium
  double get _totalAnnualPremium {
    return _allPolicies.fold(0, (sum, policy) => sum + policy.annualPremium);
  }

  /// Calculate total coverage
  double get _totalCoverage {
    return _allPolicies.fold(0, (sum, policy) => sum + policy.sumInsured);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundGrey,
      appBar: const CustomAppBar(
        customerName: 'Customer Name',
        customerId: 'HDFC000000',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppTheme.spacing24),
              
              // Welcome text
              Text(
                'Welcome Back, Customer!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: AppTheme.spacing24),
              
              // Summary cards row (horizontally scrollable)
              _buildSummaryCardsRow(),
              const SizedBox(height: AppTheme.spacing24),
              
              // Category filter buttons
              CategoryFilter(
                selectedCategory: _selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
              const SizedBox(height: AppTheme.spacing24),
              
              // Policy cards grid
              _buildPolicyGrid(),
              const SizedBox(height: AppTheme.spacing24),
            ],
          ),
        ),
      ),
    );
  }

  /// Build horizontally scrollable summary cards
  Widget _buildSummaryCardsRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SummaryCard(
            icon: Icons.description_outlined,
            title: 'Total Policies',
            value: '${_allPolicies.length}',
          ),
          const SizedBox(width: AppTheme.spacing16),
          SummaryCard(
            icon: Icons.currency_rupee,
            title: 'Annual Premium',
            value: '₹ ${_formatAmount(_totalAnnualPremium)}',
            subtitle: 'Across all Policies',
          ),
          const SizedBox(width: AppTheme.spacing16),
          SummaryCard(
            icon: Icons.shield_outlined,
            title: 'Total Coverage',
            value: '₹ ${_formatAmount(_totalCoverage)}',
            subtitle: 'Sum assured amount',
          ),
          const SizedBox(width: AppTheme.spacing16),
          SummaryCard(
            icon: Icons.dashboard_outlined,
            title: 'Dashboard',
            value: '',
            subtitle: 'Coverage Insights',
          ),
        ],
      ),
    );
  }

  /// Build 2-column responsive grid of policy cards
  Widget _buildPolicyGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate number of columns based on screen width
        final crossAxisCount = constraints.maxWidth > 800 ? 3 : 2;
        final spacing = AppTheme.spacing16;
        
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: 0.85,
          ),
          itemCount: _filteredPolicies.length,
          itemBuilder: (context, index) {
            return PolicyCard(policy: _filteredPolicies[index]);
          },
        );
      },
    );
  }

  /// Format large amounts with commas
  String _formatAmount(double amount) {
    if (amount >= 10000000) {
      return '${(amount / 10000000).toStringAsFixed(1)} Cr';
    } else if (amount >= 100000) {
      return '${(amount / 100000).toStringAsFixed(1)} L';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(0)}K';
    }
    return amount.toStringAsFixed(0);
  }
}
