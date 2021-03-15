//
//  UIButton+ChangeBackgroundForState.swift
//  ScooterQuests
//
//  Created by Olka on 11.03.2021.
//

import UIKit

extension UIButton {
    func setSelectedColor(state: State) {
        if state == .selected {
            self.backgroundColor = UIColor(named: "redColor")
            self.setTitleColor(UIColor(named: "whiteColor"), for: state)
        } else {
            self.backgroundColor = UIColor(named: "whiteColor")
            self.setTitleColor(UIColor(named: "blueColor"), for: state)
        }
    }
}
