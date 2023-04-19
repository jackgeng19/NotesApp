//
//  NewFolderView.swift
//  notes
//
//  Created by Qicheng Geng on 4/18/23.
//

import SwiftUI

struct NewFolderView: View {
    @ObservedObject var myNotes: MyNotes
    @State var newFolderName = ""
    @Binding var showing: Bool
    
    init(_ showing: Binding<Bool>, with myNotes: MyNotes) {
        self.myNotes = myNotes
        self._showing = showing
    }
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color(.systemGray3))
                    .frame(width: geo.size.width * 0.7, height: geo.size.width * 0.4, alignment: .center)
                VStack{
                    Text("New Folder")
                        .font(.headline)
                    Text("Enter a name for this folder")
                        .font(.subheadline)
                    Spacer()
                    TextField("Name", text: $newFolderName)
                        .frame(width: 200, height: 10)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(7)
                    Spacer()
                    Color.gray.frame(width: 200, height: CGFloat(1))
                    HStack{
                        Button(action: {
                            showing.toggle()
                        }){
                            Text("Cancel")
                                .frame(maxWidth: .infinity)
                                
                        }
                        Button(action: {
                            myNotes.folders.append(Folder(name: newFolderName, notes: [Note(text: "New Note")]))
                            showing.toggle()
                        }){
                            Text("Save")
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                .frame(width: geo.size.width * 0.7, height: geo.size.width * 0.35)
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}

//struct NewFolderView_Previews: PreviewProvider {
//    static var previews: some View {
//        let testNotes = MyNotes()
//        @State var showing = false
//        NewFolderView($showing, with: testNotes)
//    }
//}
