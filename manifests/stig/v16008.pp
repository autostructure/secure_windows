#This class manages V-16008
#Windows must elevate all applications in User Account Control, not just signed ones.
class secure_windows::stig::v16008 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v16008':
      key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'ValidateAdminCodeSignatures',
      type  => 'dword',
      data  => '0',
    }

  }

}
