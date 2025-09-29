//  BlogPost.swift
import Foundation

struct BlogPost: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    var imageURL: String? {
        return "https://picsum.photos/id/\(id % 100)/200/200" // Uses a random image service
    }
}
