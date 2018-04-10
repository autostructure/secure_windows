# V-73549
# AutoPlay must be disabled for all drives.
class secure_windows::stig::v73549 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73549':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer',
      value => 'NoDriveTypeAutoRun',
      type  => 'dword',
      data  => '0x000000ff',
    }

}
