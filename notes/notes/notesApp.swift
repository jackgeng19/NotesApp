//
//  notesApp.swift
//  notes
//
//  Created by Qicheng Geng on 4/18/23.
//

import SwiftUI

@main
struct notesApp: App {
    @StateObject private var myNotes = MyNotes()
    
    var body: some Scene {
        WindowGroup {
            ContentView(myNotes: myNotes)
        }
    }
}
