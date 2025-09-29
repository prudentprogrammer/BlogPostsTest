//  ContentView.swift
//  BlogPosts

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: BlogListViewModel = BlogListViewModel()
    var body: some View {
        
        if viewModel.blogPosts.isEmpty {
            ProgressView("loading blog posts...")
                .task {
                    await viewModel.fetchBlogPosts()
                }
        } else {
            List {
                ForEach(viewModel.blogPosts, id: \.id) {post in
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
            }
            .refreshable {
                await viewModel.fetchBlogPosts()
            }
        }
    }
}

#Preview {
    ContentView()
}
