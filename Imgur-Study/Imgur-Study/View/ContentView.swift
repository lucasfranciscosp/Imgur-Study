//
//  ContentView.swift
//  Imgur-Study
//
//  Created by Lucas Francisco on 28/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            MyFeed()
                .tabItem {
                    Image(systemName: "house")
                        .environment(\.symbolVariants, .none)
                    Text("Your Feed")
                }
            TagsView()
                .tabItem {
                    Image(systemName: "number")
                    Text("Tags")
                }
            PhotoSelector()
                .tabItem {
                    Image(systemName: "square.and.arrow.up")
                        .environment(\.symbolVariants, .none)
                    Text("New Post")
                }
                .onTapGesture {
                    PhotoSelector()
                }
            Text("Implementar")
                .tabItem {
                    Image(systemName: "ellipsis.message")
                        .environment(\.symbolVariants, .none)
                    Text("Chat")
                }
            Text("Implementar")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                        .environment(\.symbolVariants, .none)
                    Text("Profile")
                }
        }
        .accentColor(.green)
    }
}

#Preview {
    ContentView()
}
