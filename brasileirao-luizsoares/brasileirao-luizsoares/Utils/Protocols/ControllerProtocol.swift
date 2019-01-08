//
//  ControllerProtocol.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

protocol ControllerProtocol : class {
    
    func showLoading()
    func showError(errorMsg: String)
    
}

extension ControllerProtocol where Self : UIViewController {
    
    func showLoading() {
        let filteredSubviews = self.view.subviews.filter({ $0 is NVActivityIndicatorView })
        if filteredSubviews.count == 0 {
            let activity = NVActivityIndicatorView(frame: CGRect(x: (self.view.center.x - 30),
                                                                 y: (self.view.center.y - 30),
                                                                 width: 60, height: 60),
                                                   type: .ballPulse,
                                                   color: BrasileiraoUtils.Colors.green.color())
            activity.startAnimating()
            self.view.addSubview(activity)
        }
    }
    
    func hideLoading() {
        for view in self.view.subviews {
            if view is NVActivityIndicatorView {
                view.removeFromSuperview()
                break
            }
        }
    }
    
    func showError(errorMsg: String) {
        let alert = UIAlertController(title: nil, message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
