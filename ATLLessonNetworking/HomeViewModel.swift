//
//  HomeViewModel.swift
//  ATLLessonNetworking
//
//  Created by Ayan on 25.11.23.
//

import Foundation

final class HomeViewModel {
    
    private enum Constant: String {
        case postURL = "posts"
    }
    
    var items: [Post]?
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getPosts(completion: @escaping(()->Void)) {
        networkManager.getObjects(
            type: [Post].self,
            urlParam: Constant.postURL.rawValue)
          { [weak self] result in
            switch result {
            case .success(let posts):
                self?.items = posts
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
