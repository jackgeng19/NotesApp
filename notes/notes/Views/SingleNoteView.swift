//
//  SingleNoteView.swift
//  notes
//
//  Created by Qicheng Geng on 4/18/23.
//

import SwiftUI

import SwiftUI

struct SingleNoteView: View {
    @State private var noteText = ""
    @Environment(\.presentationMode) var presentationMode

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
                Button("Done") {
                    // Perform any necessary actions here, e.g., saving the note
                    presentationMode.wrappedValue.dismiss()
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
