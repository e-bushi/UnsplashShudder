//
//  PhotoService.swift
//  FlickrShudder
//
//  Created by Chris Mauldin on 11/6/18.
//  Copyright © 2018 Chris Mauldin. All rights reserved.
//

import Foundation
import Moya

enum PhotoService {
    
    static private let unsplashAccessKey = "88c784850a8f9b6c8484f9b022001a40bb8da4c5d6f5220a59d06eefbf949bba"

    case readPhotos
    case readCollections
    case getPhotos(String)
}

extension PhotoService: TargetType {
    
    var baseURL: URL {
        switch self {
        case .readPhotos:
            return URL(string: "https://api.unsplash.com/")!
        case .readCollections:
            return URL(string: "https://api.unsplash.com/")!
        case .getPhotos(let endpoint):
            return URL(string: endpoint)!
        }
    }
    
    var path: String {
        switch self {
        case .readPhotos:
            return "photos/"
        case .readCollections:
            return "collections/"
        case .getPhotos(_):
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .readPhotos:
            return .get
        case .readCollections:
            return .get
        case .getPhotos(_):
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .readPhotos:
            return Data()
        case .readCollections:
            return Data()
        case .getPhotos(_):
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .readPhotos:
            return .requestPlain
        case .readCollections:
            return .requestParameters(parameters: ["per_page":6], encoding: JSONEncoding.prettyPrinted)
        case .getPhotos(_):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .readPhotos, .readCollections, .getPhotos(_):
            return ["Authorization":"Client-ID \(PhotoService.unsplashAccessKey)", "Content-Type":"application/json"]
        }
    }
    
    
    
}
