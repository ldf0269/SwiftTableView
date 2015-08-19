//
//  AnimateViewController.swift
//  ToDo
//
//  Created by missummer on 15/8/19.
//  Copyright (c) 2015年 ldf. All rights reserved.
//

import UIKit

class AnimateViewController: UIViewController {
    var fromVc:String?
    var view1:UIView?
    var view2:UIView?
    var view3:UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        if fromVc != nil{
            self.title = fromVc;
        }
        self.view.backgroundColor = UIColor.whiteColor()
        view1 = UIView()
        view1?.backgroundColor = UIColor.redColor()
        view1?.frame = CGRectMake(10, 74, 80, 80)
        self.view.addSubview(view1!)
        
        view2 = UIView()
        view2?.backgroundColor = UIColor.blueColor()
        view2?.frame = CGRectMake(10, 74 + 90, 80, 80)
        self.view.addSubview(view2!)
        
        view3 = UIView()
        view3?.backgroundColor = UIColor.greenColor()
        view3?.frame = CGRectMake((self.view.bounds.width - 80)*0.5, 100 + 2*90, 80, 80)
        self.view.addSubview(view3!)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
          
         UIView.animateWithDuration(1, animations: { () -> Void in
            self.view1!.center.x = self.view.bounds.width - self.view1!.center.x
            self.view2?.alpha = 0
            self.view3?.transform = CGAffineTransformMakeScale(1.5, 1.5)
            self.view3?.backgroundColor = UIColor.redColor()
            
         })
          
          self.spin()
       
        
    }
    func spin(){
    UIView.animateWithDuration(1, delay: 0, options: .CurveLinear, animations: { () -> Void in
        self.view3?.transform = CGAffineTransformRotate(self.view3!.transform, CGFloat(M_1_PI))
    }) { (finished) -> Void in
        self.spin()
        }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
