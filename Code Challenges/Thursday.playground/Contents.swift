//: Playground - noun: a place where people can play

import UIKit

func double(string: String) -> String
{
    var characters = ""
   
    for char in string.characters
    {
        characters.append(char)
        characters.append(char)
    }
    
    return characters
}

double("food")



