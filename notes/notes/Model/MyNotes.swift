//
//  MyNotes.swift
//  notes
//
//  Created by Qicheng Geng on 4/18/23.
//

import Foundation

class MyNotes: ObservableObject{
    @Published var folders = [Folder]()
}

struct Note: Identifiable {
    var id = UUID()
    var text: String
}

struct Folder: Identifiable {
    var id = UUID()
    var name: String
    var notes: [Note]
}


var test = [
    Folder(name: "Academy", notes: [Note(text: "Today")]),
    Folder(name: "Life", notes: [Note(text: "Today")])
]
