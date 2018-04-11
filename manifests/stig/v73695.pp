# V-73695
# Session security for NTLM SSP-based clients must be configured to require NTLMv2 session security and 128-bit encryption.
class secure_windows::stig::v73695 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73695':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
      value => 'NTLMMinClientSec',
      type  => 'dword',
      data  => '0x20080000',
    }

  }

}
