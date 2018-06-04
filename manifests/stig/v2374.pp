# This class manages V-2374
# Autoplay must be disabled for all drivers
class secure_windows::stig::v2374 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v2374':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer',
      value => 'NoDriveTypeAutoRun',
      type  => 'dword',
      data  => '0x000000ff',
    }

  }

}
