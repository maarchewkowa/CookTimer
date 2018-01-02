//
//  ViewController.swift
//  Cook Timer
//
//  Created by Karolina Beata Natalia Guzewska on 31.12.2017.
//  Copyright © 2017 Karolina Beata Natalia Guzewska. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

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
    @IBOutlet weak var okButton: UIButton!
    
    @IBAction func okButtonPushed(_ sender: Any) {
        if counter <= 0 {
            timePicker.isHidden = false
            toolBar.isHidden = false
        } else {
            resetTimer()
        }
    }
    func resetTimer() {
        counter = 0
        timer.invalidate()
        okButton.setTitle("USTAW", for: .normal)
        timeLabel.isHidden = true
    }
    @objc func timeSelected (_ sender: UIBarButtonItem!) {
        timeLabel.textColor = .black
        counter = timePicker.selectedRow(inComponent: 0) * 60 + timePicker.selectedRow(inComponent: 1)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            if (self.counter <= 0) {
                self.okButton.setTitle("USTAW", for: .normal)
                self.timeLabel.text = "CZAS MINĄŁ"
                self.timeLabel.textColor = .red
                print("Done")
                AudioServicesPlayAlertSound(SystemSoundID(1304))
                let alertController = UIAlertController(title: "CZAS MINĄŁ", message: "Czas odcedzić makaron", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                super.present(alertController, animated: true, completion: nil)
                timer.invalidate()
            } else {
                self.counter -= 1
                self.updateLabel(seconds: self.counter)
                print(self.counter)
            }
        })
        self.okButton.setTitle("STOP", for: .normal)
        timeLabel.isHidden = false
        timePicker.isHidden = true
        toolBar.isHidden = true
        updateLabel(seconds: counter)

    }
    @objc func closeTimePicker(_ sender: UIBarButtonItem!){
        timePicker.isHidden = true
        toolBar.isHidden = true
    }
    
    func updateLabel (seconds: Int){
        timeLabel.text = "\(String(format: "%02d", seconds / 60)) : \(String(format: "%02d", seconds % 60))"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.okButton.setTitle("USTAW", for: .normal)
        timePicker = UIPickerView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 300))
        timePicker.backgroundColor = .white
        
        timePicker.showsSelectionIndicator = true
        timePicker.delegate = self
        timePicker.dataSource = self
        timePicker.isHidden = true
        timePicker.setPickerLabels(labels: [0 : "min", 1 : "sek"], containedView: self.view)
        
        toolBar = UIToolbar(frame: CGRect(x: 0, y: timePicker.frame.origin.y - 50, width: view.frame.width, height: 50))
        toolBar.isHidden = true
        toolBar.barStyle = UIBarStyle.default
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector (ViewController.timeSelected(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector (ViewController.closeTimePicker(_:)))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.view.addSubview(toolBar)
        self.view.addSubview(timePicker)
        
//        textField1.inputView = timePicker
//        textField1.inputAccessoryView = toolBar
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

