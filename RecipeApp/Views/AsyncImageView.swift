//
//  AsyncImageView.swift
//  RecipeApp
//
//  Created by Micheal Bingham on 6/13/24.
//

import SwiftUI


struct AsyncImageView: View {
    @State private var image: UIImage? = nil
    @State private var isLoading = false
    
    let url: String
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
                    .onAppear(perform: loadImage)
            }
        }
    }
    
    private func loadImage() {
        if let cachedImage = ImageCache.shared.getImage(forKey: url) {
            self.image = cachedImage
            return
        }
        
        guard let imageUrl = URL(string: url) else { return }
        
        isLoading = true
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data, error == nil, let loadedImage = UIImage(data: data) else {
                return
            }
            
            ImageCache.shared.setImage(loadedImage, forKey: url)
            DispatchQueue.main.async {
                self.image = loadedImage
                self.isLoading = false
            }
        }.resume()
    }
}

#Preview {
    AsyncImageView(url: "")
}
