//
//  Reachability.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 08/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import Alamofire

class Reachability {
    
    static let sharedInstance = Reachability()
    
    internal let manager: NetworkReachabilityManager = NetworkReachabilityManager(host: "www.google.com")!
    
    func stopListening() {
        self.manager.stopListening()
    }
    
    func isConnected() -> Bool {
        return self.manager.isReachable
    }
    
}
