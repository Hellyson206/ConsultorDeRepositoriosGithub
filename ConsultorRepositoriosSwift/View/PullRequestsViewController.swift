import UIKit
import SDWebImage
import NVActivityIndicatorView

class PullRequestsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let loading = NVActivityIndicatorView(frame: .zero, type: .ballSpinFadeLoader, color: .orange, padding: 0)
    var pullRequestsTableView = UITableView()
    var controller = pullRequestController()
    var login:String
    var name:String
    
    init (login: String, name: String){
        self.login = login
        self.name = name
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Pull Requests"
        
        self.pullRequestsTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(pullRequestsTableView)
        self.pullRequestsTableView.dataSource = self
        self.pullRequestsTableView.delegate = self
        self.pullRequestsTableView.register(customCellPullRequest.self, forCellReuseIdentifier: "cellPull")
        
        self.loading(animate: true)
        
        self.controller.getRequestPullRequests(login: login, name: name, completionHandler: { response, erro in
            if response{
                self.loading(animate: false)
                self.pullRequestsTableView.reloadData()
            }else{
                print(erro?.localizedDescription ?? "erro")
            }
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.pullsCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height*0.15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let pullCell = tableView.dequeueReusableCell(withIdentifier: "cellPull", for: indexPath) as! customCellPullRequest
        
        pullCell.PullName.text = controller.namePull(indexpath: indexPath)
        pullCell.PullDesc.text = controller.bodyPull(indexpath: indexPath)
        pullCell.userAvatar.sd_setImage(with: controller.avatarUrl(indexpath: indexPath), completed: nil)
        pullCell.userName.text = controller.userPull(indexpath: indexPath)
        pullCell.date.text = controller.date(indexpath: indexPath)
        
        return pullCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let urlWebView = controller.urlPullHtml(indexpath: indexPath)
        let vc2 = WebModalViewController(urlWebView: urlWebView)
        
        navigationController?.pushViewController(vc2, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
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
}
