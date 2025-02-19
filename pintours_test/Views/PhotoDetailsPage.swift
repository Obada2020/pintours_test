//
//  PhotoDetailsPage.swift
//  pintours_test
//
//  Created by Obada Alhalabi on 19/02/2025.
//

import Kingfisher
import SwiftUI

struct SelectedImageView: View {
    var selectedData: Photo
    @State private var showShareSheet = false
    @State private var animateText = false
    var body: some View {
        VStack {

            if selectedData.downloadURL != nil {
                KFImage(
                    URL(
                        string: selectedData.downloadURL ?? ""
                    )
                )
                .resizable()
                .aspectRatio(
                    contentMode: .fill
                )
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: 300
                )
                .clipped()

            } else {

                Color.gray
                    .frame(
                        maxWidth: UIScreen.main.bounds.width
                    )
                    .frame(
                        height: 300
                    )
            }

            HStack {
                Image(
                    systemName: "heart"
                )
                .resizable()
                .frame(
                    width: 20,
                    height: 20
                )
                .symbolEffect(
                    .bounce.up.byLayer,
                    options: .nonRepeating
                )
                .padding(
                    5
                )
                .symbolEffect(
                    .bounce.up.byLayer,
                    options: .nonRepeating
                )
                .padding(
                    .leading,
                    10
                )
                Image(
                    systemName: "bubble.right"
                )
                .resizable()
                .frame(
                    width: 20,
                    height: 20
                )
                .padding(
                    5
                )
                .symbolEffect(
                    .bounce.up.byLayer,
                    options: .nonRepeating
                )
                Image(
                    systemName: "paperplane"
                )
                .resizable()
                .symbolEffect(
                    .bounce.up.byLayer,
                    options: .nonRepeating
                )
                .frame(
                    width: 20,
                    height: 20
                )
                .padding(
                    5
                )
                Spacer()
                Image(
                    systemName: "square.and.arrow.up"
                )
                .resizable()
                .frame(
                    width: 20,
                    height: 25
                )
                .padding(
                    .horizontal
                )
                .symbolEffect(
                    .bounce.up.byLayer,
                    options: .nonRepeating
                )
                .onTapGesture {
                    showShareSheet = true
                }

            }
            .frame(
                height: 40
            )

            Spacer()
            Text(
                selectedData.author ?? ""
            )
            .font(
                .title
            )
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding(
                .horizontal
            )
            Spacer()

            if animateText {

                AnimatedText(
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                )
                .padding(
                    .horizontal
                )

            }

        }
        .padding(
            .horizontal
        )
        Spacer()
            .ignoresSafeArea()
            .onAppear {
                animateText
                    .toggle()
            }
            .sheet(
                isPresented: $showShareSheet
            ) {
                ShareSheet(
                    activityItems: [selectedData.downloadURL ?? ""]
                )
            }
    }

}

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(
        context: Context
    ) -> UIActivityViewController {
        UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities
        )
    }

    func updateUIViewController(
        _ uiViewController: UIActivityViewController,
        context: Context
    ) {
    }
}
