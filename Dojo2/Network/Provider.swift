//
//  Provider.swift
//  Dojo2
//
//  Created by Renan Benatti Dias on 21/05/18.
//  Copyright © 2018 Blue Origami. All rights reserved.
//

import Moya

let provider = MoyaProvider<APITarget>(
    endpointClosure: { (target) -> Endpoint<APITarget> in
        return Endpoint<APITarget>(url: "\(target.baseURL)\(target.path)",
            sampleResponseClosure: { .networkResponse(200, target.sampleData) },
            method: target.method,
            task: target.task,
            httpHeaderFields: target.headers)
}, plugins: [NetworkActivityPlugin { (change, targetType) in
    switch change {
    case .began:
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    case .ended:
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    },NetworkLoggerPlugin(verbose: true)])
