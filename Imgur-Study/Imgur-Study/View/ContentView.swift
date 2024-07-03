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
            MostViralFeed()
                .tabItem {
                    Image(systemName: "house")
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
