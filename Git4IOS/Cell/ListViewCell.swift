//
//  ListViewCell.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

final class ListViewCell: UITableViewCell {
    
    // MARK: - Private variables
    private let imageRepository = UIImageView(image: UIImage(named: "github"))
    // MARK: - Public variables
    public static let reuseID = "ReuseId"
    public var titleName = UILabel()
    public var starCount = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(titleName)
        self.contentView.addSubview(starCount)
        self.contentView.addSubview(imageRepository)
    }
    
    override func updateConstraints() {
        starCount.translatesAutoresizingMaskIntoConstraints = false
        titleName.translatesAutoresizingMaskIntoConstraints = false
        imageRepository.translatesAutoresizingMaskIntoConstraints = false
        
        imageRepository.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageRepository.heightAnchor.constraint(equalTo: imageRepository.widthAnchor).isActive = true
        imageRepository.centerYAnchor.constraint(equalTo: starCount.centerYAnchor).isActive = true
        imageRepository.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        imageRepository.trailingAnchor.constraint(equalTo: titleName.leadingAnchor, constant: -30).isActive = true
        titleName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        titleName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        starCount.centerYAnchor.constraint(equalTo: titleName.centerYAnchor, constant: 0).isActive = true
        starCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        super.updateConstraints()
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
}
