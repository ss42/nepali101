//
//  ViewController.swift
//  nepali101
//
//  Created by Sanjay Shrestha on 8/9/16.
//  Copyright © 2016 Dreams and Ideas. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var expandTableView: UITableView!
    var selectedIndex = -1
    var dataArray : [[String:String]] = [["Menu" : "Alphabet", "Button1" : "Vowels", "Button2" : "Consonent", "Button3" : "Number"], ["Menu" : "Basic","Button1" : "Level 1", "Button2" : "Level 2", "Button3" : "Level 3"], ["Menu" : "Introduction"], ["Menu" : "Travel"] ]
    override func viewDidLoad() {
        super.viewDidLoad()
        expandTableView.dataSource = self
        expandTableView.delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! MenuViewCell
        
        let menuItems = dataArray[indexPath.row]
        cell.menu.text = menuItems["Menu"]
        cell.button1.text = menuItems["Button1"]
        cell.button2.text = menuItems["Button2"]
        cell.button3.text = menuItems["Button3"]
        

        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(selectedIndex == indexPath.row) {
            return 176;
        } else {
            return 60;
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(selectedIndex == indexPath.row) {
            selectedIndex = -1
        } else {
            selectedIndex = indexPath.row
        }
        self.expandTableView.beginUpdates()
        self.expandTableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic )
        self.expandTableView.endUpdates()
    }


}

