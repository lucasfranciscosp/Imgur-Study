//
//  FeedCollectionCell.swift
//  Imgur-Study
//
//  Created by Clissia Bozzer Bovi on 26/06/24.
//

import SwiftUI
import API
struct MostViralCollectionCell: View {
    let model: MostViralModel

    private func getHeaderInfo() -> some View {

        return HStack(spacing: 8) {
            if let account = model.account_url {
                Text(account)
            }
            Text(".")
            if let epochTime = model.datetime {
                let dateText = DateWorker.getData(epochTime: epochTime)
                Text(dateText)
            }
        }
        .foregroundColor(Color(red: 0.151, green: 0.151, blue: 0.169, opacity: 0.6))
    }
    
    private func getPostTitle() -> some View {
        guard let title = model.title else { return Text("") }
        return Text("\(String(describing: title))")
                    .font(.system(size: 17))
                    .bold()
    }

    private func getRoundImage() -> some View {
        return Image("Image")
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFill()
                    .frame(width: 50, height: 50)
    }

    private func getFollowButton() -> some View {
        return GenericButton(color: Color(red: 0.14901960784313725, green: 0.592156862745098, blue: 0.6509803921568628), isTag: false, text: "Follow")
    }

    private func getTagButton() -> some View {
        return GenericButton(color: Color(red: 0.050980392156862744, green: 0.6509803921568628, blue: 0.5803921568627451), isTag: true, text: "Tag")
    }

    private func getTagScroll() -> some View {
        return ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())]) {
                ForEach(0..<3) { index in
                    getTagButton()
                }
            }
        }
        .padding(.horizontal, 0.0)
    }

    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                VStack {
                    HStack {
                        getRoundImage()
                        Spacer()
                        VStack(spacing: 4) {
                            getPostTitle()
                            getHeaderInfo()
                        }
                        Spacer()
                        Spacer()
                        getFollowButton()
                        Spacer()
                    }
                    .padding(.trailing, 0.0)

                    getTagScroll()
                        .frame(height: 28)
                }
                .padding([.top, .leading, .trailing])

                Image("Image2")
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 0)
            }
            .background(Color.white)
        }
        .frame(height: 553.0)
    }
}


