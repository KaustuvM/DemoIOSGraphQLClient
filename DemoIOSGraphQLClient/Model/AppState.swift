//
//  AppState.swift
//  DemoIOSGraphQLClient
//
//  Created by Kaustuv Mukherjee on 1/5/22.
//

import Foundation
import SwiftUI
import Apollo

enum LoadingStatus: String {
    case none
    case success
    case failure
    case notFound
}

struct ImageState {
    var loadingStatus = LoadingStatus.none
    var image: Image?
}

class AppState: ObservableObject {
    
    @Published var loadingStatus = LoadingStatus.none
    @Published var isHomeScreen = true
    @Published var imageStates = [GraphQLID : ImageState]()
    var currentId = 0
    
    var fruitsData: [Fruit] = []
    
    func fetchFruits() {
        NetworkManager.shared.apolloClient.fetch(query: GetFruitsQuery()) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let graphQLResult):
                guard let data = graphQLResult.data else {
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else {
                            return
                        }
                        self.loadingStatus = .notFound
                    }
                    return
                }
                if let fruits = data.fruits {
                    for fruit in fruits {
                        guard let fruit = fruit,
                              let title = fruit.title,
                              let headline = fruit.headline,
                              let image = fruit.image,
                              let gradientColors = fruit.gradientColors,
                              let color1 = gradientColors[0],
                              let color2 = gradientColors[1],
                              let description = fruit.description,
                              let sectionHeaders = fruit.sectionHeaders,
                              let sectionContents = fruit.sectionContents,
                              let nutrition = fruit.nutrition
                        else {
                            continue
                        }
                        self.imageStates[fruit.id] = ImageState()
                        var headers: [String] = []
                        var contents: [String] = []
                        var nutritionInfo: [String] = []
                        for header in sectionHeaders {
                            guard let header = header else {
                                continue
                            }
                            headers.append(header)
                        }
                        for content in sectionContents {
                            guard let content = content else {
                                continue
                            }
                            contents.append(content)
                        }
                        for element in nutrition {
                            guard let element = element else {
                                continue
                            }
                            nutritionInfo.append(element)
                        }
                        self.fruitsData.append(Fruit(id: fruit.id,
                                                     title: title,
                                                     headline: headline,
                                                     image: image,
                                                     gradientColors: [Color(color1), Color(color2)],
                                                     description: description,
                                                     sectionHeaders: headers,
                                                     sectionContents: contents,
                                                     nutrition: nutritionInfo))
                        self.fetchImage(image, fruit.id)
                    }
                }
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {
                        return
                    }
                    self.loadingStatus = .success
                }
            case .failure(_):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {
                        return
                    }
                    self.loadingStatus = .failure
                }
            }
        }
    }
    
    func fetchImage(_ strUrl: String, _ id: GraphQLID) {
        
        guard let urlComponents = URLComponents(string: strUrl),
              let url = urlComponents.url else {
                  return
              }
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self else {
                return
            }
            
            if let _ = error {
                DispatchQueue.main.async {
                    self.imageStates[id]?.loadingStatus = .notFound
                }
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                if let uiImage = UIImage(data: data) {
                    let image = Image(uiImage: uiImage)
                    DispatchQueue.main.async {
                        self.imageStates[id]?.loadingStatus = .success
                        self.imageStates[id]?.image = image
                    }
                } else {
                    DispatchQueue.main.async {
                        self.imageStates[id]?.loadingStatus = .failure
                    }
                }
            }
        }
        dataTask.resume()
        
    }
}
