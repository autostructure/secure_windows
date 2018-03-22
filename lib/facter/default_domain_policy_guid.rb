#
# This fact returns the default domain policy's guid
#
require 'facter'

Facter.add(:default_domain_policy_guid) do
  confine operatingsystem: :windows
  setcode do
    guid = Facter::Core::Execution.exec('Get-GPO -Name "Default Domain Policy"')
    guid
  end
end
