# V-73727
# Zone information must be preserved when saving attachments.
class secure_windows::stig::v73727 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73727':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments',
      value => 'SaveZoneInformation',
      type  => 'dword',
      data  => '0x00000002',
    }

  }

}
