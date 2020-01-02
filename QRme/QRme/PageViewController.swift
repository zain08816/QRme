//
//  PageViewController.swift
//  QRme
//
//  Created by Zain Ali on 1/2/20.
//  Copyright © 2020 Zain Ali. All rights reserved.
//

import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable{
    var controllers: [UIViewController]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        return pageViewController
    }
    
    func updateUIVeiwController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([controllers[0]], direction: .forward, animated: true)
    }
}



struct PageViewController_Previews: PreviewProvider {
    static var previews: some View {
        PageViewController()
    }
}
