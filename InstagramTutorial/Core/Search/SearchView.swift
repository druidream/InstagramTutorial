//
//  SearchView.swift
//  InstagramTutorial
//
//  Created by Jun Gu on 3/22/24.
//

import SwiftUI

struct SearchView: View {

    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(0...15, id: \.self) { user in
                        HStack {
                            Image("batman-2")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                            .clipShape(Circle())

                            VStack {
                                Text("batman")
                                    .fontWeight(.semibold)

                                Text("Bruce Wayne")
                            }
                            .font(.footnote)

                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
