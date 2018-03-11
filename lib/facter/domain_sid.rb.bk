Facter.add(:domain_sid) do
  confine kernel: :windows

  setcode do
    require 'win32/registry'

    value = nil

    hive = Win32::Registry::HKEY_LOCAL_MACHINE
    hive.open('SOFTWARE\Microsoft\Windows\CurrentVersion\FileAssociations', Win32::Registry::KEY_READ) do |reg|
      value = reg['UserSid']
    end

    value
  end
end
