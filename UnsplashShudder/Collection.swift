//
//  Collection.swift
//  FlickrShudder
//
//  Created by Chris Mauldin on 11/6/18.
//  Copyright © 2018 Chris Mauldin. All rights reserved.
//

import Foundation

struct Collection: Decodable {
    
    var id: Int
    var title: String?
    var description: String?
    var published: String?
    var updated: String?
    var curated: Bool
//    var featured: Bool
//    var totalPhotos: Int?
//    var privatee: Bool?
//    var link: Link
//    var shareKey: String
//    var tags: [Title]
//
//    var coverPhoto: Photo
//    var preview: [PreviewPhotos]
//    struct PreviewPhotos: Decodable {
//        var id: Int
//        struct urls: Decodable {
//            var raw: String?
//            var full: String?
//            var regular: String?
//            var small: String?
//            var thumb: String?
//
//            enum UrlKeys: String, CodingKey {
//                case raw
//                case full
//                case regular
//                case small
//                case thumb
//            }
//        }
//    }

    var user: User?
    struct User: Decodable {
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
    }
//
//        struct ProfileImage: Decodable {
//            var small: String?
//            var medium: String?
//            var large: String?
//
//            enum ImageKeys: String, CodingKey {
//                case small
//                case medium
//                case large
//            }
//        }
//
//        var instagramUsername: String?
//        var totalCollections: Int
//        var totalLikes: Int
//        var totalPhotos: Int
//        var acceptedTos: Bool
//
//        enum UserKeys: String, CodingKey {
//            case id
//            case updated = "updated_at"
//            case username
//            case name
//            case firstName = "first_name"
//            case lastName = "last_name"
//            case twitter = "twitter_username"
//            case portfolio = "portfolio_url"
//            case bio
//            case location
//            case links
//            case profileImage = "profile_image"
//            case instagram = "instagram_username"
//            case totalCollections = "total_collections"
//            case totalLikes = "total_likes"
//            case totalPhotos = "total_photos"
//            case acceptedTos = "accepted_tos"
//        }
//    }
//
    var links: Link?

    struct Link: Codable {
        var `self`: String
        var html: String
        var photos: String
        var related: String

        enum LinkKeys: String, CodingKey {
            case sel = "self"
            case html = "html"
            case photos
            case related
        }
    }
    
    enum CollectionKeys: String, CodingKey {
        case id
        case title
        case description
        case published = "published_at"
        case updated = "updated_at"
        case curated
//        case featured
//        case totalPhotos = "total_photos"
//        case privatee = "private"
//        case shareKey = "share_key"
//        case tags
//        case coverPhoto = "cover_photo"
//        case preview = "preview_photos"
        case user = "User"
        case link = "links"
    }
    
    
}

