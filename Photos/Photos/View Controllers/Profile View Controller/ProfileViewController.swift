//
//  ProfileViewController.swift
//  Photos
//
//  Created by Decheng Ma on 14/09/2019.
//  Copyright © 2019 Decheng Ma. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, Storyboardable {

    // MARK: - Storyboardable
    
    static var storyboardName: String {
        return "Profile"
    }
    
    // MARK: - Properties
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            // Configure Title Label
            titleLabel.text = title
        }
    }
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Set Title
        title = "Profile"
    }

}
