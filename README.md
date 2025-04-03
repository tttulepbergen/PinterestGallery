# Pinterest Gallery App

A SwiftUI application that displays images in a Pinterest-style layout with infinite scrolling functionality.

## Features

- 📌 **Pinterest-style grid layout** with dynamic column arrangement
- 🖼️ **Image loading** from [Picsum Photos](https://picsum.photos/) API
- 🔄 **Infinite scrolling** with "Load More" button
- ⏳ **Loading indicators** for better user experience
- 🚦 **Error handling** for network issues
- 🔄 **Pull-to-refresh** functionality
- 🏗️ **Masonry layout** algorithm for optimal image placement

## Technical Implementation

### Architecture

- **MVVM pattern** with ObservableObject for state management
- **Generic image caching** system
- **Decoupled components** for maintainability

### Key Components

1. **`ImageService`**
   - Manages pagination with `currentPage` and `perPage`
   - Handles loading states with `isLoading` and `hasMoreImages`
   - Uses Combine patterns with `@Published` properties

2. **`PinterestGrid`**
   - Implements masonry layout with dynamic column arrangement
   - Uses `AsyncImage` with caching for efficient image loading
   - Includes proper error states and loading indicators

3. **`CachedAsyncImage`**
   - Custom view wrapper around `AsyncImage` with memory caching
   - Prevents redundant image downloads
   - Smooth transitions between loading states


## Screenshots


![Simulator Screenshot - iPhone 16 Pro - 2025-04-03 at 20 12 04](https://github.com/user-attachments/assets/ad59e87e-b8be-495e-80ea-d4bc5f32231b?raw=true&width=300)

