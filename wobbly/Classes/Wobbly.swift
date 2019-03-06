
//
//  wobbly.swift
//  WOBBLY
//
//  Created by Sagaya Abdulhafeez on 04/03/2019.
//  Copyright © 2019 Flutterwave. All rights reserved.
//

import UIKit

public extension UIView{
    @objc func bounce(rate:CGFloat = 30){
        let currentCenter = center
        let animator = UIViewPropertyAnimator(duration: 0.8, dampingRatio: 0.8, animations: nil)
        animator.addAnimations({
            self.center.y -= rate
        }, delayFactor: 0)
        animator.addAnimations({
            self.center.y = currentCenter.y
        }, delayFactor: 0.4)
        animator.startAnimation()
    }
    func flash(loop: Bool = false){
        
        let animationOptions:UIView.AnimationOptions = loop ? [.autoreverse,.repeat] : [.autoreverse]
        UIView.animate(withDuration: 0.5, delay: 0, options: animationOptions, animations: {
            self.alpha = 0
        }) { (_) in
            self.alpha = 1
        }
    }
    func pulse(){
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.transform = .identity
            })
        }, completion: nil)
    }
    func rubberBand(xScale:CGFloat = 2, yScale: CGFloat = 0.7){
        UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: yScale)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.transform = CGAffineTransform(scaleX: xScale, y: yScale)
            })
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
                self.transform = .identity
            }, completion: nil)
        }
    }
    func shake(){
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func swing(){
        //Use a better one
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.rotation"
        animation.values = [0, 0.3, -0.3, 0.3, 0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        animation.duration = CFTimeInterval(1)
        animation.isAdditive = true
        animation.repeatCount = 1
        animation.beginTime = CACurrentMediaTime() + CFTimeInterval(0)
        layer.add(animation, forKey: "swing")
    }
    func tada(){
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6, animations: {
                self.transform = CGAffineTransform(rotationAngle: 270).scaledBy(x: 0.7, y: 0.7)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                self.transform = CGAffineTransform.identity.scaledBy(x: 2, y: 2)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.1, animations: {
                self.transform = .identity
            })
        }) { (_) in
            
        }
    }
    
    func hearbeat(){
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.16, relativeDuration: 0.2, animations: {
                self.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.32, relativeDuration: 0.2, animations: {
                self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.64, relativeDuration: 0.2, animations: {
                self.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2, animations: {
                self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.96, relativeDuration: 0.2, animations: {
                self.transform = .identity
            })
        }, completion: nil)
    }
    
    func jello(){
        //Needs improvement
        let animator = UIViewPropertyAnimator(duration: 2, dampingRatio: 0.3, animations: nil)
        animator.addAnimations({
            self.transform = CGAffineTransform(rotationAngle: 5.93412).scaledBy(x: 1.1, y: 1.1)
        }, delayFactor: 0)
        animator.addAnimations({
            self.transform = .identity
        }, delayFactor: 0.1)
        
        animator.addCompletion { (_) in
            self.jello()
        }
        animator.startAnimation()
    }
    //MARK-:Bounce Entrance Animations
    func bounceInDown(){
        let originalPoint = self.center.y
        self.center.y = -((self.superview?.frame.height)!)
        let animator = UIViewPropertyAnimator(duration: 2, dampingRatio: 0.7, animations: nil)
        animator.addAnimations({
            self.center.y = originalPoint
        })
        animator.startAnimation()
    }
    func bounceInLeft(){
        let originalPoint = self.center.x
        self.center.x = -((self.superview?.frame.width)!)
        let animator = UIViewPropertyAnimator(duration: 2, dampingRatio: 0.7, animations: nil)
        animator.addAnimations({
            self.center.x = originalPoint
        })
        animator.startAnimation()
    }
    func bounceInRight(){
        let originalPoint = self.center.x
        self.center.x = ((self.superview?.frame.width)!)
        let animator = UIViewPropertyAnimator(duration: 2, dampingRatio: 0.7, animations: nil)
        animator.addAnimations({
            self.center.x = originalPoint
        })
        animator.startAnimation()
    }
    func bounceInUp(){
        let originalPoint = self.center.y
        self.center.y = ((self.superview?.frame.height)!)
        let animator = UIViewPropertyAnimator(duration: 2, dampingRatio: 0.7, animations: nil)
        animator.addAnimations({
            self.center.y = originalPoint
        })
        animator.startAnimation()
    }
    //MARK-:Bounce Exit Animations
    
    func bounceOut(){
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3, animations: {
                self.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                self.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
                self.transform = CGAffineTransform(scaleX: 0, y: 0)
                self.alpha = 0
            })
        }, completion: nil)
    }
    func bounceOutDown(){
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3, animations: {
                self.center.y += 7
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                self.center.y -= 14
            })
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
                self.center.y = ((self.superview?.frame.height)!) + self.frame.height
            })
        }, completion: nil)
    }
    func bounceOutLeft(){
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.center.x += 15
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.center.x = -(((self.superview?.frame.width)!) + self.frame.width)
            })
        }, completion: nil)
    }
    func bounceOutRight(){
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.center.x -= 15
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.center.x = (((self.superview?.frame.width)!) + self.frame.width)
            })
        }, completion: nil)
    }
    func bounceOutUp(){
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3, animations: {
                self.center.y -= 7
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                self.center.y += 14
            })
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
                self.center.y = -((self.superview?.frame.height)!) + self.frame.height
            })
        }, completion: nil)
    }
    //FADE IN ANIMATIONS
    func fadeIn(){
        self.alpha = 0
        UIView.animate(withDuration: 1.5) {
            self.alpha = 1
        }
    }
    func fadeInDown(){
        let currentCenter = self.center
        self.alpha = 0
        self.center.y -= 30
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.y = currentCenter.y
            self.alpha = 1
        }, completion: nil)
    }
    func fadeInDownBig(){
        let currentCenter = self.center
        self.alpha = 0
        self.center.y -= self.superview?.frame.height ?? 30
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.y = currentCenter.y
            self.alpha = 1
        }, completion: nil)
    }
    func fadeInLeft(){
        let currentCenter = self.center
        self.alpha = 0
        self.center.x -= 35
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.x = currentCenter.x
            self.alpha = 1
        }, completion: nil)
    }
    func fadeInLeftBig(){
        let currentCenter = self.center
        self.alpha = 0
        self.center.x -= self.superview?.frame.width ?? 30
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.x = currentCenter.x
            self.alpha = 1
        }, completion: nil)
    }
    func fadeInRight(){
        let currentCenter = self.center
        self.alpha = 0
        self.center.x += 35
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.x = currentCenter.x
            self.alpha = 1
        }, completion: nil)
    }
    func fadeInRightBig(){
        let currentCenter = self.center
        self.alpha = 0
        self.center.x += self.superview?.frame.width ?? 30
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.x = currentCenter.x
            self.alpha = 1
        }, completion: nil)
    }
    func fadeInUp(){
        let currentCenter = self.center
        self.alpha = 0
        self.center.y += 30
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.y = currentCenter.y
            self.alpha = 1
        }, completion: nil)
    }
    func fadeInUpBig(){
        let currentCenter = self.center
        self.alpha = 0
        self.center.y += self.superview?.frame.height ?? 30
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.y = currentCenter.y
            self.alpha = 1
        }, completion: nil)
    }
    //FADE Out ANIMATIONS
    
    func fadeOut(){
        UIView.animate(withDuration: 1.5) {
            self.alpha = 0
        }
    }
    func fadeOutDown(){
        let currentCenter = self.center
        self.center.y -= 30
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.y = currentCenter.y
            self.alpha = 0
        }, completion: nil)
    }
    func fadeOutDownBig(){
        let currentCenter = self.center
        self.center.y -= self.superview?.frame.height ?? 30
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.y = currentCenter.y
            self.alpha = 0
        }, completion: nil)
    }
    func fadeOutLeft(){
        let currentCenter = self.center
        self.center.x -= 35
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.x = currentCenter.x
            self.alpha = 0
        }, completion: nil)
    }
    func fadeOutLeftBig(){
        let currentCenter = self.center
        self.center.x -= self.superview?.frame.width ?? 30
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.x = currentCenter.x
            self.alpha = 0
        }, completion: nil)
    }
    func fadeOutRight(){
        let currentCenter = self.center
        self.center.x += 35
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.x = currentCenter.x
            self.alpha = 0
        }, completion: nil)
    }
    func fadeOutRightBig(){
        let currentCenter = self.center
        self.center.x += self.superview?.frame.width ?? 30
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.x = currentCenter.x
            self.alpha = 0
        }, completion: nil)
    }
    func fadeOutUp(){
        let currentCenter = self.center
        self.center.y += 30
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.y = currentCenter.y
            self.alpha = 0
        }, completion: nil)
    }
    func fadeOutUpBig(){
        let currentCenter = self.center
        self.center.y += self.superview?.frame.height ?? 30
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: [], animations: {
            self.center.y = currentCenter.y
            self.alpha = 0
        }, completion: nil)
    }
    //Flipping aimations
    
    func flipLeft(){
        UIView.transition(with: self, duration: 1.5, options: [.transitionFlipFromLeft], animations: {
            
        }, completion: nil)
    }
    func flipInRight(){
        UIView.transition(with: self, duration: 1.5, options: [.transitionFlipFromRight], animations: {
            
        }, completion: nil)
    }
    func flipInDown(){
        UIView.transition(with: self, duration: 1.5, options: [.transitionFlipFromBottom], animations: {
            
        }, completion: nil)
    }
    func flipInUp(){
        UIView.transition(with: self, duration: 1.5, options: [.transitionFlipFromTop], animations: {
            
        }, completion: nil)
    }
    
}
