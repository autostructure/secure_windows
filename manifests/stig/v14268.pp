#This class manages V-14268
#Zone information must be preserved when saving attachments
class secure_windows::stig::v14268 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry_value { 'HKEY_USERS\S-1-5-21\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments\SaveZoneInformation':
      ensure => present,
      type   => 'dword',
      data   => '2',
      }

  }

}
