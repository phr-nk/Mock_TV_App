//
//  DVR-ViewController.swift
//  LenociF_HW4
//
//  Created by phrank on 2/24/20.
//  Copyright © 2020 phrank. All rights reserved.
//

import UIKit

class DVR_ViewController: UIViewController {
    
    @IBOutlet weak var PowerLabel: UILabel!
    
    @IBOutlet weak var StateLabel: UILabel!
    
    @IBOutlet weak var play_outlet: UIButton!
    @IBOutlet weak var stop_outlet: UIButton!
    @IBOutlet weak var pause_outlet: UIButton!
    @IBOutlet weak var foward_outlet: UIButton!
    @IBOutlet weak var rewind_outlet: UIButton!
    @IBOutlet weak var record_outlet: UIButton!
    @IBOutlet weak var switch_outlet: UISwitch!
    
    enum power : String
    {
           case on = "On"
           case off = "Off"
    }
       
    enum states : String
    {
           case stopped = "Stopped"
           case play = "Play"
           case pause = "Pause"
           case rewind = "Fast Rewinding"
           case forward = "Fast Forwarding"
           case record = "Recording"
    }
    func enabler(value : Bool)
    {
        if(value){
            play_outlet.isEnabled = true
            stop_outlet.isEnabled = true
            pause_outlet.isEnabled = true
            foward_outlet.isEnabled = true
            rewind_outlet.isEnabled = true
            record_outlet.isEnabled = true
        }
        else{
            play_outlet.isEnabled = false
            stop_outlet.isEnabled = false
            pause_outlet.isEnabled = false
            foward_outlet.isEnabled = false
            rewind_outlet.isEnabled = false
            record_outlet.isEnabled = false
            StateLabel.text = states.stopped.rawValue;
        }
    }
    func messenger (sender: UIButton, state: states.RawValue)
    {
        let title = "Incorrect action";
        let message  = "Cannot \(sender.currentTitle!) while \(StateLabel.text!)";
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let forceAction = UIAlertAction(title: "Force", style: .destructive, handler: {(action:UIAlertAction) in
            self.forceStateAssign(given: state)
           });
           alertController.addAction(cancelAction);
           alertController.addAction(forceAction);
        present(alertController, animated: true, completion: nil)
    }
    func forceStateAssign (given: String)
    {
        StateLabel.text = states.stopped.rawValue;
        StateLabel.text = given
    }
    
    @IBAction func SwitchToTV(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func play_button(_ sender: UIButton)
    {
        if(StateLabel.text != states.record.rawValue)
        {
            StateLabel.text = states.play.rawValue
        }
        else
        {
            messenger(sender: sender, state: states.play.rawValue);

        }
    }
    
    @IBAction func stop_button(_ sender: UIButton)
    {
        StateLabel.text = states.stopped.rawValue
    }
    @IBAction func pause_button(_ sender: UIButton)
    {
        if(StateLabel.text != states.record.rawValue && StateLabel.text == states.play.rawValue)
        {
            StateLabel.text = states.pause.rawValue
        }
        else
        {
            messenger(sender: sender, state: states.pause.rawValue);

        }
    }
    @IBAction func foward_button(_ sender: UIButton)
    {
        if(StateLabel.text != states.record.rawValue && StateLabel.text == states.play.rawValue)
        {
            StateLabel.text = states.forward.rawValue
        }
        else
        {
            messenger(sender: sender, state: states.forward.rawValue);

        }
    }
    @IBAction func rewind_button(_ sender: UIButton)
    {
        if(StateLabel.text != states.record.rawValue && StateLabel.text == states.play.rawValue)
        {
            StateLabel.text = states.rewind.rawValue
        }
        else
        {
            messenger(sender: sender, state: states.rewind.rawValue);

        }
    }
    @IBAction func record_button(_ sender: UIButton)
    {
        if(StateLabel.text == states.stopped.rawValue)
        {
            StateLabel.text = states.record.rawValue
        }
        else
        {
            messenger(sender: sender, state: states.record.rawValue);

        }
    }
    @IBAction func powerSwitch(_ sender: UISwitch)
    {
        let enabled = sender.isOn
        if(enabled)
        {
            PowerLabel.text = power.on.rawValue
            enabler(value: true)
            
        }
        else
        {
            PowerLabel.text = power.off.rawValue
            enabler(value: false)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


