//
//  TableViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 16.05.2022.
//

import UIKit
import SDWebImage

final class FriendsVC: UIViewController {
    
    var friendsAPI = FriendsAPI()
    var friends: [FriendModel] = []
    
    var isLoading = false //защитный флаг от повторной загрузки
    
    //lazy - инициализируется когда дернем tableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        tableView.register(FriendCell.self, forCellReuseIdentifier: FriendCell.identifier)
        tableView.dataSource = self //Отвечает за данные
        tableView.delegate = self //Отвечает за поведение
        tableView.prefetchDataSource = self
        return tableView
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(pullToRefreshAction), for: .valueChanged)
        return refreshControl
    }()
    
    @objc
    func pullToRefreshAction() {
        print(#function)
        
        refreshControl.beginRefreshing()
        fetchFriends { friends in
                self.friends = friends
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
        }
        
    }

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchFriends { friends in
            self.friends = friends
            self.tableView.reloadData()
        }
    }
        
    private func setupViews() {
        view.addSubview(tableView)
        tableView.refreshControl = refreshControl
    }
    
    private func fetchFriends(completion: @escaping ([FriendModel])->()) {
        //result: Result<[FriendModel], Error>)
        friendsAPI.fetchFriends { result in
            switch result {
            case .success(let friends):
                //self.friends = friends
                //self.tableView.reloadData()
                
                completion(friends)
                
            case .failure(let error):
                
            #if DEBUG
                self.showErrorAlert(title: error.description, message: "")
            #endif
                
                print("принтит всегда")
                #warning("Почему принтит в release режиме")
                debugPrint("принтит в дебаг режиме")
                
                completion([])
                
            }
        }
    }
}

extension FriendsVC: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {

        indexPaths.map { print($0.section, $0.row) }
        
        guard let maxRow = indexPaths.map({ $0.row }).max() else { return }
        
        if maxRow > friends.count - 5 {
            print("пришли вниз таблицы")
            
            if isLoading == false {
                isLoading = true //Ставим защиту не пускаем запрос на выполение пока выполняется запрос
                
                friendsAPI.fetchFriends(offset: friends.count) { result in
                    
                    self.isLoading = false
                    
                    switch result {
                    case .success(let friends):
                        self.friends.append(contentsOf: friends)
                        self.tableView.reloadData()
                        
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
    
}

extension FriendsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: FriendCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as! FriendCell

        let friend = friends[indexPath.row]
        cell.configure(friend)
        
        return cell
    }
}

extension FriendsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("нажатие", indexPath.row)
    }
}
