//
//  ContentView.swift
//  ToDo
//
//  Created by Pham on 3/3/23.
//

import SwiftUI

struct ContentView: View {
      @State var name: String = ""
      @ObservedObject var model = ToDoItemModel()
      @State var isPresented: Bool = false
      
    var body: some View {
          NavigationView {
                VStack {
                      List(model.toDoItem, id: \.id) { item in
                            Text(item.name)
                                  .swipeActions {
                                        Button {
                                              self.isPresented = true
                                        } label: {
                                              Label("Edit", systemImage: "pencil")
                                        }
                                        
                                        Button(role: .destructive) {
                                              print("Deleting Item")
                                        } label: {
                                              Label("Delete", systemImage: "trash.fill")
                                        }
                                  }
                      }
                      .listStyle(PlainListStyle())
                      
                      Button {
                            self.isPresented = true
                      } label: {
                            HStack {
                                Text("Add")
                                Image(systemName: "plus")
                          }
                      }
                }
                .sheet(isPresented: $isPresented) {
                      VStack {
                            Form {
                                  TextField("Name", text: $name)
                                        .onAppear {
                                              UITextField.appearance().clearButtonMode = .whileEditing
                                        }
                  
                                  Button {
                                        model.appendItemToList(name: name, tag: "")
                                        self.isPresented = false
                                  } label: {
                                        VStack {
                                              Text("Add")
                                        }
                                  }
                            }
                      }
                }
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
