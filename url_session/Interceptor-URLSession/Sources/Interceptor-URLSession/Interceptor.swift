//
//  Interceptor.swift
//  
//
//  Created by Sarathi Kannan S on 12/10/23.
//

import Foundation

typealias ResponseCompletion = (Data?, URLResponse?, Error?) ->Void

public class Interceptor {
    
    var requestIneterceptors: [RequestInterceptor] = []
    var responseIneterceptors: [ResponseInterceptor] = []
    
    func addRequestIneterceptor(_ interceptor: RequestInterceptor) {
        requestIneterceptors.append(interceptor)
    }
    
    func addResponseIneterceptor(_ interceptor: ResponseInterceptor) {
        responseIneterceptors.append(interceptor)
    }
    
    
    func executeRequestInerceptors(_ request: inout URLRequest) {
        for intercept in requestIneterceptors {
            intercept.intercept(&request)
        }
    }
    
    func executeResponseInterceptors(_ responseCompletion: @escaping ResponseCompletion) -> ResponseCompletion {
        return { [weak self] data, response, error in
            
            guard let self = self else {return}
            for interceptor in self.responseIneterceptors {
                interceptor.intercept(data, response: response, error: error)
            }
            responseCompletion(data, response, error)
        }
    }
    
    
    
}
