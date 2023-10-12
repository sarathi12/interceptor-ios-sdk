//
//  ResponseInterceptor.swift
//  
//
//  Created by Sarathi Kannan S on 12/10/23.
//

import Foundation

public protocol ResponseInterceptor {
    func intercept(_ data: Data?, response: URLResponse?, error: Error?)
}
