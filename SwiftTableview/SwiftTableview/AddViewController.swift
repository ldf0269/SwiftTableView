//
//  AddViewController.swift
//  ToDo
//
//  Created by missummer on 15/8/11.
//  Copyright (c) 2015年 ldf. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var findHouseBtn: UIButton!
    @IBOutlet weak var findSceneryBtn: UIButton!
    @IBOutlet weak var findPeopleBtn: UIButton!
    @IBOutlet weak var inputTextFeild: UITextField!
    @IBOutlet weak var choseDateView: UIDatePicker!
    
    var todo:ToDoModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextFeild.delegate = self
        if todo == nil{
        findHouseBtn.selected = true
            self.title = "新增事件"
        
        }else{
            self.title = "修改事件"
            
            if todo?.image == "hot_press"{
                findHouseBtn.selected = true
                
            
            }else if todo?.image == "scenic_spot_press"{
                findSceneryBtn.selected = true
                
            }else{
            
                findPeopleBtn.selected = true
            }
            inputTextFeild.text = todo?.title
            choseDateView.setDate(todo!.date, animated: false)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func findHouseBtnClick(sender: AnyObject) {
        findPeopleBtn.selected = false
        findSceneryBtn.selected = false
        findHouseBtn.selected = true
    }
    
    @IBAction func findSceneryBtnClick(sender: AnyObject) {
        
        findPeopleBtn.selected = false
        findSceneryBtn.selected = true
        findHouseBtn.selected = false
    }
    @IBAction func findPeopleBtnClick(sender: AnyObject) {
        
        findPeopleBtn.selected = true
        findSceneryBtn.selected = false
        findHouseBtn.selected = false
    }

    @IBAction func sureButtonClick(sender: AnyObject) {
        
        var image = ""
        if findHouseBtn.selected == true{
            image = "hot_press"
        }else if findSceneryBtn.selected == true{
            image = "scenic_spot_press"
        }else if findPeopleBtn.selected == true{
            image = "personal_press"
        }
        if todo == nil{
            let uuid = NSUUID().UUIDString
            var todo = ToDoModel(id: uuid, image: image, title: inputTextFeild.text, date: choseDateView.date)
            todos.append(todo)
        }else{
            todo?.image = image
            todo?.title = inputTextFeild.text
            todo?.date = choseDateView.date
        
        
        }
        
        
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        inputTextFeild.resignFirstResponder()
        return true
    }
   override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
    
        super.touchesEnded(touches, withEvent: event)
        inputTextFeild.resignFirstResponder()
    }


}
