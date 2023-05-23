
import Foundation

struct pullRequest: Codable {
    let url: URL
    let title: String
    let body: String?
    let user: usuario
    let html_url: URL
    let created_at: String
    
}
struct usuario: Codable{
    
    let avatar_url: URL
}
