//
//  ContentView.swift
//  Imgur-Study
//
//  Created by Lucas Francisco on 25/06/24.
//

import SwiftUI

struct MostViralFeed: View {
    @State private var searchText: String = ""
    let postList = [MostViralModel(title: "title of the post here", tags: ["tag1", "tag2", "tag3"], user: "name", userImage: "", postTime: "00h", imageId: "")]

    var body: some View {
        NavigationStack {
            VStack {
                MostViralCollectionView(postList: postList)
                    .padding(.top, 8)
                    .background(Color(red: 0, green: 0, blue: 0).opacity(0.3))
            }
            .navigationTitle("Most Viral")
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

#Preview {
    MostViralFeed()
}
