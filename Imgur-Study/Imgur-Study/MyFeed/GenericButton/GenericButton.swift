//
//  TagButton.swift
//  Imgur-Study
//
//  Created by Clissia Bozzer Bovi on 27/06/24.
//

import SwiftUI
import API

struct GenericButton: View {
    let color: Color
    let isTag: Bool
    let text: String

    var body: some View {
        Button {
            MyFeedWorker.getMostViralModelList { list in
                print(list)
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .foregroundColor(color)
                    .frame(width: 64, height: 28)
                HStack(spacing: 4) {
                    if(isTag) { Text("#") }
                    Text(text)
                        .lineLimit(1)
                }
                .foregroundColor(.white)
            }
        }

    }
}

#Preview {
    GenericButton(color: Color(red: 0.14901960784313725, green: 0.592156862745098, blue: 0.6509803921568628), isTag: false, text: "Follow")
}
