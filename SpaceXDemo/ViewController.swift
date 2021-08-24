////
////  ViewController.swift
////  SpaceXDemo
////
////  Created by Yusuf  Nacar on 7.08.2021.
////
//
//import UIKit
//import SnapKit
//
//class ViewController: UIViewController , apiControllerDelegate {
//    func didGetLaunchList(apiController: APIController, launchSpaceX: [LaunchSpaceX]) {
//        print(launchSpaceX[0].details)
//    }
//    
//    
//    @IBAction func asd(_ sender: UIButton) {
//        apicontroller.fetchLaunchList()
//    }
//    
//
//    func didFailWithError(errorMessage: String?) {
//        print(errorMessage ?? "sdf")
//    }
//    
//    
//    var apicontroller = APIController()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        apicontroller.delegate = self
//        
//    }
//
//
//}
//
