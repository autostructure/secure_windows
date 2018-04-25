# Custom fact displaying the state of Microsoft Defender Credential Guard property:
# RequiredSecurityProperties
#
Facter.add(:summary_stats) do
  confine operatingsystem: :windows

  setcode do
    "Module Summary:
------------------------------------------------------
252 Vulnerabilities Enforced
 10 Vulnerabilities Requiring Manual Intevention
  7 Vulnerabilities Disabled in Configuration File
  1 Error(s)
======================================================
270 Total Vulnerabilities"
  end
end
