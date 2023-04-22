//
//  SingleNoteView.swift
//  notes
//
//  Created by Qicheng Geng on 4/18/23.
//

import SwiftUI


struct SingleNoteView: View {
    @State private var noteText = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var myNotes: MyNotes

    var body: some View {
        VStack {
            TextEditor(text: $noteText)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(8)
                .padding()
            Spacer()
        }
        .navigationTitle("New Note")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // Perform any necessary actions here, e.g., saving the note
                    presentationMode.wrappedValue.dismiss()
                    if myNotes.folders.count > 0{
                        myNotes.folders[myNotes.folders.count - 1].notes.append(Note(text: noteText))
                    }else{
                        myNotes.folders.append(Folder(name: "App Team", notes: [Note(text: noteText)]))
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
