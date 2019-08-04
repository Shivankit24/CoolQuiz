//
//  ResultViewController.swift
//  CoolQuiz
//
//  Created by Shivankit on 05/08/19.
//  Copyright © 2019 Shivankit. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //  Properties
    var scoreText = 0
    
    /// IBOutlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var restartButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRestartButton()
        scoreLabel.text = "\(scoreText)/100"
    }
    
    //  UI configuration methods
    func configureRestartButton() {
        restartButton.layer.cornerRadius = restartButton.frame.height / 2
        restartButton.backgroundColor = .darkButtonColor
        restartButton.setTitleColor(.white, for: .normal)
    }
    
    //  IBActions
    
    @IBAction func restartButtonPressed(_ sender: RoundedButton) {
        
    }
}
