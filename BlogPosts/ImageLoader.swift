//  ImageLoader.swift

import Foundation
import Combine
import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil
    var url: String = ""
    
    init(url: String) {
        self.url = url
    }
    
    func load() async {
        if let cachedImage = ImageCache.shared.getImage(for: self.url) {
            await MainActor.run {
                self.image = cachedImage
            }
            return
        }
        
        guard let urlObject = URL(string: self.url) else {
            print("Invalid URL: \(self.url)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: urlObject)
            guard let downloadedImage = UIImage(data: data) else {
                print("Could not create UIImage from data.")
                return
            }
            
            await MainActor.run {
                ImageCache.shared.setImage(downloadedImage, for: self.url)
                self.image = downloadedImage
            }
        } catch {
            print("Failed to download image from \(self.url): \(error.localizedDescription)")
        }
    }
}
