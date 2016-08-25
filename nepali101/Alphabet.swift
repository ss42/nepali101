//
//  Alphabet.swift
//  nepali101
//
//  Created by Sanjay Shrestha on 8/11/16.
//  Copyright © 2016 Dreams and Ideas. All rights reserved.
//

import Foundation


class Alphabet: SafeJsonObject{
    var letter: String?
    var sound: String?
    var word: String?
    var englishLetter: String?
    var englishWord: String?
    var image: String?
    
    
    init(letter: String, sound: String, word: String, englishLetter: String, englishWord: String, image: String){
        self.letter = letter
        self.sound = sound
        self.englishWord = letter
        self.englishWord = englishWord
        self.image = image
        self.word = word
    }
   
    
    }

class SafeJsonObject: NSObject {
    
    override func setValue(value: AnyObject?, forKey key: String) {
        let selectorString = "set\(key.uppercaseString.characters.first!)\(String(key.characters.dropFirst())):"
        let selector = Selector(selectorString)
        if respondsToSelector(selector) {
            super.setValue(value, forKey: key)
        }
    }
    
}