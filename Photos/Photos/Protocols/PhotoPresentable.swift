//
//  PhotoPresentable.swift
//  Photos
//
//  Created by Decheng Ma on 14/09/2019.
//  Copyright © 2019 Decheng Ma. All rights reserved.
//

import Foundation

protocol PhotoPresentable {
    
    // MARK: - Properties
    
    var title: String { get }
    var url: URL? { get }
    
    // MARK: -
    
    var didBuyPhoto: Bool { get }
    
}
