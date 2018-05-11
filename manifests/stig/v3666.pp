# This class manages V-3666
# The system must be configured to meet the minimum session security requirement for NTLM SSP-based servers.
class secure_windows::stig::v3666 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3666':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0',
      value => 'NTLMMinServerSec',
      type  => 'dword',
      data  => '537395200',
    }
  }
}
