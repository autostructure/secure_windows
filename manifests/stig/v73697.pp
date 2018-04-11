# V-73697
# Session security for NTLM SSP-based servers must be configured to require NTLMv2 session security and 128-bit encryption.
class secure_windows::stig::v73697 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73697':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
      value => 'NTLMMinServerSec',
      type  => 'dword',
      data  => '0x20080000',
    }

  }

}
