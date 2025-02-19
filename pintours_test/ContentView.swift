//
//  ContentView.swift
//  pintours_test
//
//  Created by Obada Alhalabi on 19/02/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = PhotoListViewModel(
        interactor: PhotosListInteractor())
    @State private var searchText = ""
    @Namespace private var namespace
    @State private var selectedPhoto: Photo? = nil
    @State private var pageNumber = 3

    // Filter photos based on the author's name
    private var filteredPhotos: [Photo] {
        if searchText.isEmpty {
            return viewModel.photos
        } else {
            return viewModel.photos.filter { photo in
                photo.author!.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {

                let lastPhotoID: String? =
                    searchText.isEmpty ? viewModel.photos.last?.id : nil

                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: 10),
                        GridItem(.flexible(), spacing: 10),
                    ],
                    spacing: 20
                ) {
                    ForEach(filteredPhotos, id: \.id) { photo in
                        photoView(for: photo, lastPhotoID: lastPhotoID)
                    }
                }
                .padding()

                if viewModel.isLoading && !filteredPhotos.isEmpty {
                    ProgressView(
                        "Loading next page..."
                    )
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                } else if viewModel.isLoading && filteredPhotos.isEmpty {
                    ProgressView()
                        .padding()
                }
            }
            .refreshable {
                pageNumber = 3
                viewModel.photos.removeAll()
                Task {
                    await viewModel.loadPhotosList(pageNumber: pageNumber)
                }
            }
            .navigationTitle("Photo Gallery")
            .sheet(item: $selectedPhoto) { photo in
                SelectedImageView(selectedData: photo)
                    .presentationDetents([.fraction(0.75), .large])
                    .presentationDragIndicator(.visible)
            }
            .searchable(text: $searchText, prompt: "Search photos by author...")
            .onAppear {
                Task {
                    await viewModel.loadPhotosList(pageNumber: pageNumber)
                }
            }
        }
    }

    @ViewBuilder
    private func photoView(for photo: Photo, lastPhotoID: String?) -> some View
    {
        PhotoCardView(photo: photo)
            .matchedGeometryEffect(id: photo.id, in: namespace)
            .buttonStyle(PlainButtonStyle())
            .onTapGesture {
                selectedPhoto = photo
            }
            .onAppear {
                // Trigger infinite scrolling only when not filtering
                if let lastPhotoID = lastPhotoID, photo.id == lastPhotoID {
                    Task {
                        pageNumber += 1  // Update the state variable directly
                        await viewModel.loadPhotosList(pageNumber: pageNumber)
                    }
                }
            }
    }
}
