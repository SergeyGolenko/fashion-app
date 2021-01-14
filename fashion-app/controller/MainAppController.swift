//
//  MainAppController.swift
//  fashion-app
//
//  Created by Сергей Голенко on 09.01.2021.
//

import UIKit

class MainAppController : UIViewController {
    
    let navigationManager = NavigationManager()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch")
        navigationManager.show(screen: .onboarding, inController: self)
    }
}


