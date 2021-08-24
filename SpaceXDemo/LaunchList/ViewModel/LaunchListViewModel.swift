//
//  LaunchListViewModel.swift
//  SpaceXDemo
//
//  Created by Yusuf  Nacar on 8.08.2021.
//

import Foundation
import UIKit


protocol LaunchListVMDelegate: class {
    func getData(data : LaunchSpaceX)
}


class LaunchListViewModel :NSObject  {

    weak var delegate : LaunchListVMDelegate?

    private var apiService: APIServiceProtocol
    var launchList = LaunchSpaceX()

    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
}

  
    func getLaunchList() {
        apiService.getLaunches { [unowned self] (success, model, error) in
            if success, let launches = model {
                self.fetchData(launchList : launches)
            } else {
                print(error!)
            }
        }
    }
    
    func fetchData(launchList : LaunchSpaceX) {
        self.launchList = launchList
        delegate?.getData(data: launchList)
    }
    
    
    func getYears() -> [String] {
        var years = (2006...2020).map { String($0) }
        years.append("All of them")
        return years
    }
    
    func getLaunchListByDate(year : String) -> LaunchSpaceX {
        let filteredByYearLaunchList = launchList.filter { item in
            if year == getYears()[getYears().count-1] {
                return true
            }
            else {
            return item.launchYear == year
            }
        }
        return filteredByYearLaunchList
    }

}
