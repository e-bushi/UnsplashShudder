//
//  Photo.swift
//  FlickrShudder
//
//  Created by Chris Mauldin on 11/6/18.
//  Copyright © 2018 Chris Mauldin. All rights reserved.
//

import Foundation

struct PhotoList: Decodable {
    var photos: [Photo]
}

struct Photo: Decodable {
    var id: String?
    var createdAt: String?
    var updatedAt: String?
    var width: Int?
    var height: Int?
    var color: String?
    var description: String?
    var urls: Thumbnail
    struct Thumbnail: Decodable {
        var raw: String?
        var full: String?
        var regular: String?
        var small: String?
        var thumb: String?
        
        var url: URL {
            return URL(string: small!)!
        }
        
        enum UrlKeys: String, CodingKey {
            case raw
            case full
            case regular
            case small
            case thumb
        }
    }
    
    struct Links: Decodable {
        var sel: String?
        var html: String?
        var download: String?
        var downloadLocation: String?

        enum LinkKeys: String, CodingKey {
            case sel
            case html
            case download
            case downloadLocation
        }
    }

    var categories: [String]?
    var sponsored: Bool?
    var sponsoredBy: String?
    var sponsoredImpressionID: Int?
    var likes: Int?
    var likedByUser: Bool?
    var currentUserCollection: [NestedCollection]?
    struct NestedCollection: Decodable {
        var id: Int?
        var title: String?
        var publishedAt: String?
        var updatedAt: String?
        var curated: Bool?
        var coverPhoto: String?
        var user: String?

        enum CollectionKeys: String, CodingKey {
            case id
            case title
            case published = "published_at"
            case updated = "updated_at"
            case curated
            case cover = "cover_photo"
            case user
        }
    }

    var slug: String?
    struct User {
        var id: String?
        var updatedAt: String?
        var username: String?
        var name: String?
        var firstName: String?
        var lastName: String?
        var twitterName: String?
        var portfolioUrl: String?
        var bio: String?
        var location: String?
        struct UserLinks: Decodable {
            var sel: String?
            var html: String?
            var photos: String?
            var likes: String?
            var portfolio: String?
            var following: String?
            var followers: String?

            enum UserLinkKeys: String, CodingKey {
                case sel = "self"
                case html
                case photos
                case likes
                case portfolio
                case following
                case followers
            }
        }

        struct ProfileImage: Decodable {
            var small: String?
            var medium: String?
            var large: String?

            enum ImageKeys: String, CodingKey {
                case small
                case medium
                case large
            }
        }

        var instagramUsername: String?
        var totalCollections: Int?
        var totalLikes: Int?
        var totalPhotos: Int?
        var acceptedTos: Bool?

        enum UserKeys: String, CodingKey {
            case id
            case updated = "updated_at"
            case username
            case name
            case firstName = "first_name"
            case lastName = "last_name"
            case twitter = "twitter_username"
            case portfolio = "portfolio_url"
            case bio
            case location
            case links
            case profileImage = "profile_image"
            case instagram = "instagram_username"
            case totalCollections = "total_collections"
            case totalLikes = "total_likes"
            case totalPhotos = "total_photos"
            case acceptedTos = "accepted_tos"
        }
    }

    struct exif: Decodable {
        var make: String?
        var model: String?
        var exposureTime: String?
        var aperture: String?
        var focalLength: String
        var iso: Int?

        enum ExifKeys: String, CodingKey {
            case make
            case model
            case exposure = "exposure_time"
            case aperture
            case focal = "focal_length"
            case iso
        }
    }

    var views: Int?
    var downloads: Int?

    enum PhotoKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width
        case height
        case color
        case description
        case urls
        case links
        case categories
        case sponsored
        case sponsoredBy = "sponsored_by"
        case sponsoredID = "sponsored_impressions_id"
        case likes
        case likedByUser = "liked_by_user"
        case userCollections = "current_user_collections"
        case slug
        case user
        case exif
        case views
        case downloads
    }
    

}

