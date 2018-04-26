# This class manages:
# V-73317
# The maximum password age must be configured to 60 days or less.
class secure_windows::stig::v73317 (
  Boolean $enforced = false,
) {
  if $enforced {
    local_security_policy { 'Maximum password age':
      ensure         => 'present',
      policy_setting => 'MaximumPasswordAge',
      policy_type    => 'System Access',
      policy_value   => '60',
    }

    # also covers v73223
    $::secure_windows::statistics_vulnerabilities_enforced = $::secure_windows::statistics_vulnerabilities_enforced + 1
    $::secure_windows::statistics_vulnerabilities_enforced = $::secure_windows::statistics_vulnerabilities_enforced + 1

  } else {
    # also covers v73223
    $::secure_windows::statistics_vulnerabilities_disabled = $::secure_windows::statistics_vulnerabilities_disabled + 1
    $::secure_windows::statistics_vulnerabilities_disabled = $::secure_windows::statistics_vulnerabilities_disabled + 1
  }
}
