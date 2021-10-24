//
//  Question.swift
//  Quizzler
//
//  Created by Amangeldiev Kutman on 25/10/21.
//

import Foundation

struct Question{
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
