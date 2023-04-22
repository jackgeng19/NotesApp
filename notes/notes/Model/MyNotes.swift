//
//  MyNotes.swift
//  notes
//
//  Created by Qicheng Geng on 4/18/23.
//

import Foundation

class MyNotes: ObservableObject{
    @Published var folders = [Folder]()
    
    func removeNote(index: IndexSet) {
        folders[0].notes.remove(atOffsets: index)
    }
}

struct Folder: Identifiable {
    var id = UUID()
    var name: String
    var notes: [Note]
}

struct Note: Identifiable {
    var id = UUID()
    var text: String
}

func mergeFolder(f1: Folder, f2: Folder) -> Folder {
    var mergedNotes = f1.notes
    mergedNotes.append(contentsOf: f2.notes)
    return Folder(name: "All on My iPhone", notes: mergedNotes)
}


var test = [
    Folder(name: "Academy", notes: [Note(text: "Today")]),
    Folder(name: "Life", notes: [Note(text: "Today")])
]
