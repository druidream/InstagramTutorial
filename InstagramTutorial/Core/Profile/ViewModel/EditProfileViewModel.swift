//
//  EditProfileViewModel.swift
//  InstagramTutorial
//
//  Created by Jun Gu on 3/29/24.
//

import PhotosUI
import Firebase
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject {

    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
