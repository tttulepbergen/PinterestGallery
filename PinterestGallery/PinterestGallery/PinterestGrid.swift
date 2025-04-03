//
//  PinterestGrid.swift
//  PinterestGallery
//
//  Created by Тулепберген Анель on 30.03.2025.
//

import SwiftUI

struct PinterestGrid: View {
    @ObservedObject var imageService: ImageService  // ✅ Вместо простого массива
    let columns: Int
    let spacing: CGFloat

    var body: some View {
        print("Rendering PinterestGrid")  // ✅ Проверка, пересоздаётся ли Grid
        let arrangedColumns = arrangeIntoColumns(items: imageService.gridItems, columnCount: columns)

        return HStack(alignment: .top, spacing: spacing) {  // <-- Явный return
            ForEach(arrangedColumns, id: \.self) { columnImages in
                VStack(spacing: spacing) {
                    ForEach(columnImages) { image in
                        AsyncImage(url: URL(string: image.imgURL), transaction: Transaction(animation: .easeInOut)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(height: image.height)
                            case .success(let img):
                                img.resizable()
                                    .scaledToFill()
                                    .frame(width: (UIScreen.main.bounds.width / CGFloat(columns)) - spacing,
                                           height: image.height)
                                    .clipped()
                                    .cornerRadius(10)
                                    .transition(.opacity) // Добавили анимацию появления
                            case .failure:
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .frame(height: image.height)
                                    .foregroundColor(.red)
                            @unknown default:
                                EmptyView()
                            }
                        }

                    }
                }
                .frame(maxWidth: (UIScreen.main.bounds.width / CGFloat(columns)) - spacing)
            }
        }
    }


    // 📌 Алгоритм равномерного распределения по колонкам
    private func arrangeIntoColumns(items: [ImageGridItem], columnCount: Int) -> [[ImageGridItem]] {
        var columns = Array(repeating: [ImageGridItem](), count: columnCount)
        var columnHeights = Array(repeating: CGFloat.zero, count: columnCount)
        
        for item in items {
            if let minIndex = columnHeights.firstIndex(of: columnHeights.min() ?? 0) {
                columns[minIndex].append(item)
                columnHeights[minIndex] += item.height + spacing
            }
        }
        
        return columns
    }
}
