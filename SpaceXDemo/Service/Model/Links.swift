//
//  Links.swift
//  SpaceXDemo
//
//  Created by Yusuf  Nacar on 8.08.2021.
//

import Foundation


    struct Link: Codable {
    
     let missionImage: String?
     let missionImageSmall: String?

    enum CodingKeys: String, CodingKey {
        case missionImage = "mission_patch"
        case missionImageSmall = "mission_patch_small"
         
        }
}
