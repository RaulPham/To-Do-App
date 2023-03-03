//
//  ToDoItem.swift
//  ToDo
//
//  Created by Pham on 3/3/23.
//

import Foundation

struct ToDoItem: Identifiable {
      var id: UUID = UUID()
      var name: String
      var tag: String
}
