//
//  LoginViewModel.swift
//  InstagramTutorial
//
//  Created by Jun Gu on 3/26/24.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""

    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
