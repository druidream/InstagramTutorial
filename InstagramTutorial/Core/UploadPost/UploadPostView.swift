//
//  UploadPostView.swift
//  InstagramTutorial
//
//  Created by Jun Gu on 3/25/24.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {

    @State private var caption = ""
    @State private var imagePickerPresented = false

    @Binding var tabIndex: Int

    @StateObject var viewModel = UploadPostViewModel()

    var body: some View {
        VStack {
            // action tool bar
            HStack {
                Button {
                    clearPostDateAndReturnToFeed()
                } label: {
                    Text("Cancel")
                }

                Spacer()

                Text("New Post")
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    Task {
                        try await viewModel.uploadPost(caption: caption)
                        clearPostDateAndReturnToFeed()
                    }
                } label: {
                    Text("Upload")
                }
            }
            .padding(.horizontal)

            // post image and caption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }

                TextField("Enter your caption", text: $caption, axis: .vertical)
            }
            .padding()

            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }

    func clearPostDateAndReturnToFeed() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
