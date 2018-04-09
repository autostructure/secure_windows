# Test specific resources for the developer.
#
class secure_windows::test4jeff {
  registry::value { 'v73223':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SeCEdit\Reg Values',
    value => 'MACHINE/System/CurrentControlSet/Services/Netlogon/Parameters/MaximumPasswordAge',
    type  => 'string',
    data  => '60',
  }
}
