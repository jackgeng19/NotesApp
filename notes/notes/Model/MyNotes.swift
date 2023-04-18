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

struct Folder: Identifiable {
    var id = UUID()
    var name: String
}

var test = [
    Folder(name: "Academy"),
    Folder(name: "Life")
]
