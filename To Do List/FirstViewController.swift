//
//  FirstViewController.swift
//  To Do List
//
//  Created by Jeremiah Onwubuya on 12/25/15.
//  Copyright © 2015 Jeremiah Onwubuya. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var toDoListTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil) {
        
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String] // we want any data the user pases to the toDoList array to be stored when the application is closeed 
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count // we want the array to only display the number of items the user has set on their to do list
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row) // allows the user to swipe left and delete an item on the list
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "String") // once an item has been deleted from the array, the new array count is stored on the device
            
            toDoListTable.reloadData() // updating the UITableView 
            
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData()
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        toDoListTable.reloadData()
    }
    

}

