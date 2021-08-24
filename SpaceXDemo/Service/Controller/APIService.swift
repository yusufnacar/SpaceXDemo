//
//  APIService.swift
//  SpaceXDemo
//
//  Created by Yusuf  Nacar on 9.08.2021.
//

import Foundation

protocol APIServiceProtocol {
    func getLaunches(completion: @escaping (_ success: Bool, _ results: LaunchSpaceX?, _ error: String?) -> ())
}

enum SpaceXServiceEndPoint: String {
    case BASE_URL = "https://api.spacexdata.com/v2"
    case PATH = "/launches"

    static func launchPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

class APIService: APIServiceProtocol {
    func getLaunches(completion: @escaping (Bool, LaunchSpaceX?, String?) -> ()) {
        HttpRequestHelper().GET(url: SpaceXServiceEndPoint.launchPath(), params: ["": ""], httpHeader: .application_json) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(LaunchSpaceX.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Error: Trying to parse LaunchSpaceX to model")
                }
            } else {
                completion(false, nil, "Error: LaunchSpaceX GET Request failed")
            }
        }
    }
}
