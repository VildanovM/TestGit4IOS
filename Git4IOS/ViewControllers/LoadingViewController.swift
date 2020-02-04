//
//  LoadingViewController.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 05.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

final class LoadingViewController: UIViewController {
    
    // MARK: - Private variables
    private let contentViewController: UIViewController
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let blueView = UIView()
    
    // MARK: - Init
    
    init(contentViewController: UIViewController) {
        self.contentViewController = contentViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        blueView.backgroundColor = UIColor.blue
        blueView.center = view.center
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        blueView.heightAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true
        activityIndicator.color = .blue
        activityIndicator.hidesWhenStopped = true
        
        add(asChildViewController: contentViewController)
        view.addSubview(activityIndicator)
        
        activityIndicator.center(in: view)
    }
    
    // MARK: - Public functions
    
    public func startLoading() {
        contentViewController.view.isHidden = true
        activityIndicator.startAnimating()
    }
    
    public func endLoading() {
        activityIndicator.stopAnimating()
        contentViewController.view.isHidden = false
    }
    
    
}
