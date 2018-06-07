# This class manages V-36684
# Local users on domain-joined computers must not be enumerated.
class secure_windows::stig::v36684 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System\EnumerateLocalUsers':
      ensure => present,
      type   => 'dword',
      data   => '0',
    }
  }
}
