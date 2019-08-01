//
//  Questions.swift
//  CoolQuiz
//
//  Created by Shivankit on 31/07/19.
//  Copyright © 2019 Shivankit. All rights reserved.
//

import Foundation

struct Question : Codable {
    let questions : [Questions]?
    
    enum CodingKeys: String, CodingKey {
        case questions = "Questions"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        questions = try values.decodeIfPresent([Questions].self, forKey: .questions)
    }
}

struct Questions : Codable {
    
    let correctAnswerIndex : Int?
    let option1 : String?
    let option2 : String?
    let option3 : String?
    let option4 : String?
    let question : String?
    
    enum CodingKeys: String, CodingKey {
        case correctAnswerIndex = "correctAnswerIndex"
        case option1 = "Option1"
        case option2 = "Option2"
        case option3 = "Option3"
        case option4 = "Option4"
        case question = "Question"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        correctAnswerIndex = try values.decodeIfPresent(Int.self, forKey: .correctAnswerIndex)
        option1 = try values.decodeIfPresent(String.self, forKey: .option1)
        option2 = try values.decodeIfPresent(String.self, forKey: .option2)
        option3 = try values.decodeIfPresent(String.self, forKey: .option3)
        option4 = try values.decodeIfPresent(String.self, forKey: .option4)
        question = try values.decodeIfPresent(String.self, forKey: .question)
    }
}
