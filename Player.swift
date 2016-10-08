//
//  Player.swift
//  War
//
//  Created by Zack Hurwitz on 9/26/16.
//  Copyright © 2016 Zack. All rights reserved.
//

import Foundation

class Player
{
    var cards: [Card]
    
    init()
    {
        cards = [Card]()
    }
    
    func addCards (_ newCards: [Card])
    {
        cards.append(contentsOf: newCards)
    }
    
    func removeFirstCard() -> Card
    {
        return cards.removeFirst()
    }
}
