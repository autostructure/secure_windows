# This class manages V-1081
# The ability to set access permissions and auditing is critical to maintaining the security and proper access
# controls of a system. To support this, local volumes must be formatted using a file system that supports NTFS attributes.
class secure_windows::stig::v1081 (
  Boolean $enforced = true,
) {
  if $enforced {
    if !$facts['volume_filesystem'] {
      notify { 'Not in compliance with DoD STIG V-1081':
        message  => 'Not in compliance with DoD STIG V-1081. Local volumes use a filesystem format other than NTFS or ReFS',
        loglevel => warning,
      }
    }
  }
}
