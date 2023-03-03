//
//  AddItemView.swift
//  ToDo
//
//  Created by Pham on 3/3/23.
//

import SwiftUI

struct AddItemView: View {
      @ObservedObject var model = ToDoItemModel()
      @Binding var name: String
      @State var showContentView: Bool = false
      
    var body: some View {
          VStack {
                Form {
                      TextField("Name", text: $name)
      
                      Button {
                            model.appendItemToList(name: name, tag: "")
                      } label: {
                            VStack {
                                  Text("Add")
                            }
                      }
                }
          }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
          AddItemView(name: .constant("Hello"))
    }
}
