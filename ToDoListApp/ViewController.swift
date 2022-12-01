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
    
    var taskArray : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Deneme"
        return cell
    }
    @IBAction func addButtonPressed(_ sender : UIButton) {
       
    }

}

