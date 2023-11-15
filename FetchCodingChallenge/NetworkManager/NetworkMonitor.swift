//
//  NetworkMonitor.swift
//  FetchCodingChallenge
//
//  Created by Brandon Suarez on 11/15/23.
//

import Foundation
import Network

fileprivate enum Constants {
    static let queueName: String = "Monitor"
}

final class NetworkMonitor: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: Constants.queueName)
    
    @Published var isConnected: Bool = true
    
    init() {
        monitor.pathUpdateHandler = { [unowned self] path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied ? true : false
            }
        }
        monitor.start(queue: queue)
    }
    
}
