//
//  ViewController.swift
//  LenociF_HW4
//
//  Created by phrank on 2/10/20.
//  Copyright © 2020 phrank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var powerSwitch: UISwitch!
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var favSeg: UISegmentedControl!
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var buttonChD: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var buttonChP: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    
    var prevChannel: String?
    var num1:Int?
    var isTyping = false //determine if still typing number
    
    @IBAction func channelPressed(_ sender: UIButton) {
        if let channel = sender.currentTitle
        {
            if(isTyping && channelLabel.text! == "10" && String(channel) == "0")
            {
                 channelLabel.text = "100"
            }
            else if (isTyping && channelLabel.text!.count < 2)
            {
                prevChannel = channelLabel.text
               
                channelLabel.text = channelLabel.text! + String(channel)
            }
            else
            {
                prevChannel = channelLabel.text
                channelLabel.text = channel
                isTyping = true
            }
        }
    }
    @IBAction func switchPower(_ sender: UISwitch) {
  
        powerLabel.text = (sender.isOn ? "on" : "off")
        volumeSlider.isEnabled = (sender.isOn ? true : false)
        button0.isEnabled =  (sender.isOn ? true : false)
        button1.isEnabled =  (sender.isOn ? true : false)
        button2.isEnabled = (sender.isOn ? true : false)
        button3.isEnabled = (sender.isOn ? true : false)
        button4.isEnabled = (sender.isOn ? true : false)
        button5.isEnabled = (sender.isOn ? true : false)
        button6.isEnabled = (sender.isOn ? true : false)
        button7.isEnabled = (sender.isOn ? true : false)
        button8.isEnabled = (sender.isOn ? true : false)
        button9.isEnabled = (sender.isOn ? true : false)
        buttonChP.isEnabled = (sender.isOn ? true : false)
        buttonChD.isEnabled = (sender.isOn ? true : false)
        favSeg.isEnabled = (sender.isOn ? true : false)
        if sender.isOn {
            channelLabel.text = prevChannel
            powerLabel.textColor = UIColor .green;
      
           
        }
        if sender.isOn == false
        {
            prevChannel = channelLabel.text
            powerLabel.textColor = UIColor .red;
            channelLabel.text = "off"
        }
     
            
    }
    @IBAction func sliderMoved(_ sender: UISlider) {
        volumeLabel.text = "\(Int(sender.value * 100)) " 
    }
    
    @IBAction func channelInc(_ sender: UIButton) {
        if Int(channelLabel.text!)! >= 100
        {
           channelLabel.text = "100"
        }
        else
        {
            var chn = Int(channelLabel.text!)
            chn!+=1
            channelLabel.text = String(chn!)
        }
       
        
        
    }
    @IBAction func channelDec(_ sender: UIButton) {
        if Int(channelLabel.text!)! <= 0
        {
            channelLabel.text = "0"
        }
        else
        {
            var chn = Int(channelLabel.text!)
            chn!-=1
            channelLabel.text = String(chn!)
        }
    }
    @IBAction func favChannel(_ sender: UISegmentedControl) {
        if let fav = sender.titleForSegment(at: sender.selectedSegmentIndex)
        {
            prevChannel = fav
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        powerSwitch.setOn(false, animated: false)
        powerLabel.textColor = UIColor .red
        channelLabel.text = "off"
        volumeSlider.isEnabled = false
    }
    

}

