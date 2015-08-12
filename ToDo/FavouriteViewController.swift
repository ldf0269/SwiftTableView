//
//  FavouriteViewController.swift
//  ToDo
//
//  Created by missummer on 15/8/12.
//  Copyright (c) 2015年 ldf. All rights reserved.
//

import UIKit

class FavouriteViewController: UIViewController {

   
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sexView: UISegmentedControl!
    @IBOutlet weak var birthDay: UIDatePicker!
    @IBOutlet weak var heightView: UISlider!
    @IBOutlet weak var haveHouse: UISwitch!
     var alertView:UIAlertView?
    override func viewDidLoad() {
        super.viewDidLoad()
     heightView.value = 170.0
        // Do any additional setup after loading the view.
        
    }
    @IBAction func heightChange(sender: AnyObject) {
        var slide = sender as! UISlider
        var i = Int(slide.value)
       heightLabel.text = "\(i)CM"
    }
    @IBAction func rightBarButtonClick(sender: AnyObject) {
        let sexText = sexView.selectedSegmentIndex == 0 ? "高富帅":"白富美"
        let gre = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        let gnnn = gre?.components(NSCalendarUnit.YearCalendarUnit, fromDate: birthDay.date, toDate: now, options: NSCalendarOptions(0))
        let age = gnnn?.year
        let have = haveHouse.on ? "有房" : "没房"
        let heightStr = heightLabel.text!
        alertView = UIAlertView()
        alertView!.title = "我要脱单"
        alertView!.message = "我叫\(nameTextField.text),今年\(age!)岁,标准\(sexText),身高\(heightStr),\(have),求交往!!!"
        alertView!.addButtonWithTitle("确定")
        NSTimer.scheduledTimerWithTimeInterval(10, target:self, selector:"dismiss:", userInfo:alertView, repeats:false)
        alertView!.show()
        
        
    }
    func dismiss(timer:NSTimer){
        alertView!.dismissWithClickedButtonIndex(0, animated:true)
        println("正在匹配.......")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
    super.touchesEnded(touches, withEvent: event)
        nameTextField.resignFirstResponder()
    }

}
