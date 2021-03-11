//
//  ViewController.swift
//  UIPasteboardExample
//
//  Created by Phatcharaphan Ananpreechakun on 11/3/2564 BE.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func didTapCopyText(_ sender: Any) {
    copyText(from: "Loyalty")
    
  }
  
  func copyText(from text: String) {
    let pasteboard = UIPasteboard.general
    pasteboard.string = text
    showToast(message: text)
  }
  
  func showToast(message: String) {
    let toastContainer = UIView(frame: CGRect())
    toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastContainer.alpha = 0.0
    toastContainer.layer.cornerRadius = 20;
    toastContainer.clipsToBounds  =  true
    
    let toastLabel = UILabel(frame: CGRect())
    toastLabel.textColor = UIColor.white
    toastLabel.textAlignment = .center;
    toastLabel.font.withSize(12.0)
    toastLabel.text = message
    toastLabel.clipsToBounds  =  true
    toastLabel.numberOfLines = 0
    
    toastContainer.addSubview(toastLabel)
    self.view.addSubview(toastContainer)
    
    toastLabel.translatesAutoresizingMaskIntoConstraints = false
    toastContainer.translatesAutoresizingMaskIntoConstraints = false
    
    let centerX = NSLayoutConstraint(item: toastLabel, attribute: .centerX, relatedBy: .equal, toItem: toastContainer, attribute: .centerXWithinMargins, multiplier: 1, constant: 0)
    let lableBottom = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
    let lableTop = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
    toastContainer.addConstraints([centerX, lableBottom, lableTop])
    
    let containerCenterX = NSLayoutConstraint(item: toastContainer, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
    let containerTrailing = NSLayoutConstraint(item: toastContainer, attribute: .width, relatedBy: .equal, toItem: toastLabel, attribute: .width, multiplier: 1.1, constant: 100)
    let containerTop = NSLayoutConstraint(item: toastContainer, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 145)
    self.view.addConstraints([containerCenterX,containerTrailing, containerTop])
    
    UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
      toastContainer.alpha = 1.0
    }, completion: { _ in
      UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
        toastContainer.alpha = 0.0
      }, completion: {_ in
        toastContainer.removeFromSuperview()
      })
    })
  }
  
  
}

