//
//  AnimeModel.swift
//  anime
//
//  Created by 박호현 on 2022/05/19.
//

import Foundation

struct AnimeCoverImage: Codable {
    let large: String
}

struct AnimePosterImage: Codable {
    let tiny: String
    let large: String
    let small: String
    let medium: String
    let original: String
}

struct AnimeAttributes: Codable {
    let synopsis: String
    let canonicalTitle: String
    let posterImage: AnimePosterImage
    let coverImage: AnimeCoverImage?
}
struct AnimeLinks: Codable {
    let next: String
}

struct AnimeData: Codable {
    let id: String
    let type: String
    let attributes: AnimeAttributes
}

struct AnimeModel: Codable {
    var data: [AnimeData]
    var links: AnimeLinks
}
