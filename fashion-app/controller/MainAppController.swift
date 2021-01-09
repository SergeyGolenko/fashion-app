//
//  MainAppController.swift
//  fashion-app
//
//  Created by Сергей Голенко on 09.01.2021.
//

import UIKit

class MainAppController : UIViewController {
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("you touch")
        let fashionController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FashionController")
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = fashionController
            UIView.transition(with: window, duration: 2, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}


