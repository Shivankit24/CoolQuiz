//
//  UIColor+Extension.swift
//  CoolQuiz
//
//  Created by Shivankit on 05/08/19.
//  Copyright © 2019 Shivankit. All rights reserved.
//

import UIKit

extension UIColor {
    static var wrongAnswerColor: UIColor {
        return UIColor(displayP3Red: 255/255, green: 0, blue: 0, alpha: 0.5)
    }
    
    static var correctAnswerColor: UIColor {
        return UIColor(displayP3Red: 0, green: 1, blue: 0, alpha: 0.5)
    }
    
    static var darkButtonColor: UIColor {
        return UIColor(displayP3Red: 29/255, green: 63/255, blue: 87/255, alpha: 1)
    }
}
