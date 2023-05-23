//
//  RepositoriesModel.swift
//  
//
//  Created by Hellyson barbosa on 17/11/22.
//

import Foundation

struct post: Codable{
    let items:[Rep]
}

struct Rep: Codable{
    let name: String
    let full_name: String
    let owner:user
    let forks: Int
    let stargazers_count: Int
    let description: String?
}

struct user: Codable{
    let login: String
    let avatar_url: URL
}