//"""
//    {
//    "id": 2270935,
//    "title": "Shapes and Patterns",
//    "description": null,
//    "published_at": "2018-10-22T11:01:37-04:00",
//    "updated_at": "2018-10-22T11:01:37-04:00",
//    "curated": false,
//    "featured": true,
//    "total_photos": 34,
//    "private": false,
//    "share_key": "5b42e12f3b6e15250d316987ec83a90e",
//    "tags": [
//        {
//        "title": "pattern"
//        },
//        {
//        "title": "shape"
//        },
//        {
//        "title": "architecture"
//        },
//        {
//        "title": "minimal"
//        },
//        {
//        "title": "building"
//        },
//        {
//        "title": "abstract"
//        }
//    ],
//    "cover_photo": {
//        "id": "Y2aNc1X7xLg",
//        "created_at": "2018-07-31T20:31:14-04:00",
//        "updated_at": "2018-08-28T21:17:57-04:00",
//        "width": 3375,
//        "height": 5056,
//        "color": "#1B2939",
//        "description": "mountain with fogs wallpaper",
//        "urls": {
//            "raw": "https://images.unsplash.com/photo-1533083301437-4251664d2cb7?ixlib=rb-0.3.5&s=10e23ef2f0cfe249848c1a45298c20a6",
//            "full": "https://images.unsplash.com/photo-1533083301437-4251664d2cb7?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&s=a0e5b30d50c95f8f857d0121e9b019d1",
//            "regular": "https://images.unsplash.com/photo-1533083301437-4251664d2cb7?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=aa16ee66e450ea232de5bee504af267a",
//            "small": "https://images.unsplash.com/photo-1533083301437-4251664d2cb7?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&s=ce868d3d4858d7b327b48206fbc9200e",
//            "thumb": "https://images.unsplash.com/photo-1533083301437-4251664d2cb7?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=2f62d5dc0d4a8fb2304238aa376b7f26"
//        },
//        "links": {
//            "self": "https://api.unsplash.com/photos/Y2aNc1X7xLg",
//            "html": "https://unsplash.com/photos/Y2aNc1X7xLg",
//            "download": "https://unsplash.com/photos/Y2aNc1X7xLg/download",
//            "download_location": "https://api.unsplash.com/photos/Y2aNc1X7xLg/download"
//        },
//        "categories": [],
//        "sponsored": false,
//        "sponsored_by": null,
//        "sponsored_impressions_id": null,
//        "likes": 233,
//        "liked_by_user": false,
//        "current_user_collections": [],
//        "slug": "mountain-peak-ridge",
//        "user": {
//            "id": "axkvFqalxrI",
//            "updated_at": "2018-11-06T17:44:05-05:00",
//            "username": "jack_scorner",
//            "name": "Thomas Griesbeck",
//            "first_name": "Thomas",
//            "last_name": "Griesbeck",
//            "twitter_username": null,
//            "portfolio_url": "http://www.jackscorner.de",
//            "bio": "Digital Artist in Munich. \r\n\r\nInstagram: jack_scorner ",
//            "location": "Munich",
//            "links": {
//                "self": "https://api.unsplash.com/users/jack_scorner",
//                "html": "https://unsplash.com/@jack_scorner",
//                "photos": "https://api.unsplash.com/users/jack_scorner/photos",
//                "likes": "https://api.unsplash.com/users/jack_scorner/likes",
//                "portfolio": "https://api.unsplash.com/users/jack_scorner/portfolio",
//                "following": "https://api.unsplash.com/users/jack_scorner/following",
//                "followers": "https://api.unsplash.com/users/jack_scorner/followers"
//            },
//        "profile_image": {
//            "small": "https://images.unsplash.com/profile-1503396854588-896023cb10a1?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32&s=224c1db5e5de54d86ef71ebade513a9f",
//            "medium": "https://images.unsplash.com/profile-1503396854588-896023cb10a1?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64&s=8648d2ae3a62a4655677c18a28173956",
//            "large": "https://images.unsplash.com/profile-1503396854588-896023cb10a1?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128&s=236e414f2a45389786f328ba9653fc88"
//        },
//        "instagram_username": "jack_scorner",
//        "total_collections": 0,
//        "total_likes": 41,
//        "total_photos": 49,
//        "accepted_tos": false
//        }
//    },
//    "preview_photos": [
//        {
//            "id": 761240,
//            "urls": {
//                "raw": "https://images.unsplash.com/photo-1533083301437-4251664d2cb7?ixlib=rb-0.3.5&s=10e23ef2f0cfe249848c1a45298c20a6",
//                "full": "https://images.unsplash.com/photo-1533083301437-4251664d2cb7?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&s=a0e5b30d50c95f8f857d0121e9b019d1",
//                "regular": "https://images.unsplash.com/photo-1533083301437-4251664d2cb7?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=aa16ee66e450ea232de5bee504af267a",
//                "small": "https://images.unsplash.com/photo-1533083301437-4251664d2cb7?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&s=ce868d3d4858d7b327b48206fbc9200e",
//                "thumb": "https://images.unsplash.com/photo-1533083301437-4251664d2cb7?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=2f62d5dc0d4a8fb2304238aa376b7f26"
//            }
//        },
//        {
//            "id": 718471,
//            "urls": {
//                "raw": "https://images.unsplash.com/photo-1530177150700-84cd9a3b059b?ixlib=rb-0.3.5&s=0ec5fba1e695f94e49e01bbdae873be7",
//                "full": "https://images.unsplash.com/photo-1530177150700-84cd9a3b059b?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&s=de329c7ab5f5e294221c46bb83b0d047",
//                "regular": "https://images.unsplash.com/photo-1530177150700-84cd9a3b059b?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=4428d67b99c8c2c8f6c12f8d582fe610",
//                "small": "https://images.unsplash.com/photo-1530177150700-84cd9a3b059b?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&s=dfb6b72e6cfed19b2364e46b1a0ef406",
//                "thumb": "https://images.unsplash.com/photo-1530177150700-84cd9a3b059b?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=99dc063bea864c0847dcc3677db720c6"
//            }
//        },
//        {
//            "id": 708261,
//            "urls": {
//                "raw": "https://images.unsplash.com/photo-1529432337323-223e988a90fb?ixlib=rb-0.3.5&s=6153d4bb42274a35cd028cc7c8ae9abc",
//                "full": "https://images.unsplash.com/photo-1529432337323-223e988a90fb?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&s=1731726609a00dba7a61217c7da18644",
//                "regular": "https://images.unsplash.com/photo-1529432337323-223e988a90fb?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=1411b0e31fa2a1a804c58506c24aab74",
//                "small": "https://images.unsplash.com/photo-1529432337323-223e988a90fb?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&s=57c4e53e466c4b99efd3a828b748d022",
//                "thumb": "https://images.unsplash.com/photo-1529432337323-223e988a90fb?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=e15a210d5df687d9399b0c8a38cc95b9"
//            }
//        },
//    {
//        "id": 427883,
//        "urls": {
//            "raw": "https://images.unsplash.com/photo-1509137328389-dd753fbdd246?ixlib=rb-0.3.5&s=bb27739bad15cc11068680b21031392f",
//            "full": "https://images.unsplash.com/photo-1509137328389-dd753fbdd246?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&s=941103857563d725723f91a0a67c5cd9",
//            "regular": "https://images.unsplash.com/photo-1509137328389-dd753fbdd246?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=54190d867ab6cbb1dfddf9172e1f0402",
//            "small": "https://images.unsplash.com/photo-1509137328389-dd753fbdd246?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&s=6dfffaa0383c64e8d37fd2c62a797567",
//            "thumb": "https://images.unsplash.com/photo-1509137328389-dd753fbdd246?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=4e1cc81b4b389f8b2585fccb9b13b3f9"
//        }
//    }
//    ],
//    "user": {
//        "id": "EFL2TjU-cUI",
//        "updated_at": "2018-11-04T22:25:20-05:00",
//        "username": "rvsyin",
//        "name": "Vic Yin",
//        "first_name": "Vic",
//        "last_name": "Yin",
//        "twitter_username": null,
//        "portfolio_url": null,
//        "bio": null,
//        "location": null,
//        "links": {
//        "self": "https://api.unsplash.com/users/rvsyin",
//        "html": "https://unsplash.com/@rvsyin",
//        "photos": "https://api.unsplash.com/users/rvsyin/photos",
//        "likes": "https://api.unsplash.com/users/rvsyin/likes",
//        "portfolio": "https://api.unsplash.com/users/rvsyin/portfolio",
//        "following": "https://api.unsplash.com/users/rvsyin/following",
//        "followers": "https://api.unsplash.com/users/rvsyin/followers"
//        },
//        "profile_image": {
//            "small": "https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32&s=0ad68f44c4725d5a3fda019bab9d3edc",
//            "medium": "https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64&s=356bd4b76a3d4eb97d63f45b818dd358",
//            "large": "https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128&s=ee8bbf5fb8d6e43aaaa238feae2fe90d"
//        },
//        "instagram_username": "rvsyin",
//        "total_collections": 15,
//        "total_likes": 871,
//        "total_photos": 0,
//        "accepted_tos": false
//    },
//    "links": {
//        "self": "https://api.unsplash.com/collections/2270935",
//        "html": "https://unsplash.com/collections/2270935/shapes-and-patterns",
//        "photos": "https://api.unsplash.com/collections/2270935/photos",
//        "related": "https://api.unsplash.com/collections/2270935/related"
//    }
//}
