//
//  PhotoTableViewCell.swift
//  Photos
//
//  Created by Decheng Ma on 14/09/2019.
//  Copyright © 2019 Decheng Ma. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    // MARK: - Static Properties
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: - Properties
    
    var didBuy: (() -> Void)?
    
    // MARK: -
    
    @IBOutlet private var titleLabel: UILabel!
    
    // MARK: -
    
    @IBOutlet private var thumbnailImageView: UIImageView!

    // MARK: -
    
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: -
    
    @IBOutlet private var buyButton: UIButton! {
        didSet {
            // Configure Buy Button
            buyButton.setTitle("Buy", for: .normal)
            
            // Add Target/Action
            buyButton.addTarget(self, action: #selector(buy(_:)), for: .touchUpInside)
        }
    }

    // MARK: -
    
    private var dataTask: URLSessionDataTask?
    
    // MARK: - Public API
    
    func configure(with presentable: PhotoPresentable) {
        // Configure Title Label
        titleLabel.text = presentable.title
        
        // Show/Hide Buy Button
        buyButton.isHidden = presentable.didBuyPhoto
        
        // Animate Activity Indicator View
        activityIndicatorView.startAnimating()
        
        guard let url = presentable.url else {
            return
        }
        
        // Create and Resume Data Task
        dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            guard let data = data else {
                return
            }
            
            // Create Image
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                // Update Thumbnail Image View
                self?.thumbnailImageView.image = image
            }
        }
        
        // Resume Data Task
        dataTask?.resume()
    }

    // MARK: - Overrides
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Cancel Data Task
        dataTask?.cancel()
        
        // Reset Thumnail Image View
        thumbnailImageView.image = nil
    }

    // MARK: - Actions
    
    @objc private func buy(_ sender: UIButton) {
        didBuy?()
    }

}
