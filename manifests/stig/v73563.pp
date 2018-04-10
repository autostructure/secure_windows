# V-73563
# Turning off File Explorer heap termination on corruption must be disabled.
class secure_windows::stig::v73563 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73563':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer',
      value => 'NoHeapTerminationOnCorruption',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
