//
//  FeaturedViewController.swift
//  FlickrShudder
//
//  Created by Chris Mauldin on 11/4/18.
//  Copyright © 2018 Chris Mauldin. All rights reserved.
//

import UIKit
import Moya


class FeaturedViewController: UIViewController {
    
    //MARK: - View State
    private var state: State = .autistic {
        didSet {
            switch state {
            case .autistic:
                print("Running in autistic mode...")
            case .loading:
                print("Getting thumbnails and creating models")
                
            case .ready:
                shudderTable.reloadData()
                
            case .transmit:
                print("Sending Data")
                
            case .error:
                print("Something has gone wrong...")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Unsplash Shudder"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        view.backgroundColor = UIColor.darkGray
        
        //TO DO: - Setup Layout
        setUpLayout()
        
        //TO DO: - Send Request to fetch photo resources for hero collection
        fetchPhotos { (photos) in
            
            //TO DO: - Send request to fetch collections to populate subsequent collection views
            self.fetchCollections(completion: { (collection) in
                self.state = .ready(photos)
                self.collections = collection
            })
        }
    }
    
    //MARK: - Properties
    var service = MoyaProvider<PhotoService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    var photoGroups: [Int:[Photo]] = [:] {
        didSet {
            if photoGroups.count == 6 {
                self.state = .transmit(photoGroups)
                shudderTable.reloadData()
            }
        }
    }
    
    var collections: [Collection] = [] {
        didSet {
            //TO DO: With each collection fetched, we use its internal link property to fetch an array of photos within that collection
            //We then save each photo array as an value in photogroups dictionary
            var key: Int = 1
            collections.forEach { (collection) in
                
                self.fetchListOfPhotos(path: collection, completion: { (photo) in
                    guard let name = collection.user?.name else { return }
                    self.sectionTitle[key] = name
                    self.photoGroups[key] = photo
                    key+=1
                })
            }
        }
    }
    
    //MARK: - Methods used to fetch photos and collections for unsplash API
    
    func fetchPhotos(completion: @escaping ([Photo]) -> ()) {
        service.request(.readPhotos) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                
                guard let photos = try? JSONDecoder().decode([Photo].self, from: response.data) else {
                    print("Photos Not Decoding correctly")
                    return
                }
                
                completion(photos)
                
            case .failure:
                self.state = .error
            }
        }
    }
    
    func fetchCollections(completion: @escaping ([Collection]) -> ()) {
        service.request(.readCollections) { (result) in
            switch result {
            case .success(let response):
                guard let collections = try? JSONDecoder().decode([Collection].self, from: response.data) else {
                    print("Collections decoded incorrectly")
                    return
                }
                completion(collections)
                
            case .failure:
                self.state = .error
                
            }
        }
    }
    
    func fetchListOfPhotos(path: Collection, completion: @escaping ([Photo]) -> ()) {
        guard let endpoint = path.links?.photos else { return }
        
        service.request(.getPhotos(endpoint)) { (result) in
            switch result {
            case .success(let response):
                guard let photos = try? JSONDecoder().decode([Photo].self, from: response.data) else { return }
                completion(photos)
            case .failure:
                print("Something went wrong with the request")
            }
        }
    }
    
    //ENUM -
    enum TableSections: Int {
        case zero = 0
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
    }
    
    var sectionTitle = [0: "One", 1: "Two", 2: "Three", 3: "Four", 4: "Five", 5: "Six", 6: "Seven", 7: "Eight"]
    
    
    lazy var shudderTable: UITableView = {
        var table = UITableView(frame: .zero, style: UITableView.Style.grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.separatorColor = UIColor.clear
        table.isScrollEnabled = false
        
        table.sectionHeaderHeight = 40
        table.register(ShudderTableViewCell.self, forCellReuseIdentifier: "shudderCell")
        table.register(ShudderHeroTableViewCell.self, forCellReuseIdentifier: "shudderHeroCell")
        table.backgroundColor = UIColor.clear
        table.isScrollEnabled = true
        return table
    }()
    
    func setUpLayout() {
        view.addSubview(shudderTable)
        shudderTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        shudderTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        shudderTable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shudderTable.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
    }
    
}

extension FeaturedViewController {
    enum State {
        case autistic
        case loading
        case ready([Photo])
        case transmit([Int:[Photo]])
        case error
    }
}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSections.seven.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var heroCell: ShudderHeroTableViewCell
        var tableCell: ShudderTableViewCell
        if let tableSection = TableSections(rawValue: indexPath.section) {
            
            guard case .zero = tableSection else {
                
                tableCell = tableView.dequeueReusableCell(withIdentifier: "shudderCell") as! ShudderTableViewCell
                guard case .transmit(let items) = state else { return tableCell }
                
                guard let photos = items[tableSection.rawValue] else { return tableCell }
                tableCell.dataSource(photos)
                
                return tableCell
            }
            
            heroCell = tableView.dequeueReusableCell(withIdentifier: "shudderHeroCell", for: indexPath) as! ShudderHeroTableViewCell
            guard case .ready(let items) = state else { return heroCell }
            heroCell.DataSource(items)
            return heroCell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return view.bounds.height * 0.40
            
        default:
            return 250.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let heroViewRect = CGRect.zero
        let heroView = UIView(frame: heroViewRect)
        heroView.backgroundColor = UIColor.clear
        
        let viewRect = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: tableView.sectionHeaderHeight)
        let view = UIView(frame: viewRect)
        view.backgroundColor = UIColor.darkGray
        
        let rect = CGRect(x: 15, y: 0, width: tableView.bounds.width, height: view.bounds.height)
        let label = UILabel(frame: rect)
        
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.white
        
        if let tableSection = TableSections(rawValue: section) {
            guard let name = sectionTitle[tableSection.rawValue] else { return nil }
            
            switch tableSection {
            case .zero:
                return heroView
                
            case .one:
                label.text = name
                
            case .two:
                label.text = name
                
            case .three:
                label.text = name
                
            case .four:
                label.text = name
                
            case .five:
                label.text = name
                
            case .six:
                label.text = name
                
            case .seven:
                label.text = name
                
            }
        }
        
        view.addSubview(label)
        return view
    }
}

