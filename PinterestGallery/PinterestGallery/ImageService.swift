//
//  ImageService.swift
//  PinterestGallery
//
//  Created by Тулепберген Анель on 30.03.2025.
//

import SwiftUI

class ImageService: ObservableObject {
    @Published var gridItems: [ImageGridItem] = []
    @Published var isLoading = false
    @Published var hasMoreImages = true
    
    private var currentPage = 1
    private let perPage = 5
    
    func fetchImages() {
        guard !isLoading && hasMoreImages else { return }

        isLoading = true
        print("⏳ Loading page \(currentPage)")

        let urlString = "https://picsum.photos/v2/list?page=\(currentPage)&limit=\(perPage)"

        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else { return }

            defer { DispatchQueue.main.async { self.isLoading = false } }

            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("❌ No data received")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode([ImageResponse].self, from: data)
                print("✅ Received \(decodedData.count) items")

                DispatchQueue.main.async {
                    if decodedData.isEmpty {
                        print("🏁 No more images available")
                        self.hasMoreImages = false
                        return
                    }

                    let newImages = decodedData.map {
                        ImageGridItem(
                            id: $0.download_url,  // Используем оригинальный URL как ID
                            height: CGFloat.random(in: 150...400),
                            imgURL: $0.download_url  // Убрали UUID
                        )
                    }

                    print("➕ Adding \(newImages.count) new images (total: \(self.gridItems.count + newImages.count))")

                    self.gridItems.append(contentsOf: newImages)
                    self.currentPage += 1
                }
            } catch {
                print("❌ Decoding error: \(error)")
            }
        }.resume()
    }


    func reset() {
        currentPage = 1
        gridItems = []
        hasMoreImages = true
    }
}
