//
//  Question.swift
//  quizy
//
//  Created by Antonio Toriz on 1/17/21.
//

import Foundation

struct Question {
    let question: String
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.question = q
        self.answers = a
        self.rightAnswer = correctAnswer
    }
}
