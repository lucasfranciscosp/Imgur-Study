//
//  FeedView.swift
//  Imgur-Study
//
//  Created by Lucas Francisco on 28/06/24.
//

import SwiftUI

struct FeedView: View {
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            Text("Hello World")
            
            .navigationTitle("Teste Titulo")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Images, #tags and @users")
        }
    }
}

#Preview {
    FeedView()
}
