//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Pranav Arjun on 01/03/20.
//  Copyright © 2020 Pranav Arjun. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDoList : [ToDoItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let toDo1 = ToDo()
//               toDo1.toDoName = "Wake Up"
//
//               let toDo2 = ToDo()
//               toDo2.toDoName = "Learn iOS"
//
//               toDoList = [toDo1,toDo2]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDoItems = try? context.fetch(ToDoItem.fetchRequest()) as? [ToDoItem] {
                toDoList = coreDataToDoItems
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoIdentifier", for: indexPath)
        
        let toDo = toDoList[indexPath.row]
        
        cell.textLabel?.text = toDo.toDoName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let selectedToDos = toDoList[indexPath.row]
        performSegue(withIdentifier: "completeToDoIdentifier", sender: selectedToDos)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let completeVc = segue.destination as? CompleteToDoViewController{
            if let toDo = sender as? ToDoItem {
                completeVc.toDo = toDo
            }
        }
    }
    

}

//extension ToDoTableViewController: CreatingToDoDelegate {
//    func updateToDoList(toDo: ToDo) {
//        self.toDoList.append(toDo)
//        self.tableView.reloadData()
//    }
//}
