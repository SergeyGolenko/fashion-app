//
//  ViewController.swift
//  fashion-app
//
//  Created by Сергей Голенко on 08.01.2021.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    //MARK: - IBOutlets ans IBAction
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var pageControl: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func nextButtonAction(_ sender: Any) {
    }
    
    
    
    //MARK: - functions
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
    
    
    
    
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

