//
//  BasicAnimationsViewController.swift
//  AnimationDev
//
//  Created by David Kababyan on 17/11/2018.
//  Copyright © 2018 David Kababyan. All rights reserved.
//

import UIKit

class BasicAnimationsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: Animation setup
        self.titleLabel.alpha = 0
        self.logoImageView.alpha = 0
        self.loadingLabel.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateTitleLabel()
        animateLogo()
    }
    
    private func animateTitleLabel() {
        UIView.animate(withDuration: 1.5) {
            self.titleLabel.alpha = 1
            self.titleLabel.frame.origin.y -= 5
        }
    }
    
    private func animateLogo() {
        UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseOut], animations: {
            self.logoImageView.alpha = 1
            self.logoImageView.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
        }) { (completed) in
            self.animateLoading()
            self.segueToNextViewController(segueID: Segues.toSpringsVC, delay: 4.0)
        }
    }
    
    private func animateLoading() {
        UIView.animate(withDuration: 1, delay: 0.2, options: [.repeat], animations: {
            self.loadingLabel.alpha = 1
            self.loadingLabel.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
        }, completion: nil)
    }
}
