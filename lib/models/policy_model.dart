/// Policy model representing insurance policy data
class Policy {
  final String id;
  final String name;
  final String policyId;
  final String description;
  final PolicyStatus status;
  final double annualPremium;
  final double sumInsured;
  final PolicyCategory category;

  Policy({
    required this.id,
    required this.name,
    required this.policyId,
    required this.description,
    required this.status,
    required this.annualPremium,
    required this.sumInsured,
    required this.category,
  });
}

/// Policy status enum
enum PolicyStatus {
  active,
  due,
}

/// Policy category enum
enum PolicyCategory {
  all,
  life,
  health,
  others,
}

/// Extension to get display text for category
extension PolicyCategoryExtension on PolicyCategory {
  String get displayName {
    switch (this) {
      case PolicyCategory.all:
        return 'All Policies';
      case PolicyCategory.life:
        return 'Life Insurance';
      case PolicyCategory.health:
        return 'Health Insurance';
      case PolicyCategory.others:
        return 'Others';
    }
  }
}

/// Sample policy data for demonstration
class PolicyData {
  static List<Policy> getSamplePolicies() {
    return [
      Policy(
        id: '1',
        name: 'HDFC Health Suraksha',
        policyId: 'HS-2025-189799',
        description: 'Health coverage for the family',
        status: PolicyStatus.active,
        annualPremium: 40000,
        sumInsured: 40000,
        category: PolicyCategory.health,
      ),
      Policy(
        id: '2',
        name: 'HDFC Life Protect',
        policyId: 'HS-2025-189799',
        description: 'Health coverage for the family',
        status: PolicyStatus.due,
        annualPremium: 20000,
        sumInsured: 2000000,
        category: PolicyCategory.life,
      ),
      Policy(
        id: '3',
        name: 'HDFC Life Sanchay Plus',
        policyId: 'HS-2025-189799',
        description: 'Health coverage for the family',
        status: PolicyStatus.active,
        annualPremium: 10000,
        sumInsured: 1000000,
        category: PolicyCategory.life,
      ),
      Policy(
        id: '4',
        name: 'HDFC Health Suraksha',
        policyId: 'HS-2025-189799',
        description: 'Health coverage for the family',
        status: PolicyStatus.active,
        annualPremium: 40000,
        sumInsured: 40000,
        category: PolicyCategory.health,
      ),
      Policy(
        id: '5',
        name: 'HDFC Life Protect',
        policyId: 'HS-2025-189799',
        description: 'Health coverage for the family',
        status: PolicyStatus.due,
        annualPremium: 20000,
        sumInsured: 2000000,
        category: PolicyCategory.life,
      ),
      Policy(
        id: '6',
        name: 'HDFC Life Sanchay Plus',
        policyId: 'HS-2025-189799',
        description: 'Health coverage for the family',
        status: PolicyStatus.active,
        annualPremium: 10000,
        sumInsured: 1000000,
        category: PolicyCategory.life,
      ),
    ];
  }
}
