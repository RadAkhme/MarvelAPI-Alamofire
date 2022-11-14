//
//  ModalViewController.swift
//  MarvelAPI Alamofire
//
//  Created by Радик Ахметзянов on 14.11.2022.
//

import UIKit

class ModalViewController: UIViewController {
    
    var hero: Hero? {
        didSet {
            name.text = hero?.name
            
            guard let imagePath = hero?.thumbnail.url,
                  let imageURL = URL(string: imagePath),
                  let imageData = try? Data(contentsOf: imageURL)
            else {
                heroImage.image = UIImage(named: "bg")
                return
            }
            heroImage.image = UIImage(data: imageData)
            
            if hero?.description == "" {
                descriptionText.text = "Здесь могло бы быть интересное описание про супергороя \(hero?.name ?? ""), но в Marvel зажали текст"
                return
            } else {
                descriptionText.text = hero?.description
            }
        }
    }
    
    private let imageContainer: UIView = {
        let container = UIView()
        container.clipsToBounds = true
        return container
    }()
    
    private let heroImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(imageContainer)
        imageContainer.addSubview(heroImage)
        view.addSubview(stack)
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(descriptionText)
    }
    
    private func setupLayout() {
        imageContainer.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.centerY.equalTo(view)
            make.height.equalTo(view.snp.width)
            make.width.equalTo(imageContainer.snp.height)
        }
        
        heroImage.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(imageContainer)
            make.center.equalTo(imageContainer)
        }
        
        stack.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(heroImage.snp.bottom).offset(15)
            make.width.equalTo(view).dividedBy(1.2)
        }
    }
}

