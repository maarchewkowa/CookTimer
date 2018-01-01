//
//  ViewController.swift
//  Cook Timer
//
//  Created by Karolina Beata Natalia Guzewska on 31.12.2017.
//  Copyright © 2017 Karolina Beata Natalia Guzewska. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var timePicker: UIPickerView!
    var toolBar: UIToolbar!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    var timer = Timer()
    var counter = 0
    @IBOutlet weak var timeLabel: UILabel!
    @IBAction func okButtonPushed(_ sender: Any) {
        timePicker.isHidden = false
        toolBar.isHidden = false
        
        
    }
    @objc func timeSelected (_ sender: UIBarButtonItem!) -> Void {
        counter = timePicker.selectedRow(inComponent: 0) * 60 + timePicker.selectedRow(inComponent: 1)
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            if (self.counter <= 0) {
                print("Done")
                timer.invalidate()
            } else {
                print(self.counter)
                self.counter -= 1
            }
        })
        timePicker.isHidden = true
        toolBar.isHidden = true
    }
    
    override func viewDidLoad() {
        timePicker = UIPickerView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 300))
        timePicker.backgroundColor = .white
        
        timePicker.showsSelectionIndicator = true
        timePicker.delegate = self
        timePicker.dataSource = self
        timePicker.isHidden = true
        
        toolBar = UIToolbar(frame: CGRect(x: 0, y: timePicker.frame.origin.y - 50, width: view.frame.width, height: 50))
        toolBar.isHidden = true
        toolBar.barStyle = UIBarStyle.default
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector (ViewController.timeSelected(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: "donePicker")
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.view.addSubview(toolBar)
        self.view.addSubview(timePicker)
        
//        textField1.inputView = timePicker
//        textField1.inputAccessoryView = toolBar
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

