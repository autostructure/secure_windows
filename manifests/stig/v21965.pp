# This class manages V-21965
# Device driver searches using Windows Update must be prevented.
class secure_windows::stig::v21965 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21965':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Software\Policies\Microsoft\Windows\DriverSearching',
      value => 'SearchOrderConfig',
      type  => 'dword',
      data  => '0',
    }

  }

}
