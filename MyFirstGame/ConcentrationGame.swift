//
//  ConcentrationGame.swift
//  MyFirstGame
//
//  Created by Enzhe Gaysina on 02.04.2023.
//

import Foundation

class ConcentrationGame {
    
    private(set) var cards = [Card]()
    
    //создаем индекс единственной перевернутой карточки
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            
            /*
             code code
             code 
             */
            
            
            
            
            
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
            
            
            
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        //восклицательный знак значит нет
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex] == cards[index]  {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                //чтобы не перебирать от 0 и т.д. воспользуемся методом массива
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
        
        
        //пример выполения Assertions
        
        init(numberOfPairsOfCards: Int) {
            assert(numberOfPairsOfCards > 0, "ConcentrationGame.init\(numberOfPairsOfCards): must have at least one pair of pards")
            for _ in 1...numberOfPairsOfCards {
                let card = Card()
                cards += [card, card]
                cards = cards.shuffled()
            }
        }
        
        
    }

