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

<p align="center">
  <img src="https://github.com/user-attachments/assets/c2fbc001-2c71-4f74-9a44-72fa9b24c805" width="300">
</p>

