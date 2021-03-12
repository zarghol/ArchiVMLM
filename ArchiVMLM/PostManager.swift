//
//  PostManager.swift
//  ArchiVMLM
//
//  Created by Clément Nonn on 12/03/2021.
//

import Foundation
import Combine

final class PostManager: ObservableObject {
    @Published private(set) var posts: [Post]

    let postService: () -> [Post] // we just use a function to fetch the posts for now

    init(postService: @escaping () -> [Post]) {
        self.postService = postService
        self.posts = postService()
    }

    func add(_ post: Post) {
        posts.append(post)
    }
}
