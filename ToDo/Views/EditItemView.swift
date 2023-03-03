//
//  EditItemView.swift
//  ToDo
//
//  Created by Pham on 3/3/23.
//

import SwiftUI

struct EditItemView: View {
      @ObservedObject var model = ToDoItemModel()
      @State var name: String
      @Binding var isPresented: Bool
      
    var body: some View {
          VStack {
                Form {
                      TextField("Name", text: $name)
                            .onAppear {
                                  UITextField.appearance().clearButtonMode = .whileEditing
                            }
                      
                      VStack {
                            HStack {
                                  Button {
                                        model.appendItemToList(name: name, tag: "")
                                        self.isPresented = false
                                  } label: {
                                        VStack {
                                              Text("Commit")
                                        }
                                  }
                                  
                                  Spacer()
                                  
                                  Button(role: .cancel) {
                                        self.isPresented = false
                                  } label: {
                                        VStack {
                                              Text("Cancel")
                                        }
                                  }
                            }
                      }
                }
          }
    }
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
          EditItemView(name: "", isPresented: .constant(false))
    }
}
