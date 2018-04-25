# Fake fact
#
Facter.add(:summary_report) do
  confine operatingsystem: :windows

  setcode do
    "STATISTIC                   COUNT  BAR GRAPH
Total Vulnerabilities         270  ###########################
Vulnerabilities Enforced      252  #########################
Require Manual Intervention    10  #
Disabled in Config File         7  #
Errors                          1  -"
  end
end
