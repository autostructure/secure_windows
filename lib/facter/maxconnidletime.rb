# This fact returns the MaxConnIdleTime for DCs
require 'facter'
Facter.add('maxconnidletime') do
  confine operatingsystem: :windows
  setcode do
    $time = Facter::Core::Execution.execute("dsquery * \"cn=Default Query Policy,cn=Query-Policies,cn=Directory Service,cn=Windows NT,cn=Services,cn=Configuration,dc=example,dc=com\" -attr LDAPAdminLimits")
    $time.match(/MaxConnIdleTime=(\d*)/)[1]
  end
end
