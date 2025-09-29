//  PostImageView.swift
import SwiftUI

struct PostImageView : View {
    @StateObject var imageLoader : ImageLoader
    
    init(url: String) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body : some View {
        if imageLoader.image == nil {
            ProgressView("loading blog posts...")
                .frame(width: 50, height: 50) // Give it a fixed size
                .task {
                    await imageLoader.load()
                }
        } else {
            Image(uiImage: imageLoader.image!)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}
