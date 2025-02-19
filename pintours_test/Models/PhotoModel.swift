//
//  PhotoModel.swift
//  pintours_test
//
//  Created by Obada Alhalabi on 19/02/2025.
//

struct Photo: Decodable , Equatable , Identifiable {
    let id, author: String?
    let width, height: Int?
    let url, downloadURL: String?

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
    //
    static func == (lhs: Photo, rhs: Photo) -> Bool {
            return lhs.id == rhs.id
    }
}
