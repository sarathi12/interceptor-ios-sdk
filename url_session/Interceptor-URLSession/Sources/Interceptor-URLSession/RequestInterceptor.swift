//
//  RequestInterceptor.swift
//  
//
//  Created by Sarathi Kannan S on 12/10/23.
//

import Foundation

public protocol RequestInterceptor {
    func intercept(_ request: inout URLRequest)
}
