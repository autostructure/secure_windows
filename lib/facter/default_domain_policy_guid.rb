#
# This fact returns the default domain policy's guid
#
require 'facter'

Facter.add(:default_domain_policy_guid) do
  confine operatingsystem: :windows
  setcode do
    Facter::Core::Execution.exec("powershell.exe -Command \"Get-GPO -Name \"Default Domain Policy\" | Select id\"")
  end
end
