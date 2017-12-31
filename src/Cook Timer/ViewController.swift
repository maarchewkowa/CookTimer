//
//  ViewController.swift
//  Cook Timer
//
//  Created by Karolina Beata Natalia Guzewska on 31.12.2017.
//  Copyright © 2017 Karolina Beata Natalia Guzewska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var counter = 0
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func okButtonPushed(_ sender: Any) {
        counter = 5
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            if (self.counter <= 0) {
                print("Done")
                timer.invalidate()
            } else {
                print(self.counter)
                self.counter -= 1
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

