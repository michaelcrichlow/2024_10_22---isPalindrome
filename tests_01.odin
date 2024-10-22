package test

import "core:fmt"
import "core:mem"
import "core:slice"
import "core:strconv"
import "core:strings"
print :: fmt.println

main :: proc() {

	assert(isPalindrome("A man, a plan, a canal: Panama") == true)
	assert(isPalindrome("race a car") == false)
	assert(isPalindrome(" ") == true)
	assert(isPalindrome("0P") == false)
	print("all tests passed!")

	free_all(context.temp_allocator)

}


isPalindrome :: proc(s: string) -> bool {
	// make lowercase
	test_string := strings.to_lower(s, context.temp_allocator)

	// remove whitespace
	valid_characters := "abcdefghijklmnopqrstuvwxyz0123456789"
	for val in test_string {
		if !strings.contains_rune(valid_characters, val) {
			test_string = remove_rune(test_string, val, context.temp_allocator)
		}
	}

	// consider an empty string true
	if len(test_string) == 0 {
		return true
	}

	// main test loop
	j := len(test_string) - 1
	for i in 0 ..< len(test_string) {
		if i > j do break
		if test_string[i] != test_string[j] do return false
		j -= 1
	}

	return true
}
