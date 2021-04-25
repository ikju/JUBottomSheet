
//
//  JUBottomSheet.swift
//  JUBottomSheet_Example
//
//  Created by Ik ju Song on 2021/03/31.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

//
//  JUBottomSheet.swift
//  bottomSheet
//
//  Created by Ik ju Song on 2021/04/01.
//

import UIKit
@available(iOS 13.0, *)
open class JUBottomSheet: UIView {

    private var getWindow : UIWindow?
    private var getBackGroundView : UIView = UIView()
    
    private var uicollectionview : UICollectionView!
    private var uicollectionviewY : CGFloat = 0
    private var uicollectionviewValue : CGFloat = 0
    private var uicollectionviewHeight : CGFloat!//반드시 입력받아야하는 값
    
    
    

    
    private var keyboardWillHideBool = false
    private var keyboardWillShowBool = false
    
    public convenience init(window : UIWindow, collectionview : UICollectionView, collectionviewHeight : CGFloat, setCompletion:@escaping (UICollectionView) -> Void){
        self.init(frame : CGRect.zero)
        self.getWindow = window
        self.uicollectionview = collectionview
        self.uicollectionviewHeight = collectionviewHeight
        setCompletion(uicollectionview)
        //self.completion = setCompletion(uicollectionview)
        
    }
    
    
    
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
    
    
}
//MARK: - @objc 관련 함수모음
@available(iOS 13.0, *)
extension JUBottomSheet {
    @objc
    public func closeBottomSheet(gestureRecognizer: UITapGestureRecognizer){
        if let window = getWindow {
            UIView.animate(withDuration: 0.3, animations: {
                self.getBackGroundView.alpha = 0
                
                self.uicollectionview.frame = CGRect(x: 0, y: self.uicollectionviewY, width: window.frame.width, height: self.uicollectionviewValue)
                
            }, completion: {done in
                if done {
                    self.uicollectionview.removeFromSuperview()
                    self.getBackGroundView.removeFromSuperview()
                }
            })
        }
        
    }
    
    
    
    

   
    
    
    
}
//MARK: - 컬랙션뷰 레이아웃 모음 함수
@available(iOS 13.0, *)
extension JUBottomSheet {
    
    
    //컬랙션뷰 내려가게 하는 함수
    public func collectionviewDown(_ completion : @escaping ()-> Void){
        if let window = getWindow {
            UIView.animate(withDuration: 0.3, animations: {
                self.getBackGroundView.alpha = 0
                
                self.uicollectionview.frame = CGRect(x: 0, y: self.uicollectionviewY, width: window.frame.width, height: self.uicollectionviewValue)
                completion()
                //self.white_filter_collectionview.deleteItems(at: [IndexPath.init(item: 0, section: 0)])
            }, completion: {done in
                if done {
                    
                    self.uicollectionview.removeFromSuperview()
                    self.getBackGroundView.removeFromSuperview()
                }
            })
        }
        
    }
}

//MARK: - 레이아웃 관련 함수모음
@available(iOS 13.0, *)
extension JUBottomSheet {
    
    open func show(){
        
        if let window = getWindow {
            
            getBackGroundView.translatesAutoresizingMaskIntoConstraints = false
            getBackGroundView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            getBackGroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeBottomSheet(gestureRecognizer:))))
            
            window.addSubview(getBackGroundView)
            _backGroundView(uiview : getBackGroundView)
            uicollectionview.backgroundColor = .white
            uicollectionview.isScrollEnabled = false
            uicollectionview.translatesAutoresizingMaskIntoConstraints = false
            
            uicollectionview.layer.cornerRadius = 20
            uicollectionview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            window.addSubview(uicollectionview)
            
            uicollectionview.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 0)
            
            getBackGroundView.alpha = 0
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.uicollectionviewValue =  window.frame.height * (1 - self.uicollectionviewHeight)
                
                self.uicollectionviewY = window.frame.height
                
                self.getBackGroundView.alpha = 1
                self.uicollectionview.frame = CGRect(x: 0, y: (window.frame.height * self.uicollectionviewHeight), width: window.frame.width, height: self.uicollectionviewValue)
                
                self.uicollectionview.reloadData()
            }, completion: nil)
            
        }
    }
    
    public func _backGroundView(uiview : UIView){
        if let window = getWindow{
            window.addSubview(uiview)
            
            uiview.translatesAutoresizingMaskIntoConstraints = false
            uiview.backgroundColor = UIColor(white: 0, alpha: 0.5)
            uiview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeBottomSheet(gestureRecognizer:))))
            
            uiview.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
            uiview.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
            uiview.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
            uiview.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        }
        
    }
    
}
