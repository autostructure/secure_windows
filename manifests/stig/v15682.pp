# This class manages V-15682
# This setting will prevent attachments from being downloaded from RSS feeds.
class secure_windows::stig::v15682 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15682':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Feeds',
      value => 'DisableEnclosureDownload',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
