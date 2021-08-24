//
//  LaunchListViewController.swift
//  SpaceXDemo
//
//  Created by Yusuf  Nacar on 8.08.2021.
//

import UIKit
import SnapKit

class LaunchListViewController: UIViewController , Storyboarded {
    weak var coordinator: MainCoordinator?
    let labelTitle : UILabel = UILabel()
    let tableView : UITableView = UITableView()
    
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    var pickedData : String = ""
    
    private lazy var launchList : LaunchSpaceX = []
    
    var viewModel = LaunchListViewModel()
    
    func initViewModel() {
        viewModel.getLaunchList()
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initViewModel()
        viewModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LaunchListViewCell.self, forCellReuseIdentifier: LaunchListViewCell.identifier)
        picker = UIPickerView.init()
        picker.delegate = self
        picker.dataSource = self
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        completeDesign()
        configureLabel()
        configureTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterByDate))
    }
}
    



//MARK: - Delegate
extension LaunchListViewController : LaunchListVMDelegate {
    func getData(data: LaunchSpaceX) {
        launchList = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


// MARK: - Configure UI
extension LaunchListViewController {
    
    func completeDesign() {
        tableView.rowHeight = 100
        
        
        DispatchQueue.main.async {
            self.view.backgroundColor = .black
        self.labelTitle.font = .boldSystemFont(ofSize: 25)
            self.labelTitle.textColor = .white
        self.labelTitle.text = "Space X"
                    
                }
    }
    
    func configureLabel() {
        labelTitle.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalTo(view).offset(10)
            make.bottom.greaterThanOrEqualTo(20)
        }
    }
    
    func configureTableView() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle).offset(30)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.bottom.equalToSuperview()
        }
    }

}



// MARK: - UITableView
extension LaunchListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return launchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : LaunchListViewCell = tableView.dequeueReusableCell(withIdentifier: LaunchListViewCell.identifier, for: indexPath) as? LaunchListViewCell else

        {
            
            return UITableViewCell()
        }
        
        cell.getDatas(data: launchList[indexPath.row] )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.navigateTo(with: launchList[indexPath.row])
        }
}
    


// MARK: - Picker View


extension LaunchListViewController : UIPickerViewDelegate , UIPickerViewDataSource {
    
    

    @objc func filterByDate() {
    picker.backgroundColor = UIColor.white
    picker.setValue(UIColor.black, forKey: "textColor")
    picker.autoresizingMask = .flexibleWidth
    picker.contentMode = .center
    picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
    self.view.addSubview(picker)
            
    toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(DoneButtonTapped)) , UIBarButtonItem.init(title: "Cancel", style: .done, target: self, action: #selector(cancelButtonTapped))]
    self.view.addSubview(toolBar)
}
    
    @objc func DoneButtonTapped() {
        
        launchList = viewModel.getLaunchListByDate(year: pickedData)
        print(launchList.count)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
    @objc func cancelButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.getYears().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.getYears()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedData = viewModel.getYears()[row]
    }
    
}



