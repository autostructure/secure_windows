#
# Test specific resources
#
class secure_windows::test {
  if($facts['windows_role'] =~ /(^20|,20,|,20$)/) {
    notify { 'test message': }
  }
}
