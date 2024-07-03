//
//  FeedCollectionView.swift
//  Imgur-Study
//
//  Created by Clissia Bozzer Bovi on 26/06/24.
//

import SwiftUI

struct MyFeedCollectionView: View {
    var postList: MostViralList?

    var body: some View {
        if let postList = postList {
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(0..<postList.data.count) { index in
                        MyFeedCollectionCell(model: postList.data[index])
                    }
                }
            }
        }
    }
}

