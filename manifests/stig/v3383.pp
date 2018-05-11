# This class manages V-3383
# The system must be configured to use FIPS-compliant algorithms for encryption, hashing, and signing.
class secure_windows::stig::v3383 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3383':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy',
      value => 'Enabled',
      type  => 'dword',
      data  => '1',
    }
  }
}
