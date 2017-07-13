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
    
    @IBOutlet var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider)
    {
        seconds = Int(sender.value)
        label.text = String(seconds) + " Seconds"
    }
    
    @IBOutlet var startOutlet: UIButton!
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
    
    
    @IBOutlet var stopOutlet: UIButton!
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

