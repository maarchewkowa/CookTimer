//
//  TimerControl.swift
//  Cook Timer
//
//  Created by Karolina Beata Natalia Guzewska on 03.01.2018.
//  Copyright © 2018 Karolina Beata Natalia Guzewska. All rights reserved.
//

import UIKit

class TimerControl: UIView {
    let timerButton = UIButton()
    let timerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
        setupButtons()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
        setupButtons()
    }
    
    func setupButtons() {
        timerButton.backgroundColor = UIColor(red: 1, green: 212/255, blue: 121/255, alpha: 1)
        timerButton.setTitle("USTAW", for: .normal)
        timerButton.setTitleColor(.blue, for: .normal)
        addSubview(timerButton)
        timerButton.translatesAutoresizingMaskIntoConstraints = false
        timerButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timerButton.widthAnchor.constraint(equalToConstant: 122).isActive = true
        timerButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 20.0).isActive = true
        timerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func setupLabel() {
        timerLabel.text = "xxxxxxxxxxxx"
        timerLabel.textAlignment = NSTextAlignment.center
        timerLabel.adjustsFontSizeToFitWidth = true
        addSubview(timerLabel)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        timerLabel.widthAnchor.constraint(equalToConstant: 122).isActive = true
        timerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20.0).isActive = true
        timerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
