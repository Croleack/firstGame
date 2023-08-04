//
//  ViewController.swift
//  MyFirstGame
//
//  Created by Enzhe Gaysina on 25.03.2023.
//

import UIKit

class ViewController: UIViewController {

    //создаем экземпляр класса
    //lazy - значение не будет инициализировано до тех пор пока к этой переменной кто-нибудь не обратиться
  private lazy var game = ConcentrationGame(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (buttonCollection.count + 1) / 2
    }
    
    private func updateTouches() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: UIColor.red
        ]
        let attributedString = NSAttributedString(string: "Touches: \(touches )", attributes: attributes)
        
        touchLabel.attributedText = attributedString
    }

    private(set) var touches = 0 {
        didSet{
           updateTouches()
        }
    }
    
   //private var emojiCollection = ["🦧", "🦀", "🐷", "🐞", "🐨", "🐍", "🐩", "🐟", "🐝", "🦊", "🦁", "🐒", "🐸", "🦄", "🐊", "🦔"]
    private var emojiCollection = "🦧🦀🐷🐞🐨🐍🐩🐟🐝🦊🦁🐒🐸🦄🐊🦔"
    
   private var emojiDictionary = [Card:String]()
    
    
   private func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card] == nil {
            //функция которая дает случайное число
            let randomStringIndex = emojiCollection.index(emojiCollection.startIndex, offsetBy:
                                            emojiCollection.count.arc4randomExtension)
            emojiDictionary[card] = String(emojiCollection.remove(at: randomStringIndex))
        }
        return emojiDictionary[card] ?? "?"
    }
    
   private func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.001150725642, green: 0.5894084573, blue: 1, alpha: 0) : #colorLiteral(red: 0.001150725642, green: 0.5894084573, blue: 1, alpha: 1)
            }
        }
    }
    
    
    
    
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private var touchLabel: UILabel! {
        didSet {
            updateTouches()
        }
        
    }
    @IBAction private func urdateLabel(_ sender: Any) {
        touches = 0
        touchLabel.text = "Touches: 0"
    }
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender)
        {
            game.chooseCard(at: buttonIndex )
            updateViewFromModel()
        }
        
     }
    
}

extension Int {
    var arc4randomExtension: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0 }
}
}
