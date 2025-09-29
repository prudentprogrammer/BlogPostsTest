//  BlogListViewModel.swift
import Combine
import Foundation

class BlogListViewModel : ObservableObject {
    @Published var blogPosts = [BlogPost]()
    
    func fetchBlogPosts() async {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
          do {
              let (data, _) = try await URLSession.shared.data(from: url)
              let parsedBlogPosts = try JSONDecoder().decode([BlogPost].self, from: data)
              await MainActor.run {
                  blogPosts = parsedBlogPosts
                  print(blogPosts)
              }
          } catch {
            print("Error occured as \(error)")
          }
    }
}


