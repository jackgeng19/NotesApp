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
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, -20)
                            .foregroundColor(.gray)
                        TextField("Search", text: $search)
                        Image(systemName: "mic.fill")
                            .padding(.trailing, -20)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    Section(header:
                        Text("On Jack's iPhone")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom, 7)
                            .padding(.leading, -15)
                            .foregroundColor(.black)){
                                if myNotes.folders.count > 0 {
                                    FolderCell(name: "All on My iPhone")
                                }
                                FolderCell(name: "iCloud")
                                ForEach(myNotes.folders) { folder in
                                    NavigationLink(destination: FolderNotesView(folder: folder)) {
                                        FolderCell(name: folder.name)
                                    }
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
                            .padding(.trailing, 10)
                    }
                    ToolbarItemGroup(placement: .bottomBar){
                        Image(systemName: "folder.badge.plus")
                            .foregroundColor(.yellow)
                            .padding(.leading, 10)
                            .onTapGesture {
                                showing.toggle()
                            }
                        NavigationLink(destination: SingleNoteView()){
                            Image(systemName: "square.and.pencil")
                                .padding(.trailing, 5)
                        }
                    }
                }
            }
            .accentColor(Color(red: 255/255, green: 200/255, blue: 46/255))
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



