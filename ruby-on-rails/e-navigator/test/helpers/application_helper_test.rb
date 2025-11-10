require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "devise_mapping should return user mapping" do
    mapping = devise_mapping

    assert_not_nil mapping
    assert_equal Devise.mappings[:user], mapping
  end

  test "devise_mapping should be memoized" do
    mapping1 = devise_mapping
    mapping2 = devise_mapping

    assert_equal mapping1.object_id, mapping2.object_id
  end

  test "devise_mapping should return Devise::Mapping instance" do
    mapping = devise_mapping

    assert_instance_of Devise::Mapping, mapping
  end
end
