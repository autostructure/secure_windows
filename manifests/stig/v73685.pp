# V-73685
# Kerberos encryption types must be configured to prevent the use of DES and RC4 encryption suites.
class secure_windows::stig::v73685 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73685':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters',
      value => 'SupportedEncryptionTypes',
      type  => 'dword',
      data  => '0x7ffffff8',
    }

  }

}
