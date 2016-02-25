//: Playground - noun: a place where people can play

import UIKit


func multipleOfTen(number: Int) -> Bool
{
    if number < 0 {
        return false
    }
    
    if number % 10 == 0{
        print(number)
        return true
    }
    
    return false
}





multipleOfTen(10)
multipleOfTen(5)
multipleOfTen(20)
multipleOfTen(17)
multipleOfTen(-4)
multipleOfTen(56)












