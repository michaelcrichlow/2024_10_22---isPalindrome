def isPalindrome(s: str) -> bool:
    # make lowercase
    test_string = s.lower()
    # remove whitespace
    for val in test_string:
        if val not in "abcdefghijklmnopqrstuvwxyz0123456789":
            test_string = test_string.replace(val, "")

    # consider an empty string True
    if len(test_string) == 0:
        return True

    # main test loop
    j = len(test_string) - 1
    for i in range(len(test_string)):
        if i > j:
            break
        if test_string[i] != test_string[j]:
            return False
        j -= 1

    return True


def main() -> None:
    assert (isPalindrome("A man, a plan, a canal: Panama") == True)
    assert (isPalindrome("race a car") == False)
    assert (isPalindrome(" ") == True)
    assert (isPalindrome("0P") == False)
    print("all tests passed!")


if __name__ == '__main__':
    main()

# "A man, a plan, a canal: Panama"
