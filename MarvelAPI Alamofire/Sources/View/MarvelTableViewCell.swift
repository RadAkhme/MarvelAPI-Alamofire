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
    
    private let imageContainer: UIView = {
        let container = UIView()
        container.clipsToBounds = true
        container.layer.cornerRadius = 10
        return container
    }()
    
    var heroImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var name: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var text: UILabel = {
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
        stack.addArrangedSubview(text)
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
