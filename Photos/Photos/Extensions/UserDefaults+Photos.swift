//
//  UserDefaults+Photos.swift
//  Photos
//
//  Created by Decheng Ma on 14/09/2019.
//  Copyright © 2019 Decheng Ma. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    // MARK: - Keys
    
    private enum Keys {
        
        static let token = "token"
        static let purchases = "purchases"
        
    }
    
    // MARK: - Sign In/Sign Out
    
    class var token: String? {
        get {
            return UserDefaults.standard.string(forKey: Keys.token)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.token)
        }
    }
    
    // MARK: -
    
    class var isSignedIn: Bool {
        return token != nil
    }
    
    // MARK: - Buy Photos
    
    class func buy(photo: Photo) {
        // Load Purchases
        var purchases: [String] = UserDefaults.standard.object(forKey: Keys.purchases) as? [String] ?? []
        
        // Append Purchase
        purchases.append(photo.id)
        
        // Update User Defaults
        UserDefaults.standard.set(purchases, forKey: Keys.purchases)
    }
    
    class func didBuy(_ photo: Photo) -> Bool {
        // Load Purchases
        guard let purchases: [String] = UserDefaults.standard.object(forKey: Keys.purchases) as? [String] else {
            return false
        }
        
        return purchases.contains(photo.id)
    }
    
}
