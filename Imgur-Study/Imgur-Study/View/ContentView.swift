//
//  ContentView.swift
//  Imgur-Study
//
//  Created by Lucas Francisco on 28/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
            Spacer()
            Image(systemName: "line.3.horizontal.decrease.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 27, height: 22)
            Image(systemName: "bell")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 22)
                
        }
        .padding(.trailing)
        
        
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Your feed")
                }
            TagsView()
                .tabItem {
                    Image(systemName: "number")
                    Text("Tags")
                }
            PhotoSelector()
                .tabItem {
                    Image(systemName: "square.and.arrow.up")
                    Text("New Post")
                }
                .onTapGesture {
                    PhotoSelector()
                }
            Text("Implementar")
                .tabItem {
                    Image(systemName: "clock")
                    Text("Chat")
                }
            Text("Implementar")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    ContentView()
}
