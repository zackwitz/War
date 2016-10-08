//
//  Card.swift
//  War
//
//  Created by Zack Hurwitz on 9/15/16.
//  Copyright © 2016 Zack. All rights reserved.
//

import Foundation

class Card
{
    var value: Int
    var suit: String
    var name:String
    
    init(valueIn: Int, suitIn: String)
    {
        value = valueIn
        suit = suitIn
        name = String(format: "%i_of_%@", valueIn, suitIn)
    }
    
    func compareTo (_ other: Card) -> Int
    {
        return value - other.value
    }
    
    
}
