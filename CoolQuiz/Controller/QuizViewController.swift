//
//  QuizViewController.swift
//  CoolQuiz
//
//  Created by Shivankit on 30/07/19.
//  Copyright © 2019 Shivankit. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var questions: [Questions]?

    //  IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var nextButton: RoundedButton!
    
    @IBOutlet weak var firstOptionButton: RoundedButton!
    @IBOutlet weak var secondOptionButton: RoundedButton!
    @IBOutlet weak var thirdOptionButton: RoundedButton!
    @IBOutlet weak var fourthOptionButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureNextButton()
        questions = readQuestions()
        setQuestionLabelText()
        setChoiceButtonOptionsText()
    }
    
    func configureNextButton() {
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        nextButton.backgroundColor = UIColor.init(displayP3Red: 28/255, green: 61/255, blue: 83/255, alpha: 1)
        nextButton.setTitleColor(.white, for: .normal)
    }
    
    func setChoiceButtonOptionsText() {
        guard let questions = questions else { return }
        firstOptionButton.setTitle(questions.first?.option1, for: .normal)
        secondOptionButton.setTitle(questions.first?.option2, for: .normal)
        thirdOptionButton.setTitle(questions.first?.option3, for: .normal)
        fourthOptionButton.setTitle(questions.first?.option4, for: .normal)
    }
    
    func setQuestionLabelText() {
        guard let questions = questions else { return }
        let firstQuestion = questions.first?.question
        questionLabel.text = firstQuestion
    }
    
    func updateUI() {
        
    }
    
    func readQuestions() -> [Questions] {
        do {
            if let path = Bundle.main.path(forResource: "Questions", ofType: "json") {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = try JSONDecoder().decode(Question.self, from: data)
                let questions = json.questions
                return questions ?? []
            }
        } catch {}
        return []
    }
    
    //  IBActions
    @IBAction func choicesButtonPressed(_ sender: RoundedButton) {
        guard let questions = questions else { return }
        switch sender.tag {
        case 0:
            
        case 1:
        case 2:
        case 3:
        default:
            break
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
    }
}
