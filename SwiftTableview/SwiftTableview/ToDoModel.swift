//
//  ToDoModel.swift
//  ToDo
//
//  Created by missummer on 15/8/11.
//  Copyright (c) 2015年 ldf. All rights reserved.
//

import UIKit

class ToDoModel: NSObject {
    var id:String
    var image:String
    var title:String
    var date:NSDate
    init(id:String,image:String,title:String,date:NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
    
}
