//
//  PostGridViewModel.swift
//  InstagramTutorial
//
//  Created by Jun Gu on 3/29/24.
//

import Foundation

class PostGridViewModel: ObservableObject {
    private let user: User
    @Published var posts = [Post]()

    init(user: User) {
        self.user = user
    }

    @MainActor
    func fetchUserPosts() async throws {
        self.posts = try await PostService.fetchUserPosts(uid: user.id)

        for i in 0..<posts.count {
            posts[i].user = self.user
        }
    }
}
