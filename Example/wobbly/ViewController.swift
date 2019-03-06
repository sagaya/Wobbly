//
//  ViewController.swift
//  wobbly
//
//  Created by sagaya on 03/05/2019.
//  Copyright (c) 2019 sagaya. All rights reserved.
//

import UIKit
import wobbly

func delay(with time: TimeInterval, completion: @escaping () -> Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
        completion()
    }
}
extension UILabel {
    func setTextColorToGradient(image: UIImage) {
        UIGraphicsBeginImageContext(frame.size)
        image.draw(in: bounds)
        let myGradient = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.textColor = UIColor(patternImage: myGradient!)
    }
}
extension UIView{
    func makeRoundCorner(radius: CGFloat){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

enum AnimationType: String, CaseIterable{
    case bounce = "Bounce",
    flash = "Flash",
    pulse = "Pulse",
    rubberBand = "Rubber Band",
    shake = "Shake",
    swing = "Swing",
    tada = "Tada",
    hearbeat = "Hearbeat",
    jello = "Jello",
    bounceDown = "Bounce In Down",
    bounceInLeft = "Bounce In Left",
    bounceInRight = "Bounce In Right",
    bounceInUp  = "Bounce In Up",
    bounceOut = "Bounce Out",
    bounceOutDown = "Bounce Out Down",
    bounceOutLeft = "Bounce Out Left",
    bounceOutRight = "Bounce Out Right",
    bounceOutUp = "Bounce Out Up",
    fadeIn = "Fade In",
    fadeInDown = "Fdade In Down",
    fadeInDownBig = "Fade In Down Big",
    fadeInLeft = "Fade In Left",
    fadeInLeftBig = "Fade In Left Big",
    fadeInRight = "Fade In Right",
    fadeInRightBig = "Fade In Right Big",
    fadeInUp = "Fade In Up",
    fadeInUpBig = "Fade In Up Big",
    
    fadeOut = "Fade Out",
    fadeOutDown = "Fdade Out Down",
    fadeOutDownBig = "Fade Out Down Big",
    fadeOutLeft = "Fade Out Left",
    fadeOutLeftBig = "Fade Out Left Big",
    fadeOutRight = "Fade Out Right",
    fadeOutRightBig = "Fade Out Right Big",
    fadeOutUp = "Fade Out Up",
    fadeOutUpBig = "Fade Out Up Big",
    flip = "Flip Left",
    flipInRight = "Flip Right",
    flipInDown = "Flip Down",
    flipInUp = "Flip Up"
    
}

struct RoundedState {
    var view = false
    var button = false
}

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var wobblyView: UIView!
    @IBOutlet weak var wobblyButton: UIButton!
    @IBOutlet weak var wobblyLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var countriesArray:[String] = Array()
    var stateNumbersArray:[String] = Array()
    
    var views: [UIView] = Array()
    var animations = AnimationType.allCases.self
    var selectedView:UIView?
    var selectedAnimation:AnimationType?
    var roundedState = RoundedState()
    
    var wobblyViewPosition:CGRect?
    var wobblyButtonPosition:CGRect?
    var wobblyLabelPosition:CGRect?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wobblyLabel.setTextColorToGradient(image: UIImage(named: "11.jpg")!)
        wobblyButton.makeRoundCorner(radius: 10)
        wobblyView.makeRoundCorner(radius: 8)
        self.views.append(wobblyLabel)
        self.views.append(wobblyView)
        self.views.append(wobblyButton)
        self.selectedView = views[0]
        self.selectedAnimation = animations[0]
        pickerView.delegate = self
        pickerView.dataSource = self
        self.wobblyViewPosition = self.wobblyView.frame
        self.wobblyButtonPosition = self.wobblyButton.frame
        self.wobblyLabelPosition = self.wobblyLabel.frame
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(makeRound))
        self.wobblyView.isUserInteractionEnabled = true
        self.wobblyView.addGestureRecognizer(tapGesture)
        
    }
    @objc func makeRound(){
        switch roundedState.view {
        case true:
            roundedState.view = false
            self.wobblyView.makeRoundCorner(radius: wobblyView.frame.height / 2)
            break;
        case false:
            roundedState.view = true
            self.wobblyView.makeRoundCorner(radius: 10)
            break;
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        self.wobblyButton.bounceInUp()
        //        self.wobblyView.bounceInUp()
        //        self.wobblyLabel.bounceInUp()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return animations.count
        }
        return views.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return animations[row].rawValue
        }
        return views[row].accessibilityIdentifier
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            self.selectedAnimation = animations[row]
            animate(with: row)
        }else{
            self.selectedView = views[row]
            animate(with: row)
        }
    }
    
    fileprivate func resetAnimation() {
        self.wobblyButton.frame = wobblyButtonPosition!
        self.wobblyView.frame = wobblyViewPosition!
        self.wobblyLabel.frame = wobblyLabelPosition!
        self.wobblyLabel.alpha = 1
        self.wobblyView.alpha = 1
        self.wobblyButton.alpha = 1
        self.wobblyLabel.center.x = self.view.center.x
        self.wobblyButton.center.x = self.view.center.x
        self.wobblyView.center.x = self.view.center.x
        
    }
    
    func animate(with row: Int){
        
        resetAnimation()
        
        switch selectedAnimation{
        case .some(.bounce):
            self.selectedView?.bounce()
        case .some(.flash):
            self.selectedView?.flash()
        case .some(.pulse):
            self.selectedView?.pulse()
        case .some(.rubberBand):
            self.selectedView?.rubberBand()
        case .some(.shake):
            self.selectedView?.shake()
        case .some(.swing):
            self.selectedView?.swing()
        case .some(.tada):
            self.selectedView?.tada()
        case .some(.hearbeat):
            self.selectedView?.hearbeat()
        case .none:
            break;
        case .some(.jello):
            self.selectedView?.jello()
        case .some(.bounceDown):
            self.selectedView?.bounceInDown()
        case .some(.bounceInLeft):
            self.selectedView?.bounceInLeft()
        case .some(.bounceInRight):
            self.selectedView?.bounceInRight()
        case .some(.bounceInUp):
            self.selectedView?.bounceInUp()
        case .some(.bounceOut):
            self.selectedView?.bounceOut()
        case .some(.bounceOutDown):
            self.selectedView?.bounceOutDown()
        case .some(.bounceOutLeft):
            self.selectedView?.bounceOutLeft()
        case .some(.bounceOutRight):
            self.selectedView?.bounceOutRight()
        case .some(.bounceOutUp):
            self.selectedView?.bounceOutUp()
        case .some(.fadeIn):
            self.selectedView?.fadeIn()
        case .some(.fadeInDown):
            self.selectedView?.fadeInDown()
        case .some(.fadeInDownBig):
            self.selectedView?.fadeInDownBig()
        case .some(.fadeInLeft):
            self.selectedView?.fadeInLeft()
        case .some(.fadeInLeftBig):
            self.selectedView?.fadeInLeftBig()
        case .some(.fadeInRight):
            self.selectedView?.fadeInRight()
        case .some(.fadeInRightBig):
            self.selectedView?.fadeInRightBig()
        case .some(.fadeInUp):
            self.selectedView?.fadeInUp()
        case .some(.fadeInUpBig):
            self.selectedView?.fadeInUpBig()
        case .some(.fadeOut):
            self.selectedView?.fadeOut()
        case .some(.fadeOutDown):
            self.selectedView?.fadeOutDown()
        case .some(.fadeOutDownBig):
            self.selectedView?.fadeOutDownBig()
        case .some(.fadeOutLeft):
            self.selectedView?.fadeOutLeft()
        case .some(.fadeOutLeftBig):
            self.selectedView?.fadeOutLeftBig()
        case .some(.fadeOutRight):
            self.selectedView?.fadeOutRight()
        case .some(.fadeOutRightBig):
            self.selectedView?.fadeOutRightBig()
        case .some(.fadeOutUp):
            self.selectedView?.fadeOutUp()
        case .some(.fadeOutUpBig):
            self.selectedView?.fadeOutUpBig()
        case .some(.flip):
            self.selectedView?.flipLeft()
        case .some(.flipInRight):
            self.selectedView?.flipInRight()
        case .some(.flipInDown):
            self.selectedView?.flipInDown()
        case .some(.flipInUp):
            self.selectedView?.flipInUp()
        }
    }
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            let randomNumber  = Int.random(in: 0...animations.count)
            self.pickerView.selectRow(randomNumber, inComponent: 0, animated: true)
            self.pickerView(self.pickerView, didSelectRow: randomNumber, inComponent: 0)
        }
    }
}
