//
//  ShudderTableViewCell.swift
//  FlickrShudder
//
//  Created by Chris Mauldin on 11/5/18.
//  Copyright © 2018 Chris Mauldin. All rights reserved.
//

import UIKit

class ShudderTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        setUpLayout()
    }
    
    var photos: [Photo] = [] {
        didSet {
            collectionOne.reloadData()
        }
    }
    
    lazy var collectionOne: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: bounds.width * 0.40, height: bounds.height * 0.95)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        collection.isUserInteractionEnabled = true
        collection.showsHorizontalScrollIndicator = true
        collection.allowsSelection = true
        collection.backgroundColor = UIColor.darkGray
        collection.tag = 34
        collection.dataSource = self
        collection.delegate = self
        collection.register(FeaturedCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        return collection
    }()
    
    func setUpLayout() {
        addSubview(collectionOne)
        collectionOne.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        collectionOne.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        collectionOne.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        collectionOne.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    public func dataSource(_ source: [Photo]) {
        self.photos = source
    }
}


extension ShudderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! FeaturedCollectionViewCell
        let photo = photos[indexPath.row]
        cell.configure(photo: photo)
        return cell
    }
    
    
}
