//
//  ViewController.swift
//  ToDo
//
//  Created by missummer on 15/8/11.
//  Copyright (c) 2015年 ldf. All rights reserved.
//

import UIKit

var todos:[ToDoModel] = []
var resultTodos:[ToDoModel] = []
func dateFromString(dateStr:String)->NSDate?{
  
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date

}
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,UISearchDisplayDelegate{
    @IBOutlet weak var tableView: UITableView!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        todos = [ToDoModel(id: "1", image: "hot_press", title: "1.去找房子", date:dateFromString("2012-11-11")!),ToDoModel(id: "2", image: "scenic_spot_press", title: "2.去找景点", date:dateFromString("2013-11-11")!),ToDoModel(id: "3", image: "personal_press", title: "3.去找面包人", date:dateFromString("2014-11-11")!)]
    
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.leftBarButtonItem = editButtonItem()
        tableView.frame = CGRectMake(0, -searchDisplayController!.searchBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)
        var contentOffSet = tableView.contentOffset
        contentOffSet.y +=  searchDisplayController!.searchBar.frame.size.height
        tableView.contentOffset = contentOffSet
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
    
        return 70
    
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       if tableView == searchDisplayController?.searchResultsTableView{
        return resultTodos.count
        }else{
        return todos.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todocell")as! UITableViewCell
        
        var todo = todos[indexPath.row]as ToDoModel
        
        if tableView == searchDisplayController?.searchResultsTableView{
            var todo = resultTodos[indexPath.row]as ToDoModel
        }else{
            var todo = todos[indexPath.row]as ToDoModel
        }
        var imageView = cell.viewWithTag(101)as! UIImageView
        
        var title = cell.viewWithTag(102)as! UILabel
        
        var date = cell.viewWithTag(103) as! UILabel
        
        imageView.image = UIImage(named: todo.image)
        
        title.text = todo.title
        
        let location = NSLocale.currentLocale()
        
        let fomatter = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd", options: 0, locale: location)
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = fomatter
        
        date.text = dateFormatter.stringFromDate(todo.date)

        return cell
    
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            
            todos.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
          
        
        }
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return editing
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let todo = todos.removeAtIndex(sourceIndexPath.row)
        todos.insert(todo, atIndex: destinationIndexPath.row)
    }
   override func setEditing(editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    
        self.tableView.setEditing(editing, animated: animated)
    
    }
    //search
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool{
        
        self.filterContentForSearchText(searchString)
    
        return true
    }
    func filterContentForSearchText(searchText: String) {
        
        // 使用过滤方法过滤数组
        
        resultTodos = todos.filter({(todo: ToDoModel) -> Bool in
            
            let stringMatch = todo.title.rangeOfString(searchText)
            
            return stringMatch != nil
            
            })
        
    }
    @IBAction func close(segue:UIStoryboardSegue){
        println("closed")
        tableView.reloadData()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "edittodo"{
        var vc = segue.destinationViewController as! AddViewController
            var indexPath = tableView.indexPathForSelectedRow()
            if let index = indexPath{
               vc.todo = todos[index.row]
            
            }
        
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

