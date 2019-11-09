# frozen_string_literal: true

require 'libphonenumber/version'
require 'ffi'

module LibPhoneNumber
  module Internal
    extend FFI::Library
    ffi_lib FFI::Library::LIBC
    ffi_lib File.expand_path('./libphonenumber/libphonenumber.so', File.dirname(__FILE__))

    attach_function :format_as_e164, %i[string string], :strptr
    attach_function :format_as_national, %i[string string], :strptr
    attach_function :get_region_code_from_phone_number, %i[string], :strptr

    attach_function :free, [:pointer], :void, ignore_error: true
  end

  module_function

  def format_as_e164(number, region)
    formatted_phone, ptr = Internal.format_as_e164(number, region)
    Internal.free(ptr) if ptr
    formatted_phone
  end

  def format_as_national(number, region)
    formatted_phone, ptr = Internal.format_as_national(number, region)
    Internal.free(ptr) if ptr
    formatted_phone
  end

  def get_region_code_from_phone_number(number)
    region_code, ptr = Internal.get_region_code_from_phone_number(number)
    Internal.free(ptr) if ptr
    region_code
  end
end
