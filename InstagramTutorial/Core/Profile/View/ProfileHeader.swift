//
//  ProfileHeader.swift
//  InstagramTutorial
//
//  Created by Jun Gu on 3/25/24.
//

import SwiftUI

struct ProfileHeader: View {

    let user: User

    @State private var showEditProfile = false

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())

                Spacer()

                HStack(spacing: 8) {
                    UserStatView(value: 3, title: "Posts")

                    UserStatView(value: 12, title: "Followers")

                    UserStatView(value: 24, title: "Following")
                }
            }
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    Text("Chadwick Bozeman")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }

                if let bio = user.bio {
                    Text("Wakanda Forever")
                        .font(.footnote)
                }

                Text(user.username)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            // action button
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("Follow user..")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundStyle(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    )
            }

            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            Text("Edit profile view")
        }
    }
}

#Preview {
    ProfileHeader(user: User.MOCK_USERS[0])
}
