//
//  customCellPullRequest.swift
//  ViewCodeTESTES
//
//  Created by Hellyson barbosa on 15/11/22.
//

import UIKit

class customCellPullRequest: UITableViewCell {

    
    lazy var PullName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .black)
        label.textColor = .init(red: 0.39, green: 0.62, blue: 0.79, alpha: 1.00)
        
        return label
    }()
    
    lazy var PullDesc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.textColor = .black
        
        return label
    }()
    
    lazy var userAvatar:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        
        return label
    }()
    
    lazy var date: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = .gray
        label.text = "15/03/2095"
        
        return label
    }()
    
    private func addSubViews(){
        
        addSubview(PullName)
        addSubview(PullDesc)
        addSubview(userAvatar)
        addSubview(userName)
        addSubview(date)
        
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            self.PullName.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.PullName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.PullName.widthAnchor.constraint(equalToConstant: 250),
            
            self.PullDesc.topAnchor.constraint(equalTo: self.PullName.bottomAnchor, constant: 5),
            self.PullDesc.leadingAnchor.constraint(equalTo: self.PullName.leadingAnchor),
            self.PullDesc.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            self.userAvatar.topAnchor.constraint(equalTo: self.PullDesc.bottomAnchor, constant: 10),
            self.userAvatar.leadingAnchor.constraint(equalTo: self.PullName.leadingAnchor),
            self.userAvatar.widthAnchor.constraint(equalToConstant: 30),
            self.userAvatar.heightAnchor.constraint(equalToConstant: 30),
            
            self.userName.topAnchor.constraint(equalTo: self.userAvatar.topAnchor),
            self.userName.leadingAnchor.constraint(equalTo: self.userAvatar.trailingAnchor, constant: 5),
            
            self.date.topAnchor.constraint(equalTo: self.userName.bottomAnchor, constant: 2),
            self.date.leadingAnchor.constraint(equalTo: self.userName.leadingAnchor),
            
            ])
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubViews()
        configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
