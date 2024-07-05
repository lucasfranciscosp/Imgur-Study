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
    @State var caller: Int = 0
    @State var navTitle: String = "For you"
    @State var sorting: MyViewFilterSorting = .Newest
    @State var filterType: MyViewFilterType = .ForYou

    private func updatePostList() {
        MyFeedWorker.getPostList(filterType: filterType, sorting: sorting) { postList in
            self.postList = postList
            caller+=1
            print(caller)
        }
    }

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
                                filterType = .MostViral
                                updatePostList()
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
                                filterType = .UserSub
                                updatePostList()
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
                                filterType = .Trending
                                updatePostList()
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
                                filterType = .ForYou
                                updatePostList()
                            }) {
                                if navTitle == "For you" {
                                    Label("For you", systemImage: "checkmark")
                                        .foregroundColor(.green)
                                } else {
                                    Text("For you")
                                }
                            }

                            Divider()

                            Button(action: {
                                sorting = .Popular
                                updatePostList()
                            }) {
                                Label("Popular", systemImage: "heart")
                            }

                            Button(action: {
                                sorting = .Newest
                                updatePostList()
                            }) {
                                Label("Newest", systemImage: "gear")
                            }

                            Button(action: {
                                sorting = .Random
                                updatePostList()
                            }) {
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
                    updatePostList()
                }
    }
}

#Preview {
    MyFeed()
}
