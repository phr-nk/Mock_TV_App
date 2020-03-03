//
//  Config.swift
//  LenociF_HW4
//
//  Created by phrank on 3/2/20.
//  Copyright © 2020 phrank. All rights reserved.
//

import UIKit

class Config: NSObject
{
    private var id: Int
    private var channel_label:String
    private var channel_number:Int
    
    init(_id:Int, _num:Int, _label:String)
    {
        id = _id
        channel_label = _label
        channel_number = _num
    }
    func get_id()-> Int
    {
        return id
    }
    func set_id(_id:Int)
    {
        id = _id
    }
    func get_num()->Int
    {
        return channel_number;
    }
    func set_num(_num:Int)
    {
        channel_number = _num
    }
    func get_label()->String
    {
        return channel_label
    }
    func set_label(_label:String)
    {
        channel_label = _label
    }
    func save_channel(config_object:Config,_id:Int,_num:Int,_label:String)
    {
        config_object.id = _id
        config_object.channel_number = _num
        config_object.channel_label = _label
    }
}
