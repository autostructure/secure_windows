# V-73497
# WDigest Authentication must be disabled.
class secure_windows::stig::v73497 (
  Boolean $enforced = false,
) {

  if $enforced {

    # This policy setting requires the installation of the SecGuide custom templates
    # included with the STIG package. "SecGuide.admx" and " SecGuide.adml"
    # must be copied to the \Windows\PolicyDefinitions and
    # \Windows\PolicyDefinitions\en-US directories respectively.

    include ::secure_windows::administrative_template_secguide_installer

    registry::value { 'v73497':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest',
      value => 'UseLogonCredential',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
