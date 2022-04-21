//
//  QuickToDoListVol4App.swift
//  QuickToDoListVol4
//
//  Created by Hugo Czerniawski on 19/04/2022.
//

import SwiftUI

@main
struct QuickToDoListVol4App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


struct Previews_QuickToDoListVol4App_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
