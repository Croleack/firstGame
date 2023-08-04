//
//  Card.swift
//  MyFirstGame
//
//  Created by Enzhe Gaysina on 02.04.2023.
//

import Foundation

//dictionary потребовал чтобы мы использовали хэшебел
struct Card:Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    //изначально карта перевернута
    var isFaceUp = false
    //изначально карта не совпала с другими
    var isMatched = false
    private var identifier: Int
    
    //static позволяет достучаться до объекта/ не инициализируя объект
   private static var identifierNumber = 0
    
    private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    init() {
        self.identifier = Card.identifierGenerator()
    }
}
