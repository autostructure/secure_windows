# V-73629
# Domain controllers must require LDAP access signing.
class secure_windows::stig::v73629 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73629':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NTDS\Parameters',
      value => 'LDAPServerIntegrity',
      type  => 'dword',
      data  => '0x00000002',
    }

  }

}
