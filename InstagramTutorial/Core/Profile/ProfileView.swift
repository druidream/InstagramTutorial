//
//  ProfileView.swift
//  InstagramTutorial
//
//  Created by Jun Gu on 3/22/24.
//

import SwiftUI

struct ProfileView: View {

    let user: User
    
    private var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }

    var body: some View {
            ScrollView {
                // header
                ProfileHeader(user: user)

                // post grid view
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
