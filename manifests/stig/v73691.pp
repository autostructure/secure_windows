# V-73691
# The LAN Manager authentication level must be set to send NTLMv2 response only and to refuse LM and NTLM.
class secure_windows::stig::v73691 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73691':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      value => 'LmCompatibilityLevel',
      type  => 'dword',
      data  => '0x00000005',
    }

  }

}
