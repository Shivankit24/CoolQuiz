//
//  QuizViewController.swift
//  CoolQuiz
//
//  Created by Shivankit on 30/07/19.
//  Copyright © 2019 Shivankit. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //  Properties
    var questions: [Questions] = []
    var questionIndex = 0
    var selectedAnswer = 0
    var score = 0

    //  IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstOptionButton: RoundedButton!
    @IBOutlet weak var secondOptionButton: RoundedButton!
    @IBOutlet weak var thirdOptionButton: RoundedButton!
    @IBOutlet weak var fourthOptionButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = allQuestions()
        updateQuestion()
    }
    
    //  Update question and options
    func updateQuestion() {
        if questionIndex < questions.count {
            questionLabel.text = questions[questionIndex].question
            firstOptionButton.setTitle(questions[questionIndex].option1, for: .normal)
            secondOptionButton.setTitle(questions[questionIndex].option2, for: .normal)
            thirdOptionButton.setTitle(questions[questionIndex].option3, for: .normal)
            fourthOptionButton.setTitle(questions[questionIndex].option4, for: .normal)
            
            selectedAnswer = questions[questionIndex].correctAnswerIndex
            questionIndex += 1
        }
    }
    
    /// <#Description#>
    func updateUI() {
        //TODO: Update UI code
    }
    
    /// Get questions from json file
    ///
    /// - Returns: Array of Questions Struct
    func allQuestions() -> [Questions] {
        do {
            if let path = Bundle.main.path(forResource: "Questions", ofType: "json") {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = try JSONDecoder().decode(Question.self, from: data)
                return json.questions
            }
        } catch {}
        return []
    }
    
    //  IBActions
    @IBAction func choicesButtonPressed(_ sender: RoundedButton) {
        
        if sender.tag == selectedAnswer {
            print("correct")
            score += 10
        } else {
            print("wrong")
        }
        applySpringAnimation(on: sender)
        updateQuestion()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
    }
    
    /// Apply spring animation to button
    ///
    /// - Parameter sender: Rounded button
    func applySpringAnimation(on sender: RoundedButton) {
        sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(8.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                        sender.transform = CGAffineTransform.identity
        },
                       completion: { Void in()  }
        )
    }
}
