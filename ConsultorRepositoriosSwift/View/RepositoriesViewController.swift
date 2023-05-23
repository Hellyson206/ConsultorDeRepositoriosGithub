import UIKit
import NVActivityIndicatorView
import SDWebImage

class RepositoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var repositoriesTableView = UITableView()
    var controller = RepositoriesController()
    var page = 1
    var fetchingMore = false
    let loading = NVActivityIndicatorView(frame: .zero, type: .ballSpinFadeLoader, color: .orange, padding: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Repositories"
        
        self.repositoriesTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(repositoriesTableView)
        
        self.repositoriesTableView.dataSource = self
        self.repositoriesTableView.delegate = self
        
        self.repositoriesTableView.register(customCell.self, forCellReuseIdentifier: "cell")
        
        self.loading(animate: true)
        
        self.controller.getRequestRepositories(page:page) { response, error in
            if response{
                self.loading(animate: false)
                self.repositoriesTableView.reloadData()
            }else{
                print(error?.localizedDescription ?? "erro")
                self.loading(animate: false)
            }
        }
    }
    
    func loading(animate: Bool){
        
        loading.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loading)
        
        NSLayoutConstraint.activate([
            loading.widthAnchor.constraint(equalToConstant: 40),
            loading.heightAnchor.constraint(equalToConstant: 40),
            
            loading.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        if !animate{
            loading.stopAnimating()
        }else{
            loading.startAnimating()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height*0.15
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  controller.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customCell
        
        cell.repoName.text = controller.reponame(indexpath: indexPath)
        cell.repoDesc.text = controller.repoDesc(indexpath: indexPath)
        cell.starCount.text = String(controller.numStars(indexpath: indexPath))
        cell.starImage.image = UIImage(named: "star")
        cell.forksCount.text = String(controller.numForks(indexpath: indexPath))
        cell.forksImage.image = UIImage(named: "fork")
        cell.userAvatar.sd_setImage(with: controller.userAvatarUrl(indexpath: indexPath), completed: nil)
        cell.userFullName.text = controller.fullName(indexpath: indexPath)
        cell.userName.text = controller.reponame(indexpath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let login = controller.userName(indexpath: indexPath)
        let name = controller.reponame(indexpath: indexPath)
        let vc2 = PullRequestsViewController(login: login, name:name )
        
        navigationController?.pushViewController(vc2, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offSetY > contentHeight - scrollView.frame.height * 3 && offSetY > 0{
        if !fetchingMore{
                beginBatchFetch()
            }
        }
    }
    
    func beginBatchFetch(){
        
        self.fetchingMore = true
        page += 1
       
        self.controller.getRequestRepositories(page:page) { response, error in
            if response {
                self.fetchingMore = false
                self.repositoriesTableView.reloadData()
                
            }else{
                print(error?.localizedDescription ?? "erro")
            }
        }
    }
}

