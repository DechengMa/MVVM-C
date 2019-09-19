//
//  ProfileCoordinator.swift
//  Photos
//
//  Created by Decheng Ma on 14/09/2019.
//  Copyright © 2019 Decheng Ma. All rights reserved.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var rootViewController: UIViewController {
        return profileViewController
    }
    
    // MARK: -
    
    private let profileViewController = ProfileViewController.instantiate()
    
}
