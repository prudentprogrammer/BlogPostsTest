//  ImageCache.swift

import UIKit

class ImageCache {
    static let shared = ImageCache()
    private init() {}
    
    internal var cache = [String:UIImage]()
    
    func getImage(for url: String) -> UIImage? {
        return cache[url]
    }
    
    func setImage(_ image: UIImage, for url: String) {
        cache[url] = image
    }
}
