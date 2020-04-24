//
//  LoadingView.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 24-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(inView view: UIView) {
        indicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.bringSubviewToFront(view)
    }
    
    func show() {
        indicator.startAnimating()
    }
    
    func hide() {
        indicator.stopAnimating()
    }
}
