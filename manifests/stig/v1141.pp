#This class manages V-1141
#Unencrypted passwords must not be sent to third-party SMB Servers.
class secure_windows::stig::v1141 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1141':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
      value => 'EnablePlainTextPassword',
      type  => 'dword',
      data  => '0x00000000',
    }

  }
}
