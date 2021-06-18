//
//  ViewController.swift
//  Todoy
//
//  Created by MiciH on 6/17/21.
//

import UIKit

class TodoyTableViewController: UIViewController {
    
//    var item = Item()
    var todos = [Item(title: "apple", done: true), Item(title: "banana", done: false), Item(title: "pear", done: false)]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTodos()
        configureTableView()
    }
    
    func configureTodos(){
        
    }


    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        var textFiled = UITextField()
        
        let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
            if let title = textFiled.text{
                let newItem = Item(title: title , done: false)
                self.todos.append(newItem)
                
                //add the item to the plist
                let encoder = PropertyListEncoder()
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        alert.addTextField { alertTextFiled in
            textFiled = alertTextFiled
        }
        
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
        
    }
}

extension TodoyTableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todos[indexPath.row].done.toggle()
        DispatchQueue.main.async {
            tableView.reloadData()
        }
    }
}

extension TodoyTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.row].title
        
        if todos[indexPath.row].done == false{
            cell.accessoryType = .none
        }
        else{
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    
}

