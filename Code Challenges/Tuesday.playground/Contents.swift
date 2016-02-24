//: Playground - noun: a place where people can play

import UIKit

func random(numbers: [Int]) -> (min: Int, max: Int)
{
    var min = numbers[0]
    var max = numbers[0]
    
    for number in numbers [1..<numbers.count] {
        if number > max {
            max = number
            
        } else if number < min {
            min = number
            
        }
        
    }
    
    return (min, max)
    
}

let ages = random([21, 18, 16, 23, 28])
print(ages.max)
print(ages.min)

