# frozen_string_literal: true

require 'test_helper'
require 'libphonenumber'

class LibPhoneNumberTest < Minitest::Test
  def test_it_formats_phone_number
    assert_equal '+33618557497', LibPhoneNumber.format_as_e164('+330618557497', '')
    assert_equal '+3780549886677', LibPhoneNumber.format_as_e164('+378886677', '')
    assert_nil LibPhoneNumber.format_as_e164('+abc', 'UNKNOWN')
  end

  def test_it_formats_phone_number_as_national_format
    assert_equal '0618557497', LibPhoneNumber.format_as_national('+330618557497', 'FR')
    assert_equal '0549886677', LibPhoneNumber.format_as_national('+378886677', 'SM')
    assert_equal '6716498664', LibPhoneNumber.format_as_national('+16716498664', 'GU')
    assert_nil LibPhoneNumber.format_as_national('+abc', 'UNKNOWN')
  end

  def test_it_gets_region_code_from_phone_number
    assert_equal 'FR', LibPhoneNumber.get_region_code_from_phone_number('+330618557497')
    assert_equal 'SM', LibPhoneNumber.get_region_code_from_phone_number('+378886677')
    assert_nil LibPhoneNumber.get_region_code_from_phone_number('+99999999378886677')
  end
end
