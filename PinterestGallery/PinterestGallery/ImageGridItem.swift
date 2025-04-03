//
//  ImageGridItem.swift
//  PinterestGallery
//
//  Created by Тулепберген Анель on 30.03.2025.
//

import SwiftUI

struct ImageGridItem: Identifiable, Hashable {
    let id: String  // ✅ Используем URL как уникальный ID
    let height: CGFloat
    let imgURL: String
}
