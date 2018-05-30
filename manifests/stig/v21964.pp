# This class manages V-21964
# Device metadata retrieval from the Internet must be prevented.
class secure_windows::stig::v21964 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21964':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Device Metadata',
      value => 'PreventDeviceMetadataFromNetwork',
      type  => 'dword',
      data  => '1',
    }

  }

}
