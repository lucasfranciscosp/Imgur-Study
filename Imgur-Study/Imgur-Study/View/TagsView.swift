//
//  TagsView.swift
//  Imgur-Study
//
//  Created by Lucas Francisco on 01/07/24.
//

import SwiftUI

struct TagsView: View {
    
    @State private var viewModel = ViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            GridTagsView()
            
            .navigationTitle("Teste Titulo")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for #tags")
        }
    }
}

#Preview {
    TagsView()
}
