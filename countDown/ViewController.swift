//
//  ViewController.swift
//  countDown
//
//  Created by Karolina Beata Natalia Guzewska on 07.07.2017.
//  Copyright © 2017 Karolina Beata Natalia Guzewska. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var seconds = 30
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    
    
    @IBOutlet var sliderOutlet: UISlider!
    @IBOutlet var sliderOutlet2: UISlider!
    
    @IBAction func slider(_ sender: UISlider)
    {
        seconds = Int(sender.value)
        label.text = String(seconds) + " Seconds"
    }
    
    @IBAction func slider2(_ sender: UISlider)
    {
        seconds = Int(sender.value)
        label2.text = String(seconds) + " Seconds"
    }
    
    
    @IBOutlet var startOutlet: UIButton!
    @IBOutlet var startOutlet2: UIButton!
    
    @IBAction func start(_ sender: Any)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
    }
    
    func counter()
    {
        seconds -= 1
        label.text = String(seconds) + " Seconds"
        
        if seconds == 0
        {
            timer.invalidate()
            sliderOutlet.isHidden = false
            startOutlet.isHidden = false
        
            audioPlayer.play()
        }
        
    }
    
    @IBAction func start2(_ sender: Any)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter2), userInfo: nil, repeats: true)
        
        sliderOutlet2.isHidden = true
        startOutlet2.isHidden = true
    }
    
    func counter2()
    {
        seconds -= 1
        label2.text = String(seconds) + " Seconds"
        
        if seconds == 0
        {
            timer.invalidate()
            sliderOutlet2.isHidden = false
            startOutlet2.isHidden = false
            
            audioPlayer.play()
        }
        
    }
    
    
    
    
    
    
    @IBOutlet var stopOutlet: UIButton!
    @IBOutlet var stopOutlet2: UIButton!
    
    
    @IBAction func stop(_ sender: Any)
    {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        label.text = "30 Seconds"
    
        audioPlayer.stop()
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
    
    }
    
    @IBAction func stop2(_ sender: Any)
    {
        timer.invalidate()
        seconds = 30
        sliderOutlet2.setValue(30, animated: true)
        label2.text = "30 Seconds"
        
        audioPlayer.stop()
        
        sliderOutlet2.isHidden = false
        startOutlet2.isHidden = false
        
    }
    
    
    
    
    
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "1", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
    
        }
        catch
        {
            //ERROR
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

