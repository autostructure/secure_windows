#
# Test specific resources
#
class secure_windows::test {
  if($facts['windows_role'] =~ /[^\d\^]61[^\d]/) {
    notify { 'test message': }
  }
}
