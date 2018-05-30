# This class manages V-21960
# Domain users must be required to elevate when setting a networks location.
class secure_windows::stig::v21960 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21960':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Network Connections',
      value => 'NC_StdDomainUserSetLocation',
      type  => 'dword',
      data  => '1',
    }

  }

}
