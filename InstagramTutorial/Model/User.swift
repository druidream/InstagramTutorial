//
//  User.swift
//  InstagramTutorial
//
//  Created by Jun Gu on 3/25/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: "batman-2", fullname: "Bruce Wayne", bio: "Gothem's Dark Knight", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venom", profileImageUrl: "batman-2", fullname: "Bruce Wayne", bio: "Gothem's Dark Knight", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "iron-man-1", profileImageUrl: "iron-man-1", fullname: "Bruce Wayne", bio: "Gothem's Dark Knight", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "blackpanther", profileImageUrl: "black-panther-1", fullname: "Bruce Wayne", bio: "Gothem's Dark Knight", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "spiderman", profileImageUrl: "spiderman", fullname: "Bruce Wayne", bio: "Gothem's Dark Knight", email: "batman@gmail.com"),
    ]
}
