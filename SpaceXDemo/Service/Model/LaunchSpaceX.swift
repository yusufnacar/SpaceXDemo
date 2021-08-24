//
//  LaunchSpaceX.swift
//  SpaceXDemo
//
//  Created by Yusuf  Nacar on 8.08.2021.
//

import Foundation

typealias LaunchSpaceX = [LaunchList]


 struct LaunchList : Codable , Identifiable  {
 
    
     public var id = UUID()
     let flightNumber: Int
     let missionName: String
     let launchYear: String
     let rocket: Rocket
     let links: Link
     let launchSuccess : Bool?
     let details: String?

     enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case launchYear = "launch_year"
        case rocket = "rocket"
        case links =  "links"
        case launchSuccess = "launch_success"
        case details = "details"
    }
}
