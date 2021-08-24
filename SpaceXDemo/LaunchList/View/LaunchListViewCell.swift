//
//  LaunchListViewCell.swift
//  SpaceXDemo
//
//  Created by Yusuf  Nacar on 8.08.2021.
//

import UIKit
import SnapKit
import AlamofireImage

class LaunchListViewCell: UITableViewCell {
    
    private let randomImage: String = "https://theonlinephotographer.typepad.com/.a/6a00df351e888f883401b7c8d6b325970b-popup"
    class var identifier: String { return String(describing: self) }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let img : UIImageView = UIImageView()
    let missionName : UILabel = UILabel()
    let year : UILabel = UILabel()
    var iconName : String = String()
    var icon : UIImageView = UIImageView()
    

    
    
    func configureUI() {
        addSubview(img)
        addSubview(missionName)
        addSubview(year)


        configureImg()
        configureYearLabel()
        configureMissionLabel()
  
    }
}

// MARK: Configure UI

extension LaunchListViewCell {
    func configureImg() {
        
    img.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(75)
            make.width.equalTo(100)
        }
    }
    
    func configureMissionLabel() {
        missionName.snp.makeConstraints { (make) in
            make.left.equalTo(img.snp.right).offset(10)
            make.top.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-20)
            
        }
    }
    
    func configureYearLabel() {
        year.snp.makeConstraints { (make) in
            make.left.equalTo(img.snp.right).offset(10)
            make.top.equalTo(missionName.snp.bottom).offset(5)
        }
    }
}

extension LaunchListViewCell {
    func getDatas(data : LaunchList) {
        
        if (data.links.missionImageSmall != nil) {
            img.af.setImage(withURL: URL(string: data.links.missionImageSmall!)!) }
        else {
            img.af.setImage(withURL: URL(string: randomImage)!)
            }
        missionName.text = data.missionName
        year.text = data.launchYear
    }
}
