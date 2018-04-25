# Fake fact
#
Facter.add(:summary_stats) do
  confine operatingsystem: :windows

  setcode do
    {
      'vulnerabilities_enforced' => 252,
      'vulnerabilities_requiring_manual_intervention' => 10,
      'vulnerabilities_disabled_in_config_file' => 7,
      'errors' => 1,
      'total_vulnerabilities' => 270
    }
  end
end
