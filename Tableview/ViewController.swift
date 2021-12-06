//
//  ViewController.swift
//  Tableview
//
//  Created by administrator on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    // Create this array at the top of your class as a property
    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]

    @IBOutlet weak var inputTaskText: UITextField!
    @IBOutlet weak var beastButton: UIButton!
    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabelView.dataSource = self
        tabelView.delegate = self
    }

    @IBAction func beastButtonClicked(_ sender: Any) {
        addTaskToTableView(inputTaskText.text!)
    }
    
    private func addTaskToTableView(_ taskText: String){
        if !taskText.isEmpty {
            tasks.append(taskText)
            tabelView.reloadData()
            inputTaskText.text = ""
            inputTaskText.placeholder = ""
        }else{
            inputTaskText.placeholder = "Please, Add Task"
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    // how many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    // how should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
            // set text label to the model that is corresponding to the row in array
        cell.textLabel?.text = tasks[indexPath.row]
            // return cell so that Table View knows what to render in each row
        return cell
    }
    
    // this for swip to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
