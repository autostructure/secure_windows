# This class manages V-36681
# Copying of user input methods to the system account for sign-in must be prevented.
class secure_windows::stig::v36681 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36681':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Control Panel\International',
      value => 'BlockUserInputMethodsForSignIn',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
