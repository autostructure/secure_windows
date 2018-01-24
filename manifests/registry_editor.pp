#
# This class uses a puppet forge module to make changes
# to the Windows Registry in support of DoD hardening.
#
# TODO:
# - Add unit testing
# - Consider adding custom warning log/sysout messages
#
class secure_windows::registry_editor {

  # V-73487
  registry::value { 'v73487':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI',
    value => 'EnumerateAdministrators',
    type  => 'dword',
    data  => '0x00000000',
  }



}
