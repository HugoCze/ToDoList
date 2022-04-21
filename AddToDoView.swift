//
//  AddToDoView.swift
//  QuickToDoListVol4
//
//  Created by Hugo Czerniawski on 19/04/2022.
//

import SwiftUI

struct AddToDoView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var toDoTitle = ""
    @FocusState var titleFocus: Bool
    
    var body: some View {
        VStack {
            TextField("Type something you are going to do: ", text: $toDoTitle)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .focused($titleFocus)
                .submitLabel(.go)
                .onSubmit {
                    addToDo()
                }
                .padding()
                .toolbar {
                    Button(action: {
                        addToDo()
                        
                    }) {
                        Text("Add to List")
                    }
                }
            Spacer()
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                titleFocus = true
            }
        }
        
    }
    
    func addToDo() {
        let newToDo = ToDo(context: viewContext)
        newToDo.title = toDoTitle
        
        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddToDoView()
        }
    }
}
