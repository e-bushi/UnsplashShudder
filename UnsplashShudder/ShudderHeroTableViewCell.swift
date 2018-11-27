//
//  ShudderTableViewCell.swift
//  FlickrShudder
//
//  Created by Chris Mauldin on 11/5/18.
//  Copyright © 2018 Chris Mauldin. All rights reserved.
//

import UIKit
import Kingfisher

class ShudderHeroTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpLayout()
        
        //        print("\(photos)")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        setUpLayout()
        
        //        print("\(photos)")
        
    }
    
    var photos: [Photo] = [] {
        didSet {
            heroCollection.reloadData()
        }
    }
    
    lazy var heroCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: bounds.width * 0.95, height: bounds.height * 0.9)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumLineSpacing = 20
        
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        collection.isUserInteractionEnabled = true
        collection.showsHorizontalScrollIndicator = true
        collection.allowsSelection = true
        collection.backgroundColor = UIColor.darkGray
        collection.dataSource = self
        collection.delegate = self
        collection.register(HeroCollectionViewCell.self, forCellWithReuseIdentifier: "heroCell")
        collection.tag = 1
        return collection
    }()
    
    func setUpLayout() {
        addSubview(heroCollection)
        heroCollection.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        heroCollection.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        heroCollection.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        heroCollection.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    public func DataSource(_ data: [Photo]) {
        self.photos = data
    }
    
}

extension ShudderHeroTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Count: \(photos.count)")
        
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroCell", for: indexPath) as! HeroCollectionViewCell
        
        let photo = photos[indexPath.row]
        cell.configure(photo: photo)
        return cell
    }
    
    
    
}
