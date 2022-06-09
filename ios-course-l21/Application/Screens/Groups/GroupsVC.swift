//
//  TableViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 16.05.2022.
//

import UIKit
import SDWebImage

final class GroupsVC: UIViewController {
    
    var groupsAPI = GroupsAPI()
    var groups: [GroupModel] = []
    
    //lazy - инициализируется когда дернем tableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        tableView.register(GroupCell.self, forCellReuseIdentifier: GroupCell.identifier)
        tableView.dataSource = self //Отвечает за данные
        tableView.delegate = self //Отвечает за поведение
        return tableView
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

        groupsAPI.fetchGroups { [weak self] groups in
            
            guard let self = self else { return }
            
            self.groups = groups
            self.tableView.reloadData()
        }
        
    }
    
    private func setupView() {
        view.addSubview(tableView)
    }
}

extension GroupsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: GroupCell = tableView.dequeueReusableCell(withIdentifier: GroupCell.identifier, for: indexPath) as! GroupCell

        let group = groups[indexPath.row]
        cell.configure(group)
        
        return cell
    }
}

extension GroupsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("нажатие", indexPath.row)
    }
    
}
