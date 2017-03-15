//
//  THDPopupViewController.swift
//  THDPopup

//  Created by Taedong Kim on 2017. 3. 15..
//  Copyright © 2017년 aney. All rights reserved.
//

import UIKit

import Kingfisher
import ManualLayout
import SnapKit

public class THDPopupViewController: UIViewController {
  
  // MARK: Constants
  
  struct Metric {
    static let popupImageViewWidthRatio = CGFloat(580)
    static let popupImageViewHeightRatio = CGFloat(610)
  }
  
  
  // MARK: Properties
  
  var outerViewTop: CGFloat?
  var buttonLeftTitle: String?
  var leftButtonTitle: String?
  var rightButtonTitle: String?
  var imageWidth: CGFloat!
  var imageURL : String?
  var linkURL : String?
  var imageButtonDidTap: (() -> Void)?
  var leftButtonDidTap: (() -> Void)?
  var rightButtonDidTap: (() -> Void)?
  
  
  // MARK: UI
  
  fileprivate let outerView = UIView(frame: .zero)
  fileprivate let imageView = UIImageView(frame: .zero)
  fileprivate let imageButton = UIButton(frame: .zero)
  fileprivate let bottomLeftButton = UIButton(frame: .zero)
  fileprivate let bottomView = UIView(frame: .zero)
  fileprivate let bottomRightButton = UIButton(frame: .zero)
  
  
  // MARK: Initializing
  
  public init(width imageWidth: CGFloat,
       top outerViewTop: CGFloat,
       imageURL: String = "",
       linkURL: String = "",
       leftButtonTitle: String = "",
       rightButtonTitle: String = "",
       imageButtonDidTap: (() -> Void)? = nil,
       leftButtonDidTap: (() -> Void)? = nil,
       rightButtonDidTap: (() -> Void)? = nil) {
    super.init(nibName: nil, bundle: nil)
    self.modalPresentationStyle = .overCurrentContext
    self.imageWidth = imageWidth
    self.outerViewTop = outerViewTop
    self.imageURL = imageURL
    self.leftButtonTitle = leftButtonTitle
    self.rightButtonTitle = rightButtonTitle
    self.imageButtonDidTap = imageButtonDidTap
    self.leftButtonDidTap = leftButtonDidTap
    self.rightButtonDidTap = rightButtonDidTap
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: View Life Cycle
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .clear
    
    self.outerView.backgroundColor = .black
    self.outerView.alpha = 0.5
    
    self.imageButton.backgroundColor = .clear
    self.imageButton.addTarget(self, action: #selector(centerImageButtonDidTap), for: .touchUpInside)
    
    self.bottomView.backgroundColor = .black
    self.bottomView.alpha = 0.5
    
    self.bottomLeftButton.backgroundColor = .clear
    self.bottomLeftButton.addTarget(self, action: #selector(bottomLeftButtonDidTap), for: .touchUpInside)
    self.bottomLeftButton.setTitle(self.leftButtonTitle, for: .normal)
    
    self.bottomRightButton.backgroundColor = .clear
    self.bottomRightButton.addTarget(self, action: #selector(bottomRightButtonDidTap), for: .touchUpInside)
    self.bottomRightButton.setTitle(self.rightButtonTitle, for: .normal)
    
    self.view.addSubview(self.outerView)
    self.view.addSubview(self.imageView)
    self.view.addSubview(self.imageButton)
    self.view.addSubview(self.bottomView)
    self.view.addSubview(self.bottomLeftButton)
    self.view.addSubview(self.bottomRightButton)
    
    self.outerView.snp.makeConstraints { make in
      if let outerViewTop = self.outerViewTop {
        make.top.equalTo(outerViewTop)
      }
      make.left.right.bottom.equalToSuperview()
    }
    
    self.imageView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.width.equalTo(self.imageWidth)
      make.height.equalTo(380)
    }
    
    self.imageButton.snp.makeConstraints { make in
      make.edges.equalTo(self.imageView)
    }
    
    self.bottomView.snp.makeConstraints { make in
      make.left.equalTo(self.imageView.snp.left)
      make.right.equalTo(self.imageView.snp.right)
      make.height.equalTo(50)
      make.bottom.equalToSuperview()
    }
    
    self.bottomLeftButton.snp.makeConstraints { make in
      make.left.equalTo(self.bottomView.snp.left)
      make.right.equalTo(self.bottomView.snp.centerX)
      make.height.equalTo(self.bottomView.snp.height)
      make.bottom.equalTo(self.bottomView.snp.bottom)
    }
    
    self.bottomRightButton.snp.makeConstraints { make in
      make.left.equalTo(self.bottomView.snp.centerX)
      make.right.equalTo(self.bottomView.snp.right)
      make.height.equalTo(self.bottomView.snp.height)
      make.bottom.equalTo(self.bottomView.snp.bottom)
    }
    
    self.imageView.snp.makeConstraints { make in
      make.bottom.equalTo(self.bottomView.snp.top)
    }
    
    self.fetchPopupImage()
  }
  
  override public func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  override public func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: Actions
  
  func centerImageButtonDidTap() {
    if let buttonDidTap = self.imageButtonDidTap {
      buttonDidTap()
    }
  }
  func bottomLeftButtonDidTap() {
    if let buttonDidTap = self.leftButtonDidTap {
      buttonDidTap()
    }
    
  }
  func bottomRightButtonDidTap() {
    if let buttonDidTap = self.rightButtonDidTap {
      buttonDidTap()
    }
  }
  
  func fetchPopupImage() {
    guard let urlString = self.imageURL else { return }
    let url = URL(string: urlString)
    
    // Resizing
    let processor = ResizingImageProcessor(
      targetSize: CGSize(
        width: self.imageView.width,
        height: self.imageView.height
      )
    )
    self.imageView.kf.setImage(
      with: url,
      options: [.processor(processor)]
    )
  }
  
}
