package main

import (
	/*
		#include <stdlib.h>
	*/
	"C"
	"strings"
	"regexp"
	"github.com/ttacon/libphonenumber"
)

//export format_as_e164
func format_as_e164(number, region *C.char) *C.char {
	goPhoneNumber := C.GoString(number)
	goRegion := strings.ToUpper(C.GoString(region))

	phoneNumber, err := libphonenumber.Parse(goPhoneNumber, goRegion)
	if err != nil {
		return nil
	}

	phoneNumberStr := libphonenumber.Format(phoneNumber, libphonenumber.E164)

	return C.CString(phoneNumberStr)
}

var nonDialableChars = regexp.MustCompile(`[\(\)\- ]`)

//export format_as_national
func format_as_national(number, region *C.char) *C.char {
	goPhoneNumber := C.GoString(number)
	goRegion := strings.ToUpper(C.GoString(region))

	phoneNumber, err := libphonenumber.Parse(goPhoneNumber, goRegion)
	if err != nil {
		return nil
	}

	phoneNumberStr := libphonenumber.Format(phoneNumber, libphonenumber.NATIONAL)
	phoneNumberStr  = nonDialableChars.ReplaceAllString(phoneNumberStr, "")

	return C.CString(phoneNumberStr)
}

//export get_region_code_from_phone_number
func get_region_code_from_phone_number(number *C.char) *C.char {
	goPhoneNumber := C.GoString(number)

	phoneNumber, err := libphonenumber.Parse(goPhoneNumber, "")
	if err != nil {
		return nil
	}

	regionCode := libphonenumber.GetRegionCodeForNumber(phoneNumber)

	return C.CString(regionCode)
}

func main() {}
