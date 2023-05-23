import Foundation
import Alamofire

class RepositoriesController {
    private var RepoArray: [Rep] = []
    
    func count() -> Int{
        return self.RepoArray.count
    }
    
    func reponame(indexpath: IndexPath) -> String{
        return self.RepoArray[indexpath.row].name
    }
    
    func userName(indexpath: IndexPath) -> String{
        return self.RepoArray[indexpath.row].owner.login
    }
    
    func numForks(indexpath: IndexPath) -> Int{
        return self.RepoArray[indexpath.row].forks
    }
    
    func numStars(indexpath: IndexPath) -> Int{
        return self.RepoArray[indexpath.row].stargazers_count
    }
    
    func fullName(indexpath: IndexPath) -> String{
        return self.RepoArray[indexpath.row].full_name
    }
    
    func getRepositorie(indexpath: IndexPath) -> Rep{
        return self.RepoArray[indexpath.row]
    }
    
    func repoDesc(indexpath: IndexPath) -> String{
        return self.RepoArray[indexpath.row].description ?? "Sem descrição."
    }
    
    func userAvatarUrl(indexpath: IndexPath) -> URL{
        return RepoArray[indexpath.row].owner.avatar_url
    }
    
    func getRequestRepositories(page:Int, completionHandler: @escaping(Bool,Error?) -> Void){
                AF.request("https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=\(page)").responseJSON { response in
            if response.response?.statusCode == 200{
                if let data = response.data{
                    do {
                        let repositorie: post? = try JSONDecoder().decode(post.self, from: data)
                        self.RepoArray += repositorie?.items ?? []
                        completionHandler(true,nil)
                    } catch  {
                        print("Error: \(error)")
                        completionHandler(false, error)
                    }
                }
            }
        }
    }
}
