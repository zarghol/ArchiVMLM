//
//  NewPostView+Logic.swift
//  ArchiVMLM
//
//  Created by Clément Nonn on 12/03/2021.
//

import Foundation
import Combine

extension NewPostView {
    final class Logic: ObservableObject {
        @Published var title = ""
        @Published var author = ""
        @Published var content = ""

        var dismissSubject = PassthroughSubject<Void, Never>()

        var areAllFieldsFilled: Bool { !title.isEmpty && !author.isEmpty && !content.isEmpty }

        private unowned var postManager: PostManager

        init(postManager: PostManager) {
            self.postManager = postManager
        }

        func createPost() {
            guard areAllFieldsFilled else { return }

            let newPost = Post(title: title, content: content, author: author)
            postManager.add(newPost)
            dismissSubject.send(())
        }
    }
}
