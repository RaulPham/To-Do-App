//
//  ToDoItemModel.swift
//  ToDo
//
//  Created by Pham on 3/3/23.
//

import Foundation

class ToDoItemModel: ObservableObject {
      @Published var toDoItem: [ToDoItem] = []
      
      func appendItemToList(name: String) {
            toDoItem.append(ToDoItem(name: name))
      }
      
      func removeItemFromList(index: Int) {
            toDoItem.remove(at: index)
      }
}
