//
//  ContentView.swift
//  notes
//
//  Created by Qicheng Geng on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var myNotes: MyNotes
    @State var search: String = ""
    @State var newFolderName: String = ""
    @State var showing = false
    
    var body: some View {
        ZStack {
            NavigationView{
                List{
                    TextField("Search", text: $search)
                    Section(header:
                        Text("On Jack's iPhone")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)){
                                if myNotes.folders.count > 0 {
                                    FolderCell(name: "All on My iPhone")
                                }
                                FolderCell(name: "iCloud")
                                ForEach(myNotes.folders) { folder in
                                    FolderCell(name: folder.name)
                                }
                                .onDelete(perform: { indexSet in
                                    myNotes.folders.remove(atOffsets: indexSet)
                                })
                    }
                    .textCase(nil)
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Folders")
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        EditButton()
                    }
                    ToolbarItemGroup(placement: .bottomBar){
                        Image(systemName: "folder.badge.plus")
                            .onTapGesture {
                                showing.toggle()
                            }
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            if showing{
                NewFolderView($showing, with: myNotes)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let testNotes = MyNotes()
        testNotes.folders = test
        return ContentView(myNotes: testNotes)
    }
}



