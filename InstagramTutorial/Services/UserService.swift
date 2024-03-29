//
//  UserService.swift
//  InstagramTutorial
//
//  Created by Jun Gu on 3/29/24.
//

import Foundation
import Firebase

struct UserService {

    static func fetchAllUser() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
