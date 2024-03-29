//
//  SearchViewModel.swift
//  InstagramTutorial
//
//  Created by Jun Gu on 3/29/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        Task { try await fetchAllUsers() }
    }

    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUser()
    }
}
