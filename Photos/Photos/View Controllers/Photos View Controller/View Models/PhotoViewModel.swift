//
//  PhotoViewModel.swift
//  Photos
//
//  Created by Decheng Ma on 14/09/2019.
//  Copyright © 2019 Decheng Ma. All rights reserved.
//

import Foundation

struct PhotoViewModel {
    
    // MARK: - Properties
    
    let photo: Photo
    
    // MARK: - Public API
    
    var title: String {
        return photo.title
    }
    
    var url: URL? {
        return photo.url
    }
    
    var didBuyPhoto: Bool {
        return UserDefaults.didBuy(photo)
    }
    
}

extension PhotoViewModel: PhotoPresentable {}
