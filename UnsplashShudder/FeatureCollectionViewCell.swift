//
//  FeaturedCollectionViewCell.swift
//  FlickrShudder
//
//  Created by Chris Mauldin on 11/4/18.
//  Copyright © 2018 Chris Mauldin. All rights reserved.
//

import UIKit
import Kingfisher

class FeaturedCollectionViewCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 20
        
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.black
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    func setUpLayout() {
        addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    public func configure(photo: Photo?) {
        guard let photoURL = photo?.urls.url else { return }
        
        imageView.kf.setImage(with: photoURL, options: [.transition(.fade(0.3))])
    }
    
    
}
