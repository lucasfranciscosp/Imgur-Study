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
    @State var navTitle: String = "For you"
    @State var sorting: MyViewFilterSorting = .Newest
    @State var filterType: MyViewFilterType = .ForYou

    var body: some View {
    
        NavigationStack {
                    VStack {
                        MyFeedCollectionView(postList: postList)
                            .padding(.top, 8)
                    }
                    .navigationBarItems(trailing: HStack {
                        Menu {
                            Button(action: {
                                navTitle = "Most viral"
                            }) {
                                if navTitle == "Most viral" {
                                    Label("Most viral", systemImage: "checkmark")
                                        .foregroundColor(.green)
                                } else {
                                    Text("Most viral")
                                }
                            }
                            Button(action: {
                                navTitle = "User sub"
                                // chama os user sub
                            }) {
                                if navTitle == "User sub" {
                                    Label("User sub", systemImage: "checkmark")
                                        .foregroundColor(.green)
                                } else {
                                    Text("User sub")
                                }
                            }
                            Button(action: {
                                navTitle = "Trending"
                                // chama trending
                            }) {
                                if navTitle == "Trending" {
                                    Label("Trending", systemImage: "checkmark")
                                        .foregroundColor(.green)
                                } else {
                                    Text("Trending")
                                }
                            }
                            Button(action: {
                                navTitle = "For you"
                                // chama for you
                            }) {
                                if navTitle == "For you" {
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
                    .searchable(text: $searchText, placement: .automatic, prompt: "Images, #tags and @users")
                    .navigationTitle(navTitle)
                }
                .onAppear {
                    MyFeedWorker.getPostList(filterType: filterType, sorting: sorting) { postList in
                        self.postList = postList
                    }
                }
    }
}

#Preview {
    MyFeed()
}
