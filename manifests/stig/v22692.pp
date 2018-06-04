# This class manages V-22692
# The default Autorun behavior must be configured to prevent Autorun commands.
class secure_windows::stig::v22692 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoAutorun':
      ensure => present,
      type   => 'dword',
      data   => '0x00000001',
      }
    }
  }
