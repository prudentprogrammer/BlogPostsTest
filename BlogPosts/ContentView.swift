//  ContentView.swift
//  BlogPosts

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: BlogListViewModel = BlogListViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }.onAppear {
            Task {
                await viewModel.fetchBlogPosts()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
