//
//  CircleCropView.swift
//  CIrcleCropView
//
//  Created by Bhavesh Chaudhari on 08/05/20.
//  Copyright © 2020 Bhavesh. All rights reserved.
//

import UIKit


public class CircleCropView: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        setupMask()
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupMask()
    }

    var circleInset: CGRect {
        let rect = bounds
        let minSize = min(rect.width, rect.height)
        let hole = CGRect(x: (rect.width - minSize) / 2, y: (rect.height - minSize) / 2, width: minSize, height: minSize).insetBy(dx: 15, dy: 15)
        
        return hole
    }
    
    func setupMask() {
          
       let sampleMask = UIView()
          
          
          sampleMask.frame = self.frame
          sampleMask.backgroundColor =  UIColor.black.withAlphaComponent(0.6)
          
          self.addSubview(sampleMask)
          let maskLayer = CALayer()
          maskLayer.frame = sampleMask.bounds
          let circleLayer = CAShapeLayer()
          
          circleLayer.frame = CGRect(x:0 , y:0,width: sampleMask.frame.size.width,height: sampleMask.frame.size.height)
          
          let finalPath = UIBezierPath(roundedRect: self.frame, cornerRadius: 0)
          let circlePath = UIBezierPath(ovalIn: circleInset)
          
          finalPath.append(circlePath.reversing())
          circleLayer.path = finalPath.cgPath
          circleLayer.borderColor = UIColor.black.withAlphaComponent(1).cgColor
          circleLayer.borderWidth = 1
          maskLayer.addSublayer(circleLayer)
          sampleMask.isUserInteractionEnabled = false
          sampleMask.layer.mask = maskLayer
          
      }
}
