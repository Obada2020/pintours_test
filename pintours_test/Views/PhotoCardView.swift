//
//  PhotoCardView.swift
//  pintours_test
//
//  Created by Obada Alhalabi on 19/02/2025.
//

import Kingfisher
import SwiftUI

struct PhotoCardView: View {
    let photo: Photo

    private enum ViewConstants {
        static let cardHeight: CGFloat = 200
    }

    var body: some View {
        VStack {
            GeometryReader { geometry in
                KFImage(URL(string: photo.downloadURL ?? ""))
                    .placeholder {
                        Rectangle().fill(.gray)
                            .frame(
                                width: geometry.size.width,
                                height: ViewConstants.cardHeight
                            )
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                    }

                    .setProcessor(
                        ResizingImageProcessor(referenceSize: geometry.size)
                    )
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 24))
            }
            .frame(height: ViewConstants.cardHeight)
            Text(photo.author ?? "Unknown")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)

        }
    }
}
