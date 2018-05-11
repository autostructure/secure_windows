# This class manages V-3382
# The system must be configured to meet the minimum session security requirement for NTLM SSP-based clients.
class secure_windows::stig::v3382 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3382':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0',
      value => 'NTLMMinClientSec',
      type  => 'dword',
      data  => '537395200',
    }
  }
}
