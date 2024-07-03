//
//  FeedView.swift
//  Imgur-Study
//
//  Created by Lucas Francisco on 28/06/24.
//

import SwiftUI

struct FeedView: View {
    @State var searchText: String = ""
    @State var actualViewSelected: String = "Most viral"
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Implementar: " + actualViewSelected)
                Spacer()
            }
            .navigationBarItems(trailing: HStack {
                Menu {
                    Button(action: {
                        actualViewSelected = "Most viral"
                        // chama most viral
                    }) {
                        if actualViewSelected == "Most viral" {
                            Label("Most viral", systemImage: "checkmark")
                                .foregroundColor(.green)
                        } else {
                            Text("Most viral")
                        }
                    }
                    Button(action: {
                        actualViewSelected = "User sub"
                        // chama os user sub
                    }) {
                        if actualViewSelected == "User sub" {
                            Label("User sub", systemImage: "checkmark")
                                .foregroundColor(.green)
                        } else {
                            Text("User sub")
                        }
                    }
                    Button(action: {
                        actualViewSelected = "Trending"
                        // chama trending
                    }) {
                        if actualViewSelected == "Trending" {
                            Label("Trending", systemImage: "checkmark")
                                .foregroundColor(.green)
                        } else {
                            Text("Trending")
                        }
                    }
                    Button(action: {
                        actualViewSelected = "For you"
                        // chama for you
                    }) {
                        if actualViewSelected == "For you" {
                            Label("For you", systemImage: "checkmark")
                                .foregroundColor(.green)
                        } else {
                            Text("For you")
                        }
                    }
                    Divider()
                    Button(action: { /* Ação para Popular */ }) {
                        Label("Popular", systemImage: "heart")
                    }
                    Button(action: { /* Ação para Newest */ }) {
                        Label("Newest", systemImage: "gear")
                    }
                    Button(action: { /* Ação para Random */ }) {
                        Label("Random", systemImage: "shuffle")
                    }
                } label: {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.green)
                }
                
                Button(action: {
                    // Ação do botão de filtro
                }) {
                    Image(systemName: "bell")
                        .foregroundColor(.green)
                }
            })
            .searchable(text: $searchText, placement: .automatic, prompt: "Search for #tags")
            .navigationTitle(actualViewSelected)
        }
    }
}

#Preview {
    FeedView()
}
