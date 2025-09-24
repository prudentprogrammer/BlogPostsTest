//  BlogListViewModel.swift
import Combine

class BlogListViewModel : ObservableObject {
    @Published var blogPosts = [BlogPost]()
}


