//  BlogPost.swift
import Foundation

struct BlogPost: Codable {
    let title: String
    let body: String
    let author: String
    let createdOn: Date
}
