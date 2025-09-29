//  ImageCache.swift

import UIKit

class ImageCache {
    static let shared = ImageCache()
    private init() {}
    
    private var cache = [String:UIImage]()
}
