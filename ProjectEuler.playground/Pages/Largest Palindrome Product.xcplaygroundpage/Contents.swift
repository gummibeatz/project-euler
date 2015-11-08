//: [Even Fibonacci numbers](@previous)

/*:
# Largest Palindrome Product
https://projecteuler.net/problem=4

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99.

**Find the largest palindrome made from the product of two 3-digit numbers**
*/

import Foundation

//: First attempt

/*

extension Int {
    func isPalindrome() -> Bool {
        let str = String(format: "%d", arguments: [self])
        return str == str.reverse()
    }
}

extension String {
    func reverse() -> String {
        var r = [Character]()
        for (_, char) in self.characters.enumerate() {
            r.insert(char, atIndex: 0)
        }
        return String(r)
    }
}

func largestPalindromWithXNumberOfDigits(numberOfDigits: Int) -> Int {
    let largest = Int((0..<numberOfDigits).map{_ in "9"}.joinWithSeparator(""))!
    var results = [Int]()
    for var i = largest; i >= 0; i-- {
        for var j = largest; j >= 0; j-- {
            if (i * j).isPalindrome() {
                results.append(i * j)
            }
        }
    }
    return results.sort { $0 > $1 }.first!
}

print(NSDate())
print(largestPalindromWithXNumberOfDigits(3))
print(NSDate())

*/

//: Second attempt

extension Int {
    func isPalindrome() -> Bool {
        var reversedNum = 0
        var remainingNum = self
        while(remainingNum > 0) {
            reversedNum += remainingNum % 10
            reversedNum *= 10
            remainingNum /= 10   // takes advantage of Swift's truncation of Int
        }
        return self == (reversedNum / 10)
    }
}




func largestPalindromWithXNumberOfDigits(numberOfDigits: Int) -> Int {
    let largest = Int((0..<numberOfDigits).map{_ in "9"}.joinWithSeparator(""))!
    var results = [Int]()
    for var i = largest; i >= 10; i-- {
        for var j = largest; j >= 10; j-- {
            if (i * j).isPalindrome() {
                results.append(i * j)
            }
        }
    }
    return results.sort { $0 > $1 }.first!
}

// uncomment the line below to execute
// largestPalindromWithXNumberOfDigits(3)

//: [Next](@next)
