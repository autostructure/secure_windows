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

  registry::value { 'v73493':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization',
    value => 'NoLockScreenSlideshow',
    type  => 'dword',
    data  => '0x00000001',
  }

  ::secure_windows::log {'logmsg1':
    message => 'test message1.',
  }

  registry::value { 'v73495':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'LocalAccountTokenFilterPolicy',
    type  => 'dword',
    data  => '0x00000000',
  }

  ::secure_windows::log {'logmsg1':
    message => 'test message1.',
  }

}
