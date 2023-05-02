//
//  Model.swift
//  notepad
//
//  Created by Mansur on 29.04.2023.
//

import Foundation

var ToDoItems: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
}

func addItem(nameItem: String, is Complited: Bool = false) {
    ToDoItems.append(["Name": nameItem, "isComplited": false])
}


func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
}

func changeState(at item: Int) -> Bool {
    ToDoItems[item]["isComplited"] = !(ToDoItems[item]["isComplited"] as! Bool)
    return ToDoItems[item]["isComplited"] as! Bool
}
