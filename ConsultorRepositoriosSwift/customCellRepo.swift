import Foundation
import UIKit

class customCell: UITableViewCell{
    var labelNome: UILabel!
    var imageFoto: UIImageView!
    
    
    lazy var userAvatar:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var repoName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .black)
        label.textColor = .init(red: 0.39, green: 0.62, blue: 0.79, alpha: 1.00)
        
        return label
    }()
    
    lazy var repoDesc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        
        return label
    }()
    
    lazy var starImage:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var starCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .black)
        label.textColor = .init(red: 0.98, green: 0.60, blue: 0.04, alpha: 1.00)
        
        return label
    }()
    
    lazy var forksImage:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var forksCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .black)
        label.textColor = .init(red: 0.98, green: 0.60, blue: 0.04, alpha: 1.00)

        return label
    }()
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var userFullName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()
    

    private func addSubviews(){
        
        addSubview(self.userAvatar)
        addSubview(self.repoName)
        addSubview(self.repoDesc)
        addSubview(self.starImage)
        addSubview(self.starCount)
        addSubview(self.forksImage)
        addSubview(self.forksCount)
        addSubview(self.userName)
        addSubview(self.userFullName)
    }
    
    func configureConstraints(){
        NSLayoutConstraint.activate([
            
            self.repoName.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.repoName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.repoName.widthAnchor.constraint(equalToConstant: 250),
            
            self.repoDesc.topAnchor.constraint(equalTo: self.repoName.bottomAnchor, constant: 5),
            self.repoDesc.leadingAnchor.constraint(equalTo: self.repoName.leadingAnchor),
            self.repoDesc.widthAnchor.constraint(equalToConstant: 250),
            
            self.starImage.topAnchor.constraint(equalTo: self.repoDesc.bottomAnchor, constant: 10),
            self.starImage.leadingAnchor.constraint(equalTo: self.repoName.leadingAnchor),
            self.starImage.widthAnchor.constraint(equalToConstant: 15),
            self.starImage.heightAnchor.constraint(equalToConstant: 15),
            
            self.starCount.topAnchor.constraint(equalTo: self.starImage.topAnchor),
            self.starCount.leadingAnchor.constraint(equalTo: self.starImage.trailingAnchor, constant: 5),
            //self.starCount.widthAnchor.constraint(equalToConstant: 100),
            
            self.forksImage.topAnchor.constraint(equalTo: self.starImage.topAnchor),
            self.forksImage.leadingAnchor.constraint(equalTo: self.starCount.trailingAnchor, constant: 40),
            self.forksImage.widthAnchor.constraint(equalToConstant: 15),
            self.forksImage.heightAnchor.constraint(equalToConstant: 15),
            
            self.forksCount.topAnchor.constraint(equalTo: self.starImage.topAnchor),
            self.forksCount.leadingAnchor.constraint(equalTo: self.forksImage.trailingAnchor, constant: 5),
            
            self.userAvatar.topAnchor.constraint(equalTo: self.repoName.topAnchor),
            self.userAvatar.leadingAnchor.constraint(equalTo: self.repoName.trailingAnchor, constant: 50),
            self.userAvatar.widthAnchor.constraint(equalToConstant: 50),
            self.userAvatar.heightAnchor.constraint(equalToConstant: 50),
            
            self.userName.topAnchor.constraint(equalTo: self.userAvatar.bottomAnchor),
            self.userName.leadingAnchor.constraint(equalTo: self.repoName.trailingAnchor, constant: 30),
            self.userName.widthAnchor.constraint(equalToConstant: 90),
            
            self.userFullName.topAnchor.constraint(equalTo: self.userName.bottomAnchor),
            self.userFullName.leadingAnchor.constraint(equalTo: self.repoName.trailingAnchor, constant: 30),
            self.userFullName.widthAnchor.constraint(equalToConstant: 90),
            
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

