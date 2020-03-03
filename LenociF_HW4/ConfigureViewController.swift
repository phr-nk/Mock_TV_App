//
//  ConfigureViewController.swift
//  LenociF_HW4
//
//  Created by phrank on 3/2/20.
//  Copyright © 2020 phrank. All rights reserved.
//

import UIKit

class ConfigureViewController: UIViewController {
    
    
    var fav_channel: Config!
    var fav_channel_label:String = ""
    var fav_channel_num:Int = 0


    @IBOutlet weak var seg_outlet: UISegmentedControl!
    @IBOutlet weak var step_outlet: UIStepper!
    @IBOutlet weak var channel_label: UILabel!
    @IBOutlet weak var text_label: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save_button(_ sender: UIButton) {
        if(text_label.text!.count < 1 || text_label.text!.count > 4)
        {
            let alert = UIAlertController(title:"Warning", message:"Can't have more than 4 letters",preferredStyle: .alert)
            let dismiss = UIAlertAction(title:"Dismiss",style: .default, handler:nil)
            alert.addAction(dismiss)
            self.present(alert,animated: true,completion: nil)
            clear()
        }
        else
        {
            switch(seg_outlet.selectedSegmentIndex)
            {
            case 0:
                fav_1.set_num(_num: Int(channel_label.text!)!)
                fav_1.set_label(_label: text_label.text!)
                break
            case 1:
                 fav_2.set_num(_num: Int(channel_label.text!)!)
                 fav_2.set_label(_label: text_label.text!)
                break
            case 2:
                 fav_3.set_num(_num: Int(channel_label.text!)!)
                 fav_3.set_label(_label: text_label.text!)
                break
            case 3:
                 fav_4.set_num(_num: Int(channel_label.text!)!)
                 fav_4.set_label(_label: text_label.text!)
                break
            default:
                break
            }
        }
    }
    @IBAction func cancel_button(_ sender: UIButton) {
        clear()
    }
    
    @IBAction func seg_button(_ sender: UISegmentedControl) {
        let fav_channel_sender = sender.selectedSegmentIndex
        switch(fav_channel_sender)
        {
        case 0:
            fav_channel = fav_1
        case 1:
            fav_channel = fav_2
        case 2:
            fav_channel = fav_3
        case 3:
            fav_channel = fav_4
        default:
            fav_channel = fav_1
        }
    }
    @IBAction func step_action(_ sender: UIStepper) {
        sender.wraps = true
        sender.minimumValue = 1
        sender.maximumValue =  99
        channel_label.text = Int(sender.value).description
    }
    
    func clear()
    {
        text_label.text = ""
        step_outlet.value = 1
        channel_label.text = "1"
        seg_outlet.selectedSegmentIndex = 0
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
