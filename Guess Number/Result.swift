//
//  Result.swift
//  Guess Number
//
//  Created by Ramil on 12/09/2018.
//  Copyright © 2018 Ramil. All rights reserved.
//

import Foundation
import UIKit

class Result {
    private init() {}
    
    static func win(view: UIView) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        label.backgroundColor = .clear
        label.textColor = .green
        label.text = "WIN"
        label.textAlignment = .center
        label.center = view.center
        view.addSubview(label)
        
        UIView.animate(withDuration: 2.0, animations: {
            label.transform = CGAffineTransform(scaleX: 5.5, y: 5.5)
        }) { (finished) in
            label.removeFromSuperview()
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 140, height: 150))
        imageView.image = UIImage(named: "winStars")
        imageView.center = view.center
        view.addSubview(imageView)

        UIView.animate(withDuration: 2.0, animations: {
            //imageView.center.x = view.center.x + CGFloat(arc4random_uniform(10))
            imageView.transform = CGAffineTransform(scaleX: 2.9, y: 2.9)

        }) { (finished) in
            imageView.removeFromSuperview()
        }
    }
    
    static func lose(view: UIView) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 35))
        label.backgroundColor = .clear
        label.textColor = .red
        label.text = "YOU LOSE"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.center = view.center
        view.addSubview(label)
        //view.backgroundColor = .red
        
        UIView.animate(withDuration: 2.0, animations: {
            label.transform = CGAffineTransform(scaleX: 5, y: 5)
        }) { (finished) in
            label.removeFromSuperview()
        }
    }
}
