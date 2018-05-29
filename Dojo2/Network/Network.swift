//
//  Network.swift
//  Dojo2
//
//  Created by Renan Benatti Dias on 21/01/18.
//  Copyright © 2018 Blue Origami. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Moya
import Moya_ObjectMapper

class APIClientHost {
    static let baseUrlString = "https://swapi.co/api"
    static var baseUrl = URL(string: baseUrlString)!
}

enum APITarget {
    case starships()
    // case people
    // ...
}

extension APITarget: TargetType {
    var baseURL: URL {
        switch self {
        case .starships:
            return APIClientHost.baseUrl
        }
    }
    
    var path: String {
        switch self {
        case .starships:
            return "/starships"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .starships:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
    
    var validate: Bool {
        return false
    }
    
    var task: Task {
        switch self {
        case .starships:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

protocol StarshipNetworkProtocol {
    func getShips() -> Single<[Starship]>
}

class Network: StarshipNetworkProtocol {
    func getShips() -> Single<[Starship]> {
        return provider.rx
            .request(.starships())
            .mapObject(StarshipEnclosure.self)
            .map { $0.results ?? [] }
    }
}
