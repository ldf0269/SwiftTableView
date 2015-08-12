//
//  MoreViewController.swift
//  ToDo
//
//  Created by missummer on 15/8/12.
//  Copyright (c) 2015年 ldf. All rights reserved.
//

import UIKit

class MoreViewController: UITableViewController {

    var showArray = []
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "更多"
        showArray = ["我的收藏","修改密码","二维码名片","版本信息","意见反馈"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return showArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("moreCell", forIndexPath: indexPath) as! UITableViewCell
        
        
        cell.textLabel?.text = showArray[indexPath.row] as? String

        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("-----点击了第\(indexPath.row)行-------")
    }


}
