Facter.add(:windows_server_type) do
  confine operatingsystem: :windows
  setcode do
    require 'win32/registry'

    value = nil
    hive = Win32::Registry::HKEY_LOCAL_MACHINE
    hive.open('SYSTEM\CurrentControlSet\Control\ProductOptions', Win32::Registry::KEY_READ | 0x100) do |reg|
      value = reg['ProductType']
    end
    value = case value
            when 'LanmanNT'
              'windowsdc'
            else
              'MemberServer'
            end
    value
  end
end
