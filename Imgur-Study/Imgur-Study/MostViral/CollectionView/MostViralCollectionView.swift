//
//  FeedCollectionView.swift
//  Imgur-Study
//
//  Created by Clissia Bozzer Bovi on 26/06/24.
//

import SwiftUI

struct MostViralCollectionView: View {
    var postList: [MostViralModel]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem(.flexible())]) {
                ForEach(0..<postList.count) { index in
                    MostViralCollectionCell(model: postList[index])
                }
            }
        }
    }
}

