//
//  ToDoItemModel.swift
//  ToDo
//
//  Created by Pham on 3/3/23.
//

import Foundation

class ToDoItemModel: ObservableObject {
      @Published var toDoItem: [ToDoItem] = []
      
      func appendItemToList(name: String, tag: String) {
            toDoItem.append(ToDoItem(name: name, tag: tag))
      }
}
