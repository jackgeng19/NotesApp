//
//  SingleNoteView.swift
//  notes
//
//  Created by Qicheng Geng on 4/18/23.
//

import SwiftUI


struct SingleNoteView: View {
    @State private var noteText: String
    var input: String
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var myNotes: MyNotes
    var folderIndex: Int?
    var noteIndex: Int?

    init(input: String, myNotes: MyNotes, folderIndex: Int? = nil, noteIndex: Int? = nil) {
        self.input = input
        self.myNotes = myNotes
        self.folderIndex = folderIndex
        self.noteIndex = noteIndex
        _noteText = State(initialValue: input == " " ? "" : input)
    }
    
    var body: some View {
        VStack {
            TextEditor(text: $noteText)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(8)
                .padding()
            Spacer()
        }
        .navigationTitle(noteText)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    presentationMode.wrappedValue.dismiss()

                    if let folderIndex = folderIndex, let noteIndex = noteIndex {
                        myNotes.folders[folderIndex].notes[noteIndex].text = noteText
                    } else {
                        if myNotes.folders.count > 0 {
                            myNotes.folders[myNotes.folders.count - 1].notes.append(Note(text: noteText))
                        } else {
                            myNotes.folders.append(Folder(name: "App Team", notes: [Note(text: noteText)]))
                        }
                    }
                } label: {
                    Text("Done")
                }
            }
        }
    }
}



//struct SingleNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleNoteView()
//    }
//}
