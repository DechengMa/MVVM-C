//
//  AppCoordinator.swift
//  Photos
//
//  Created by Decheng Ma on 14/09/2019.
//  Copyright © 2019 Decheng Ma. All rights reserved.
//

import UIKit
import Foundation

class PhotosCoordinator: Coordinator {
    
    // MARK: - Types
    
    private enum PurchaseFlowType {
        
        case horizontal
        case vertical
        
    }
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()

    // MARK: - Public API
    
    var rootViewController: UIViewController {
        return navigationController
    }

    // MARK: - Overrides
    
    override func start() {
        // Set Navigation Controller Delegate
        navigationController.delegate = self
        
        // Show Photos
        showPhotos()
    }
    
    // MARK: -
    
    override func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        childCoordinators.forEach { (childCoordinator) in
            childCoordinator.navigationController(navigationController, willShow: viewController, animated: animated)
        }
    }
    
    override func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        childCoordinators.forEach { (childCoordinator) in
            childCoordinator.navigationController(navigationController, didShow: viewController, animated: animated)
        }
    }
    
    // MARK: - Helper Methods
    
    private func showPhotos() {
        // Initialize Photos View Model
        let viewModel = PhotosViewModel()
        
        // Install Handlers
        viewModel.didSelectPhoto = { [weak self] (photo) in
            self?.showPhoto(photo)
        }
        
        viewModel.didBuyPhoto = { [weak self] (photo) in
            self?.buyPhoto(photo, purchaseFlowType: .vertical)
        }

        // Initialize Photos View Controller
        let photosViewController = PhotosViewController.instantiate()
        
        // Configure Photos View Controller
        photosViewController.viewModel = viewModel
        
        // Install Handlers
        photosViewController.didSignIn = { [weak self] in
            self?.showSignIn()
        }
        
        // Push Photos View Controller Onto Navigation Stack
        navigationController.pushViewController(photosViewController, animated: true)
    }

    // MARK: -
    
    private func showSignIn() {
        // Initialize Sign In View Controller
        let signInViewController = SignInViewController.instantiate()
        
        // Install Handlers
        signInViewController.didSignIn = { [weak self] (token) in
            // Update User Defaults
            UserDefaults.token = token
            
            // Dismiss View Controller
            self?.navigationController.dismiss(animated: true)
        }
        
        signInViewController.didCancel = { [weak self] in
            self?.navigationController.dismiss(animated: true)
        }
        
        // Present Sign In View Controller
        navigationController.present(signInViewController, animated: true)
    }
    
    // MARK: -
    
    private func showPhoto(_ photo: Photo) {
        // Initialize Photo View Controller
        let photoViewController = PhotoViewController.instantiate()
        
        // Configure Photo View Controller
        photoViewController.photo = photo
        
        // Install Handlers
        photoViewController.didBuyPhoto = { [weak self] (photo) in
            self?.buyPhoto(photo, purchaseFlowType: .horizontal)
        }
        
        // Push Photo View Controller Onto Navigation Stack
        navigationController.pushViewController(photoViewController, animated: true)
    }

    // MARK: -
    
    private func buyPhoto(_ photo: Photo, purchaseFlowType: PurchaseFlowType) {
        // Helpers
        let buyCoordinator: BuyCoordinator
        
        switch purchaseFlowType {
        case .horizontal:
            buyCoordinator = BuyCoordinator(navigationController: navigationController, photo: photo)
        case .vertical:
            buyCoordinator = BuyCoordinator(presentingViewController: navigationController, photo: photo)
        }
        
        // Push Buy Coordinator
        pushCoordinator(buyCoordinator)
    }

}
