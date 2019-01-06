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
    
    func showError(errorMsg: String)
    
}

extension ControllerProtocol where Self : UIViewController {
    
    func showError(errorMsg: String) {
        let alert = UIAlertController(title: nil, message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
