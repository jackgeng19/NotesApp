//
//  FolderCell.swift
//  notes
//
//  Created by Qicheng Geng on 4/18/23.
//

import SwiftUI

struct FolderCell: View {
    var name: String
    var body: some View{
        HStack{
            Image(systemName: "folder")
            Text(name)
        }
    }
}

struct FolderCell_Previews: PreviewProvider {
    static var previews: some View {
        FolderCell(name: "Note")
    }
}
