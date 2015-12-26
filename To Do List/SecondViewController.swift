//
//  SecondViewController.swift
//  To Do List
//
//  Created by Jeremiah Onwubuya on 12/25/15.
//  Copyright © 2015 Jeremiah Onwubuya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var item: UITextField!
    
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDoList.append(item.text!) // when the button is pressed we would like to append the item the user typed to the toDoList array
        
        item.text = "" // once that is complete we want the text field to clear
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList") // it is imperative that the user data is stored when the applicatino is closed
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.item.delegate = self // this allows the viewController delegate to essentially control itself
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true) // when the user types outside of the text field we want the text field to close
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
      item.resignFirstResponder()
    
      return true // when the user hits the return key we would like the keypad to be released 
    }

}

