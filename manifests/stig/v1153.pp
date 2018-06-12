# This class manages V-1153
# The LanMan authentication level must be set to send NTLMv2 response only, and to refuse LM and NTLM

class secure_windows::stig::v1153 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1153':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa',
      value => 'LmCompatibilityLevel',
      type  => 'dword',
      data  => '5',
    }
  }
}
