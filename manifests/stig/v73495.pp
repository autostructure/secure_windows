# V-73495
# Local administrator accounts must have their privileged token filtered to prevent
# elevated privileges from being used over the network on domain systems.
class secure_windows::stig::v73495 (
  Boolean $enforced = false,
) {

  if $enforced {
    if($facts['windows_type'] =~ /(1|3)/) {
      # This policy setting requires the installation of the SecGuide custom templates
      # included with the STIG package. "SecGuide.admx" and " SecGuide.adml"
      # must be copied to the \Windows\PolicyDefinitions and
      # \Windows\PolicyDefinitions\en-US directories respectively.

      include ::secure_windows::administrative_template_secguide_installer

      registry::value { 'v73495':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
        value => 'LocalAccountTokenFilterPolicy',
        type  => 'dword',
        data  => '0x00000000',
      }
    }
  }

}
