# This class manages V-36439
# Local administrator accounts must have their privileged token filtered to prevent elevated privileges
# from being used over the network on domain systems.
class secure_windows::stig::v36439 (
  Boolean $enforced = true,
) {
  if $enforced {
    if($facts['windows_type'] =~ /(1|3)/) {

      include ::secure_windows::administrative_template_secguide_installer

      registry::value { 'v36439':
        key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
        value => 'LocalAccountTokenFilterPolicy',
        type  => 'dword',
        data  => '0x00000000',
      }
    }
  }
}
