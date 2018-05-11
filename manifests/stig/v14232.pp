#This class manages V-14232
#IPSec Exemptions must be limited
class secure_windows::stig::v14232 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v14232':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\IPSEC',
      value => 'NoDefaultExempt',
      type  => 'dword',
      data  => '3',
    }

  }

}
