//
//  CompleteToDoViewController.swift
//  ToDo List
//
//  Created by Pranav Arjun on 01/03/20.
//  Copyright © 2020 Pranav Arjun. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    @IBOutlet weak var toDoNameLabel: UILabel!
    var toDo : ToDoItem? = nil
    
    //var toDo = ToDo()
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoNameLabel.text = toDo?.toDoName
        
    }
                
        
    
    

    @IBAction func completeToDoTapped(_ sender: UIButton) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if toDo != nil {
                context.delete(toDo!)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
        
       

}
}


//if let toDos = toDoTableVC?.toDoList {
//           var index  = 0
//           for x in toDos {
//               if x.toDoName == toDo.toDoName {
//                   toDoTableVC.toDoList.remove(at: index)
//                   toDoTableVC.tableView.reloadData()
//           }
//               index += 1
//       }
//   }
//       navigationController?.popViewController(animated: true)
