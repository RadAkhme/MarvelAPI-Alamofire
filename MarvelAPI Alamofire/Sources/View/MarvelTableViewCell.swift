//
//  MarvelTableViewCell.swift
//  MarvelAPI Alamofire
//
//  Created by Радик Ахметзянов on 10.11.2022.
//

import UIKit
import SnapKit

class MarvelTableViewCell: UITableViewCell {
    
    static var identifier = "cell"
    
    var hero: Hero? {
        didSet {
            descriptionText.text = hero?.description
            name.text = hero?.name
            
            guard let imagePath = hero?.thumbnail,
                  let imageURL = URL(string: imagePath),
                  let imageData = try? Data(contentsOf: imageURL)
            else {
                heroImage.image = UIImage(named: "bg")
                return
            }
            heroImage.image = UIImage(data: imageData)
        }
    }
    
    private let imageContainer: UIView = {
        let container = UIView()
        container.clipsToBounds = true
        container.layer.cornerRadius = 10
        return container
    }()
    
    private let heroImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 1
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(imageContainer)
        imageContainer.addSubview(heroImage)
        contentView.addSubview(stack)
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(descriptionText)
    }
    
    private func setupLayout() {
        
        imageContainer.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(20)
            make.centerY.equalTo(contentView)
            make.height.equalTo(contentView).dividedBy(1.5)
            make.width.equalTo(imageContainer.snp.height)
        }
        
        heroImage.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(imageContainer)
            make.center.equalTo(imageContainer)
        }
        
        stack.snp.makeConstraints { make in
            make.centerY.equalTo(imageContainer)
            make.left.equalTo(imageContainer.snp.right).offset(20)
        }
    }
}
