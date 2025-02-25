# Image Browser & Search App - Feature Design Document

## Overview

iOS app that allows users to browse images and perform a simple search using the [Picsum API](https://picsum.photos/v2/list). Since Flickr is not available in the UAE due to account issues, this app leverages the Picsum API, which provides a list of images. The app will display a grid of images with continuous scrolling, and users can search images by the author's name. Tapping an image opens a modal with the full-screen image and a placeholder "Lorem Ipsum" text acting as comments.

---
<div style="display: flex; gap: 20px; align-items: center;">
  <img src="https://i.ibb.co/dsK2MP8Q/Simulator-Screenshot-i-Phone-16-Pro-Max-2025-02-19-at-10-01-35.png" width="300" height="650" alt="Screenshot 1">
  <a href="https://ibb.co/QFXpY160"><img src="https://i.ibb.co/7Jbjr6Gh/Simulator-Screenshot-i-Phone-16-Pro-Max-2025-02-19-at-10-01-21.png" alt="Simulator-Screenshot-i-Phone-16-Pro-Max-2025-02-19-at-10-01-21" border="0" width="300" height="650"/></a>
</div>

## Requirements

- **API Integration**:  
  - Use the [Picsum API](https://picsum.photos/v2/list) for retrieving images.
  
- **Home Screen**:  
  - Display a grid of images, loading an initial set (e.g., 20 images).
  - Support infinite scrolling: when the user reaches the bottom, load more images automatically.

- **Search Functionality**:  
  - Include a search bar at the top that filters images based on the author's name (as the API does not support search).

- **Image Detail Modal**:  
  - Tapping an image should open a modal view showing:
    - The image in full-screen.
    - A section below with placeholder text ("Lorem Ipsum") to mimic comments, since the API doesn’t provide comment data.
    - A share button to share the image URL .
---

## Technology Stack

- **Language & Framework**:  
  - Swift
  - SwiftUI (SwiftUI is recommended for its modern declarative approach)
  - Kingfisher for cashing image

- **Networking**:  
  - `URLSession` for API requests, or an alternative networking library if preferred

- **Data Parsing**:  
  - Swift’s `Codable` for JSON parsing

