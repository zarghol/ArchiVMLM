//
//  NewPostView.swift
//  ArchiVMLM
//
//  Created by Clément Nonn on 12/03/2021.
//

import SwiftUI

extension NewPostView {
    fileprivate struct InternalView: View {
        @ObservedObject var logic: Logic
        @Environment(\.presentationMode) var presentationMode

        var body: some View {
            NavigationView {
                VStack {
                    TextField("Title", text: $logic.title)
                    TextField("Author", text: $logic.author)
                    TextEditor(text: $logic.content)
                }
                .padding()
                .onReceive(logic.dismissSubject) { self.dismiss() }
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button(action: dismiss) { Text("Cancel") }
                    }

                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: logic.createPost) { Text("Create") }
                            .disabled(!logic.areAllFieldsFilled)
                    }
                }
            }
        }

        private func dismiss() {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct NewPostView: View {
    @EnvironmentObject var postManager: PostManager

    var body: some View {
        InternalView(logic: Logic(postManager: postManager))
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
            .environmentObject(PostManager(postService: { [] }))
    }
}
