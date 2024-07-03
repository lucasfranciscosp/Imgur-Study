//
//  FeedCollectionCell.swift
//  Imgur-Study
//
//  Created by Clissia Bozzer Bovi on 26/06/24.
//

import SwiftUI
import API
struct MyFeedCollectionCell: View {
    let model: MyFeedModel

    private func getHeaderInfo() -> some View {

        return HStack(spacing: 8) {
            if let account = model.account_url {
                Text(account)
                    .lineLimit(1)
            }
            Text(".")
            if let epochTime = model.datetime {
                let dateText = DateWorker.getData(epochTime: epochTime)
                Text(dateText)
                    .lineLimit(1)
            }
        }
        .foregroundColor(Color(red: 0.151, green: 0.151, blue: 0.169, opacity: 0.6))
    }
    
    private func getPostTitle() -> some View {
        return Text("\(String(describing: model.title ?? ""))")
                    .font(.system(size: 17))
                    .multilineTextAlignment(.leading)
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

    private func getPoints() -> some View {
        return HStack(spacing: 16) {
            Image(systemName: "arrowshape.up.fill")
                .foregroundColor(Color(red: 0.06666666666666667, green: 0.5333333333333333, blue: 0.3058823529411765))

            Text((model.points != nil) ? "\(model.points!)" : "")

            Image(systemName: "arrowshape.down.fill").foregroundColor(Color(red: 0.06666666666666667, green: 0.5333333333333333, blue: 0.3058823529411765))
        }
        .frame(height: 52)
    }

    private func getComments() -> some View {
        return HStack(spacing: 16) {
            Image(systemName: "bubble.fill")
                .foregroundColor(Color(red: 0.06666666666666667, green: 0.5333333333333333, blue: 0.3058823529411765))

            Text((model.comment_count != nil) ? "\(model.comment_count!)" : "")
        }
        .frame(height: 52)
    }

    private func getShare() -> some View {
        return Button(action: {

        }, label: {
            Image(systemName: "arrowshape.turn.up.backward.2.fill")
                .foregroundColor(Color(red: 0.06666666666666667, green: 0.5333333333333333, blue: 0.3058823529411765))
                .scaleEffect(x: -1, y: 1)
                
        })
    }

    var body: some View {
        ZStack {
            VStack() {
                VStack {
                    HStack {
                        getRoundImage()
                        VStack(spacing: 4) {
                            HStack {
                                getPostTitle()
                                    .lineLimit(1)
                                Spacer()
                            }
                            HStack {
                                getHeaderInfo()
                                Spacer()
                            }
                        }
                        Spacer()
                        Spacer()
                        getFollowButton()
                    }
                    .padding(.trailing, 0.0)

                    getTagScroll()
                        .frame(height: 28)
                }
                .padding([.top, .leading, .trailing])

                AsyncImage(url: URL(string: model.images?.first?.link ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 393, height: 393)
                .scaledToFit()
                .padding(.all, 0)

                HStack(spacing: 86) {
                    getPoints()
                    getComments()
                    getShare()
                }
            }
            .background(Color.white)
        }
        .frame(height: 553.0)
    }
}


#Preview {
    MyFeedCollectionCell(model: MyFeedModel(title: "oioioi", account_url: "aaaaaaaaa"))
}

