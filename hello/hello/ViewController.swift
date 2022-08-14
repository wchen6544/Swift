//
//  ViewController.swift
//  hello
//
//  Created by Wilson Chen on 8/13/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let imageView: UIImageView = {
        
        let imageview = UIImageView()
        
        imageview.contentMode = .scaleAspectFill
        imageview.backgroundColor = .white
        
        return imageview
    }()
    
    private let button: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
        
    }()

    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemMint,
        .systemBrown,
        .systemYellow
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemRed
        
        view.addSubview(imageView)
        
        imageView.frame = CGRect(x: 0, y:0, width: 300, height: 300)
        imageView.center = view.center // centers the white box
        
        getRandomPhoto()
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        //view.safeAreaInsets.bottom makes sure that things don't overlap with the
        // black bar on the bottom
        
    }
    
    
    @objc func didTapButton() {
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 20,
            y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
            width: view.frame.size.width - 40,
            height: 55)
    }
    
    func getRandomPhoto() {
        
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)! //! tells swift that the urlString is
                                          // 100% a valid url.
        
        // gets the contents from the website (picture)
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        
        imageView.image = UIImage(data: data)
        
    }


}

