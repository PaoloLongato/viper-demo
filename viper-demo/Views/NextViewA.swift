//
//  NextViewA.swift
//  viper-demo
//
//  Created by Paolo Longato on 19/08/2017.
//  Copyright © 2017 Jayway. All rights reserved.
//

import UIKit

class NextViewA: UIViewController, NextViewAType {
    
    // Public interface
    // Listeners communicate data/events to the outside
    var onLoad: (()->Void)?
    var onCloseButtonPressed: (() -> Void)?
    // Variables are set from the outside
    var imageData: Data? {
        didSet {
            guard let nv = imageData else { return }
            DispatchQueue.main.sync() {
                let img = UIImage(data: nv)
                imageView.image = img
            }
        }
    }
    var caption: String? {
        didSet {
            DispatchQueue.main.sync {
                captionLabel.text = caption
                self.navigationItem.title = caption
            }
        }
        }
    // Private stuff
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var captionHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        onLoad?()
    }
    
    func setupLayout() {
        if onCloseButtonPressed == nil {
            captionHeightConstraint.constant = 0
            dismissButton.alpha = 0
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: { [weak self] in
            self?.onCloseButtonPressed?() })
    }
    
}
