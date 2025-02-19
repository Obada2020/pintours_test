//
//  PhotoListInteractor.swift
//  pintours_test
//
//  Created by Obada Alhalabi on 19/02/2025.
//

import Foundation

protocol PhotosListInteractorProtocol {
    func getPhotosList(pageNumber:Int) async -> [Photo]
}

final class PhotosListInteractor: PhotosListInteractorProtocol {
    //
    let baseURLString = "https://picsum.photos/v2/list"
    //
    func getPhotosList(pageNumber:Int) async -> [Photo] {
        let urlString = baseURLString + "?page=\(pageNumber)&limit=20"
        guard let url = URL(string: urlString) else {
            print("Invalid URL.")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let photos = try JSONDecoder().decode([Photo].self, from: data)
            return photos
        } catch {
            print("Failed to fetch photos: \(error.localizedDescription)")
            return []
        }
    }
}
