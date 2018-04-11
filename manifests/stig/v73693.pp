# V-73693
# Windows Server 2016 must be configured to at least negotiate signing for LDAP client signing.
class secure_windows::stig::v73693 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73693':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LDAP',
      value => 'LDAPClientIntegrity',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
