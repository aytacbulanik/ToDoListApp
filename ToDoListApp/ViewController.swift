//
//  ViewController.swift
//  ToDoListApp
//
//  Created by AYTAÇ BULANIK on 30.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var taskLabel : UILabel!
    @IBOutlet var taskField : UITextField!
    @IBOutlet var addButtonOut : UIButton!
    @IBOutlet var tableView : UITableView!
    
    var taskCount : Int = 0
    var taskArray : [TaskManager] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        addButtonOut.layer.cornerRadius = 8
        navigationBar.backgroundColor = UIColor.darkGray
        taskLabel.text = "\(taskCount)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let arrayRow = taskArray[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = arrayRow.taskName
        content.secondaryText = dateFormatter(date: arrayRow.taskDate)
        cell.layer.backgroundColor = UIColor.cyan.cgColor
        cell.contentConfiguration = content
        taskLabel.text = "\(taskCount)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
    
    @IBAction func addButtonPressed(_ sender : UIButton) {
        guard let task = taskField.text else {return}
        if task.isEmpty {
            alertSend()
        }else {
            let newTask = TaskManager(taskName: task.uppercased(), taskDate: Date())
            taskArray.append(newTask)
            taskField.text = ""
            taskCount += 1
            tableView.reloadData()
        }
        
    }
    
    func alertSend() {
        let alert = UIAlertController(title: "Uyarı !!!", message: "Lütfen bir görev giriniz", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    func dateFormatter(date : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let stringDate = formatter.string(from: date)
        return stringDate
    }

}

