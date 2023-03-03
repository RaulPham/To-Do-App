//
//  ContentView.swift
//  ToDo
//
//  Created by Pham on 3/3/23.
//

import SwiftUI

struct ContentView: View {
      enum ColorList: String, CaseIterable {
            case red
            case orange
            case yellow
            case green
            case blue
            
            var color: Color {
                  switch self {
                        case .red:
                              return Color.red
                              
                        case .orange:
                              return Color.orange
                              
                        case .yellow:
                              return Color.yellow
                              
                        case .green:
                              return Color.green
                              
                        case .blue:
                              return Color.blue
                  }
            }
      }
      
      @State var name: String = ""
      @State var color: ColorList = .orange
      @ObservedObject var model = ToDoItemModel()
      @State var isPresented: Bool = false
      
    var body: some View {
          NavigationView {
                VStack {
                      List(model.toDoItem, id: \.id) { item in
                            Text(item.name)
                                  .foregroundColor(color.color)
                                  .swipeActions {
                                        Button(role: .destructive) {
                                              if let index = model.toDoItem.firstIndex(of: item) {
                                                    model.removeItemFromList(index: index)
                                              }
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
                                  
                                  List {
                                        Picker("Color", selection: $color) {
                                              ForEach(ColorList.allCases, id: \.self) { color in
                                                    Text(color.rawValue.capitalized)
                                                          .foregroundColor(color.color)
                                              }
                                        }
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
