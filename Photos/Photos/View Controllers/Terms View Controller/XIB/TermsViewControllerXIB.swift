//
//  TermsViewControllerXIB.swift
//  Photos
//
//  Created by Decheng Ma on 14/09/2019.
//  Copyright © 2019 Decheng Ma. All rights reserved.
//

import UIKit

class TermsViewControllerXIB: TermsViewController {
    
    // MARK: - Static Properties
    
    static var nibName: String {
        return String(describing: self)
    }
    
    // MARK: - Properties
    
    private let termsOfService: String
    
    // MARK: -
    
    @IBOutlet var termsOfServiceLabel: UILabel! {
        didSet {
            termsOfServiceLabel.text = termsOfService
        }
    }
    
    // MARK: - Initialization
    
    init(termsOfService: String) {
        // Set Terms of Service
        self.termsOfService = termsOfService
        
        super.init(nibName: TermsViewControllerXIB.nibName, bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
