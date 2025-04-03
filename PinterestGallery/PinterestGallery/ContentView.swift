//
//  ContentView.swift
//  PinterestGallery
//
//  Created by Тулепберген Анель on 30.03.2025.
//

import SwiftUI

// ContentView.swift
struct ContentView: View {
    // Важно использовать StateObject, чтобы сервис не создавался заново
    @StateObject private var imageService = ImageService()
    
    let spacing: CGFloat = 10
    let columns = 2
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    PinterestGrid(imageService: imageService, columns: columns, spacing: spacing)

                        .padding(.horizontal, spacing)
                    
                    // Кнопка загрузки
                    if imageService.hasMoreImages {
                        Button(action: {
                            imageService.fetchImages()
                        }) {
                            if imageService.isLoading {
                                ProgressView()
                                    .padding()
                            } else {
                                Text("Load More")
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: 150)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        .disabled(imageService.isLoading)
                        .padding(.vertical, 20)
                    }
                }
            }
            .navigationTitle("Pinterest Gallery")
        }
        .onAppear {
            // Загружаем первые изображения только если массив пустой
            if imageService.gridItems.isEmpty {
                imageService.fetchImages()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
