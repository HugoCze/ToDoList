//
//  ToDoListView.swift
//  QuickToDoListVol4
//
//  Created by Hugo Czerniawski on 19/04/2022.
//

import SwiftUI

struct ToDoListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ToDo.title, ascending: true)],
        animation: .default)
    private var toDos: FetchedResults<ToDo>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(toDos) {
                    listedToDo in
                    NavigationLink(destination: Text(listedToDo.title!)
                        .font(.largeTitle)
                        .padding())
                    {
                        Text(listedToDo.title!)
                            .lineLimit(1)
                }
                    }
                .onDelete(perform: deleteItems)
            }
            
                .navigationTitle("Quick ToDOs")
                .toolbar {
                    ToolbarItem {
                        NavigationLink(destination: AddToDoView()){
                            Label("Add Item", systemImage: "plus.bubble")
                        }
                    }
                }
            }
        }

private func deleteItems(offsets: IndexSet) {
    withAnimation {
        offsets.map { toDos[$0] }.forEach(viewContext.delete)
        
            try? viewContext.save()
            }
        }
    }



struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
