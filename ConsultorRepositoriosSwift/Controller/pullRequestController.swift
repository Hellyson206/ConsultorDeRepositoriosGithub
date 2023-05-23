import Foundation
import Alamofire

class pullRequestController{
    private var arrayPulls: [pullRequest] = []
    
    func namePull(indexpath: IndexPath) -> String{
        return self.arrayPulls[indexpath.row].title
    }
    
    func bodyPull(indexpath: IndexPath) -> String{
        return self.arrayPulls[indexpath.row].body ?? "Sem descrição."
    }
    
    func userPull(indexpath: IndexPath) -> String{
        return self.arrayPulls[indexpath.row].user.login
    }
    
    func avatarUrl(indexpath: IndexPath) -> URL{
        return self.arrayPulls[indexpath.row].user.avatar_url
    }
    
    func urlPullHtml(indexpath: IndexPath) -> URL{
        return self.arrayPulls[indexpath.row].html_url
    }

    func pullsCount() -> Int {
        return self.arrayPulls.count
    }
    
    func date(indexpath: IndexPath) -> String{
        let getDateFormater = DateFormatter()
        
        getDateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let setDateFormater = DateFormatter()
        setDateFormater.dateFormat = "dd/MM/yyyy"
        
        if let date = getDateFormater.date(from: self.arrayPulls[indexpath.row].created_at){
            let newDate = setDateFormater.string(from: date)
            return newDate
        }else{
            return ""
        }
    }
    
    func getRequestPullRequests(login:String,name:String, completionHandler: @escaping(Bool,Error?) -> Void){
        
        AF.request("https://api.github.com/repos/\(login)/\(name)/pulls").responseJSON { response in
            if response.response?.statusCode == 200{
                if let data = response.data{
                    do {
                        let pullApi = try JSONDecoder().decode([pullRequest].self, from: data)
                        self.arrayPulls = pullApi
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
