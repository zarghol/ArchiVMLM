//
//  PostList.swift
//  ArchiVMLM
//
//  Created by Clément Nonn on 12/03/2021.
//

import SwiftUI

struct PostList: View {
    @EnvironmentObject var postManager: PostManager
    @State private var newPostIsPresented = false

    var body: some View {
        NavigationView {
            List(postManager.posts) { post in
                NavigationLink(destination: PostView(post: post)) {
                    Text(post.title)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(action: { newPostIsPresented = true }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $newPostIsPresented) {
                NewPostView()
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
            .environmentObject(
                PostManager(
                    postService: { [
                        Post(
                            title: "first post",
                            content: "hello world",
                            author: "Clement"
                        ),
                        Post(
                            title: "second post",
                            content: "hello web",
                            author: "Clement"
                        ),
                    ] }
                )
            )
    }
}
