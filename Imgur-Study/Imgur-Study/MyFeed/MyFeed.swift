//
//  ContentView.swift
//  Imgur-Study
//
//  Created by Lucas Francisco on 25/06/24.
//

import SwiftUI

struct MyFeed: View {
    @State private var searchText: String = ""
    @State var postList: MyFeedList?

    var body: some View {
        NavigationStack {
            VStack {
                MyFeedCollectionView(postList: postList)
                    .padding(.top, 8)
                    .background(Color(red: 0, green: 0, blue: 0).opacity(0.3))
            }
            .navigationTitle("Most Viral")
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .onAppear {
            MyFeedWorker.getMostViralModelList { list in
                self.postList = list
                print(postList?.data.first)
            }
        }
    }
}

#Preview {
    MyFeed()
}
