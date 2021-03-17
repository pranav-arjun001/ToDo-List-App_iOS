//
//  CreateToDo.swift
//  ToDo List
//
//  Created by Pranav Arjun on 01/03/20.
//  Copyright © 2020 Pranav Arjun. All rights reserved.
//

import UIKit

//protocol CreatingToDoDelegate: class {
//    func updateToDoList(toDo: ToDo)
//}

class CreateToDo: UIViewController {
    @IBOutlet weak var toDoTextField: UITextField!
    @IBOutlet weak var addToDoLabel: UILabel!
    
    //weak var delegate : CreatingToDoDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addToDoTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newToDo = ToDoItem(context: context)
            if let name =  toDoTextField.text {
                newToDo.toDoName = name
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
        
        
            }
    }
    }

//let newToDo = ToDo()
//if let name = toDoTextField.text {
//    newToDo.toDoName = name
//    if let delegate = delegate {
//        delegate.updateToDoList(toDo: newToDo)
//    }
//    navigationController?.popViewController(animated: true)
}
