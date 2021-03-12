//
//  PostView.swift
//  ArchiVMLM
//
//  Created by Clément Nonn on 12/03/2021.
//

import SwiftUI

struct PostView: View {
    let post: Post

    var body: some View {
        VStack {
            HStack {
                Text(post.title)
                Spacer()
                Text(post.author)
            }
            Divider()
            Text(post.content)
        }.padding()
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(
            post: Post(
                title: "test",
                content: "this is a\ncontent",
                author: "Clement"
            )
        )
    }
}
