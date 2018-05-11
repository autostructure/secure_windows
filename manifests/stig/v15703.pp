# This class manages V-15703
# This setting prevents users from being prompted to search Windows Update for device drivers.
class secure_windows::stig::v15703 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15703':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DriverSearching',
      value => 'DontPromptForWindowsUpdate',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
