//
//  ImageCache.swift
//  RecipeApp
//
//  Created by Micheal Bingham on 6/13/24.
//

import UIKit


/// A simple image cache using NSCache.
class ImageCache {
    static let shared = ImageCache() ///< Singleton instance of the image cache.
    
    private let cache = NSCache<NSString, UIImage>() ///< The underlying NSCache instance.
    
    /// Retrieves an image from the cache.
    /// - Parameter key: The key for the cached image.
    /// - Returns: The cached image, or nil if no image is cached for the key.
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }
    
    /// Stores an image in the cache.
    /// - Parameters:
    ///   - image: The image to cache.
    ///   - key: The key for the cached image.
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: NSString(string: key))
    }
}
