# This class manages V-15718
# Legacy plug-in applications may continue to function when a File Explorer session has become corrupt.
# Disabling this feature will prevent this.
class secure_windows::stig::v15718 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer\NoHeapTerminationOnCorruption':
      ensure => present,
      type   => 'dword',
      data   => '0',
      }
    }
  }
