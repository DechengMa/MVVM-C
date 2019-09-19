//
//  TermsViewController.swift
//  Photos
//
//  Created by Decheng Ma on 14/09/2019.
//  Copyright © 2019 Decheng Ma. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    
    // MARK: - Properties
    
    var didCancel: (() -> Void)?

    // MARK: - Actions
    
    @IBAction func cancel(_ sender: Any) {
        didCancel?()
    }

}
