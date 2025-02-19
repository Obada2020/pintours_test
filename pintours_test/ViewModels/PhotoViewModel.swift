//
//  PhotoViewModel.swift
//  pintours_test
//
//  Created by Obada Alhalabi on 19/02/2025.
//

import Combine
import SwiftUI

@MainActor
class PhotoListViewModel: ObservableObject {
    //
    @Published var photos: [Photo] = []
    //
    @Published var isSearching: Bool = false
    //
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let interactor: PhotosListInteractor

    init(interactor: PhotosListInteractor) {
        self.interactor = interactor
    }

    func loadPhotosList(pageNumber: Int) async {
        isLoading = true
        errorMessage = nil
        let fetchedPhotos = await interactor.getPhotosList(
            pageNumber: pageNumber)
        self.photos.append(contentsOf: fetchedPhotos)
        isLoading = false
    }

}
