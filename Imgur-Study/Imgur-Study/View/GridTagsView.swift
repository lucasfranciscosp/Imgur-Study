//
//  GridTagsView.swift
//  Imgur-Study
//
//  Created by Lucas Francisco on 01/07/24.
//

import SwiftUI

struct GridTagsView: View {
    
    let items = [0, 1, 2, 3, 4, 5]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(items, id: \.self) { item in
                    NavigationLink(destination: TagsDetailView()) {
                        CardView()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    GridTagsView()
}
