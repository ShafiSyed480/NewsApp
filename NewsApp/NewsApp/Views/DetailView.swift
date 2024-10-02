//
//  DetailView.swift
//  NewsApp
//
//  Created by MacBook on 01/10/24.
//

import SwiftUI

struct DetailView: View {
    
    @State var article: Article
    
    var body: some View {
        
        VStack {
            if let title = article.title {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            if let image = article.image {
                AsyncImage(url: URL(string: image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 400, height: 400)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    Image(systemName: "photo.fill")
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .frame(width: 400, height: 400)
                        .cornerRadius(10)
                }
            } else {
                Image(systemName: "photo.fill")
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
            if let description = article.welcomeDescription {
                Text(description)
            }
            
            if let author = article.author {
                Text("- \(author)")
                    .frame(width: 200, height: 50, alignment: .bottomTrailing)
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(article: Article(author: "", url: "", source: "", title: "", welcomeDescription: "", image: "", date: nil))
    }
}
