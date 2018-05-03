# This class manages V-73247
# Local volumes must use a format that supports NTFS attributes.
class secure_windows::stig::v73247 (
  Boolean $enforced = false,
) {
  if !$facts['volume_filesystem'] {
    notify { 'Not in compliance with DoD STIG V-73247':
      message  => 'Not in compliance with DoD STIG V-73247. Local volumes use a filesystem format other than NTFS or ReFS',
      loglevel => warning,
    }
  }
}
