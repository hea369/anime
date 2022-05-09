//
//  SplashViewController.swift
//  anime
//
//  Created by 박호현 on 2022/05/09.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var leadingConstranint: NSLayoutConstraint!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut) {
            self.leadingConstranint.constant = -(self.imageView.frame.width - self.view.frame.width)
            self.view.layoutIfNeeded()
        } completion: { _ in
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = viewController
        }
    }
}
