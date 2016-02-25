//: Playground - noun: a place where people can play

import UIKit

func multiple(num:Int) -> Bool
{
    if num % 10 == 8{
        return true
    } else if num % 10 == 9 {
        return true
    } else if num % 10 == 1 {
        return true
    } else if num % 10 == 2 {
        return true
    } else if num % 10 == 0 {
        return true
    } else {
        return false
    }
}

multiple(40)
multiple(20)
multiple(23)
multiple(25)


