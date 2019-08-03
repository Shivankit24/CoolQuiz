//
//  Questions.swift
//  CoolQuiz
//
//  Created by Shivankit on 31/07/19.
//  Copyright © 2019 Shivankit. All rights reserved.
//

import Foundation

struct Question : Codable {
    let questions : [Questions]
    
    enum CodingKeys: String, CodingKey {
        case questions = "Questions"
    }
}

struct Questions : Codable {
    
    let correctAnswerIndex : Int
    let option1 : String
    let option2 : String
    let option3 : String
    let option4 : String
    let question : String
    
    enum CodingKeys: String, CodingKey {
        case correctAnswerIndex = "correctAnswerIndex"
        case option1 = "Option1"
        case option2 = "Option2"
        case option3 = "Option3"
        case option4 = "Option4"
        case question = "Question"
    }
}
