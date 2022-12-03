//
//  ViewController.swift
//  ToDoListApp
//
//  Created by AYTAÇ BULANIK on 30.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var taskLabel : UILabel!
    @IBOutlet var taskField : UITextField!
    @IBOutlet var addButtonOut : UIButton!
    @IBOutlet var tableView : UITableView!
    
    var taskCount : Int = 0
    var taskArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        taskLabel.text = "\(taskCount)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let rowCell = indexPath.row
        cell.textLabel?.text = taskArray[rowCell]
        taskLabel.text = "\(taskCount)"
        
        return cell
    }
    
    @IBAction func addButtonPressed(_ sender : UIButton) {
        guard let task = taskField.text else {return}
        taskArray.append(task)
        taskField.text = ""
        taskCount += 1
        tableView.reloadData()
    }

}

