# This class manages V-21954
# The use of DES encryption suites must not be allowed for Kerberos encryption.
class secure_windows::stig::v21954 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21954':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters',
      value => 'SupportedEncryptionTypes',
      type  => 'dword',
      data  => '0x7ffffff8',
    }

  }

}
