//
//  ViewController.swift
//  JUBottomSheet
//
//  Created by ikjus1@naver.com on 03/31/2021.
//  Copyright (c) 2021 ikjus1@naver.com. All rights reserved.
//

import UIKit
import JUBottomSheet
@available(iOS 13.0, *)
class ViewController: UIViewController {
    
    private var bottomSheet : JUBottomSheet!
    private var getWindow : UIWindow!
    private let uicollectionview : UICollectionView = {
        let cv = UICollectionView(frame: CGRect.init(), collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.backgroundColor = .white
        
        return cv
    }()
    
    
    //private var uicollectionview : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("하잉")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getWindow = UIApplication.shared.windows.first(where: {$0.isKeyWindow})
        
        
        self.bottomSheet = JUBottomSheet.init(window: getWindow, collectionview: uicollectionview, collectionviewHeight: 0.65, setCompletion: { collectionview in
            
            collectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
            collectionview.delegate = self
            collectionview.dataSource = self
            }
        )
        
    }

    @IBAction func actionAlert(_ sender: Any) {
        
        bottomSheet.show()
            
        
    }
}
@available(iOS 13.0, *)
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
    
}

