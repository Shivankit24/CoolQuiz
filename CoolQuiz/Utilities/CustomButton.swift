//
//  UIButtonExtension.swift
//  CoolQuiz
//
//  Created by Shivankit on 31/07/19.
//  Copyright © 2019 Shivankit. All rights reserved.
//

import UIKit

public class RoundedButton: UIButton {
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
        self.layer.cornerRadius = 24.0
        
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
