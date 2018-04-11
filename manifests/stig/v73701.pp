# V-73701
# Windows Server 2016 must be configured to use FIPS-compliant algorithms for encryption, hashing, and signing.
class secure_windows::stig::v73701 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73701':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy',
      value => 'Enabled',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
