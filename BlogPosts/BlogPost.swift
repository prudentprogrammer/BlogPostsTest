//  BlogPost.swift
import Foundation

struct BlogPost: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
