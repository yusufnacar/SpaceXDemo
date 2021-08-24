//
//  LaunchDetailViewController.swift
//  SpaceXDemo
//
//  Created by Yusuf  Nacar on 8.08.2021.
//

import UIKit
import SnapKit
import AlamofireImage



class LaunchDetailViewController: UIViewController , Storyboarded {
    weak var coordinator: MainCoordinator?
    var launchListVC = LaunchListViewController()
    var launchList : LaunchList?
    
    let gradient = CAGradientLayer()
    let stack : UIStackView = UIStackView(frame: CGRect.zero)
    let launcDetail : UILabel = UILabel()
    let img : UIImageView = UIImageView()
    let rocketLabel : UILabel = UILabel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stack)
        view.addSubview(launcDetail)
        view.backgroundColor = .blue
        
        gradient.frame = view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]

        view.layer.insertSublayer(gradient, at: 0)
        configureUI()
        bindData()
    }
    
    
    func bindData() {
        DispatchQueue.main.async {
            self.img.af.setImage(withURL: URL(string: self.launchList?.links.missionImage ?? "https://theonlinephotographer.typepad.com/.a/6a00df351e888f883401b7c8d6b325970b-popup") ?? URL(string:"https://theonlinephotographer.typepad.com/.a/6a00df351e888f883401b7c8d6b325970b-popup")! )
            self.rocketLabel.text = self.launchList?.rocket.rocketName
            self.launcDetail.text = self.launchList?.details
        }
        
    }
    
    
    func configureUI(){
        
        stack.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        stack.backgroundColor = nil
        stack.alignment = .center
        stack.axis = .vertical
        stack.addArrangedSubview(img)
        stack.addArrangedSubview(rocketLabel)
        
        img.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(stack.snp.width).multipliedBy(0.6)
            make.height.equalTo(stack.snp.height).multipliedBy(0.75)
            
        }
        
        launcDetail.isUserInteractionEnabled = false
        launcDetail.adjustsFontForContentSizeCategory=true
        launcDetail.translatesAutoresizingMaskIntoConstraints = false
        launcDetail.clipsToBounds = true
        launcDetail.textColor = .black
        launcDetail.numberOfLines = 10
        launcDetail.font = UIFont.boldSystemFont(ofSize: 15)
        launcDetail.textAlignment = .justified
        
        
        launcDetail.snp.makeConstraints { (make) in
            make.top.equalTo(stack.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }

        
    }
}

