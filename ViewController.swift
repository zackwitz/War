//
//  ViewController.swift
//  War
//
//  Created by Zack Hurwitz on 6/30/16.
//  Copyright © 2016 Zack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var player1Count: UILabel!
    @IBOutlet weak var player2Count: UILabel!
    @IBOutlet weak var p1countLabel: UILabel!
    @IBOutlet weak var p2countLabel: UILabel!
    
    //create players
    let player1: Player = Player()
    let player2: Player = Player()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //create, shuffle, and assign all cards
        let allCards: [Card] = initAllCards()
        let shuffledAllCards = shuffleCards(allCards)
        player1.cards = Array(shuffledAllCards.prefix(upTo: 26))
        player2.cards = Array(shuffledAllCards.suffix(from: 26))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playRoundTapped(_ sender: UIButton)
    {
        if player1.cards.count > 0 && player2.cards.count > 0
        {
            //get the top card from each array
            let card1: Card = player1.cards.removeFirst()
            let card2: Card = player2.cards.removeFirst()
        
            //display the two new cards
            self.firstCardImageView.image = UIImage(named: card1.name)
            self.secondCardImageView.image = UIImage(named: card2.name)
       
            //compare the cards and add to winner's array
            if card1.value > card2.value
            {
                player1.cards.append(contentsOf: [card1, card2])
            }
            else if card1.value < card2.value
            {
                player2.cards.append(contentsOf: [card1, card2])
            }
            else
            {
                player1.cards.append(card1)
                player2.cards.append(card2)
            }
        
            //display the two new scores
            self.player1Count.text = String(format: "%i", player1.cards.count)
            self.player2Count.text = String(format: "%i", player2.cards.count)
        }
    }
    
    func initAllCards() -> [Card]
    {
        //initialize array of all cards
        var listOfCards: [Card] = [Card]()
        
        //set up first while loop
        var cardValue = 2
        while cardValue <= 14
        {
            listOfCards.append(Card(valueIn: cardValue, suitIn: "spades"))
            cardValue += 1
        }
        //set up second while loop
        cardValue = 2
        while cardValue <= 14
        {
            listOfCards.append(Card(valueIn: cardValue, suitIn: "hearts"))
            cardValue += 1
        }
        //set up third while loop
        cardValue = 2
        while cardValue <= 14
        {
            listOfCards.append(Card(valueIn: cardValue, suitIn: "diamonds"))
            cardValue += 1
        }
        //set up fourth while loop
        cardValue = 2
        while cardValue <= 14
        {
            listOfCards.append(Card(valueIn: cardValue, suitIn: "clubs"))
            cardValue += 1
        }
        
        return listOfCards
    }
    
    func shuffleCards(_ cardsIn: [Card]) -> [Card]
    {
        //create copy of cards
        var copyCardsIn: [Card] = [Card]()
        copyCardsIn.append(contentsOf: cardsIn)

        //create new array with random card order
        var cardsOut: [Card] = [Card]()
        var randomIndex: Int
        var cardsThrough = 0
        while cardsThrough < 52
        {
            let maxRandom = UInt32(52 - cardsThrough)
            randomIndex = Int(arc4random_uniform(maxRandom))
            cardsOut.append(copyCardsIn.remove(at: randomIndex))
            cardsThrough += 1
        }
        print("Shuffled Cards: ")
        print(cardsOut.count)
        printCards(cardsOut)
        return cardsOut
    }
    
    func printCards(_ cards: [Card])
    {
        for card in cards
        {
            print(card.name)
        }
    }
}

