# V-73577
# Attachments must be prevented from being downloaded from RSS feeds.
class secure_windows::stig::v73577 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73577':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds',
      value => 'DisableEnclosureDownload',
      type  => 'dword',
      data  => '0x00000001',
    }

}
