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
    @IBOutlet weak var nextButton: RoundedButton!
    var optionButtons: [RoundedButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        optionButtons = [firstOptionButton, secondOptionButton, thirdOptionButton, fourthOptionButton]
        questions = allQuestions()
        updateQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateQuestion()
    }
    
    //  Update question and options
    func updateQuestion() {
        optionButtons.forEach {$0.backgroundColor = .white}
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
    
    //  UI configuration methods
    func configureUI() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        nextButton.backgroundColor = .darkButtonColor
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
            score += 10
            sender.backgroundColor = .correctAnswerColor
        } else {
            sender.backgroundColor = .wrongAnswerColor
        }
        optionButtons.forEach {$0.isEnabled = false}
        nextButton.isEnabled = true
        applySpringAnimation(to: sender)
    }
    
    @IBAction func nextButtonPressed(_ sender: RoundedButton) {
        if questionIndex < 10 {
            updateQuestion()
            optionButtons.forEach {$0.isEnabled = true}
            nextButton.isEnabled = false
        } else {
            performSegue(withIdentifier: Constants.kResultScreenSegue, sender: self)
        }
    }
    
    //  Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewController = segue.destination as? ResultViewController {
            resultViewController.scoreText = score
        }
    }
    
    /// Apply spring animation to button
    ///
    /// - Parameter sender: Rounded button
    func applySpringAnimation(to sender: RoundedButton) {
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
