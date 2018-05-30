//
//  ViewController2.swift
//  Adding Dynamic Label In Table Cell
//
//  Created by Nitin Bhatia on 25/05/18.
//  Copyright © 2018 Nitin Bhatia. All rights reserved.
//

import UIKit


class ViewControllerWithOutPod: UIViewController {
    
    @IBOutlet weak var lblTest: UILabel!
    
    var text = "travel, madrid, Bunch Club, Crepes & Waffles, Royal Palace of Madrid, Almudena Cathedral, Spain, Test, My name is ios version 3, United Airlines, United, wer ed, wer, ghut, ghut pool, United_1, United2, United3"
    let tagIdStr = "55,119,301,302,303,304,305,98,78,56,34,34,54,890,87,4,5,6"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //Mark:- Setting attributed text in label
        let myAttribute = [ NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17) ]
        let myString = NSMutableAttributedString(string: text, attributes: myAttribute )
        lblTest.attributedText = myString
        
        //Mark:- Setting gesture to label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapLabel(gesture:)))
        lblTest.addGestureRecognizer(tapGesture)
        lblTest.isUserInteractionEnabled = true
        
       
        
        
        
    }
    
   
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        let text = (lblTest.text)!
        let tapLocation = gesture.location(in: lblTest)
        let index = lblTest.indexOfAttributedTextCharacterAtPoint(point: tapLocation)
        
        let temp = text.components(separatedBy: ",")
        let pol = tagIdStr.components(separatedBy: ",")
        var x : [String:String] = [:]



        for (index,i) in temp.enumerated() {
            x[i] = pol[index]
        }

        
        for (index1,i) in temp.enumerated(){
            if ( index1 == 0){
                let range = (text as NSString).range(of:i)
                if index > range.location && index < range.location + range.length {
                    //YES, THE TAPPED CHARACTER IS IN RANGE
                    print("got it, " + i)
                    print("got it id," + x[i]!)
                }
            } else if (index1 > 0 && index1 < temp.count - 1) {
                let range = (text as NSString).range(of:","+i+",")
                if index > range.location && index < range.location + range.length {
                    //YES, THE TAPPED CHARACTER IS IN RANGE
                    print("got it , " + i)
                    print("got it id," + x[i]!)

                }
            } else {
                let range = (text as NSString).range(of:","+i)
                if index > range.location && index < range.location + range.length {
                    //YES, THE TAPPED CHARACTER IS IN RANGE
                    print("got it , " + i)
                    print("got it id," + x[i]!)

                }
            }
            
        }
        
       
    }
}


extension UILabel {
    ///Find the index of character (in the attributedText) at point
    func indexOfAttributedTextCharacterAtPoint(point: CGPoint) -> Int {
        assert(self.attributedText != nil, "This method is developed for attributed string")
        let textStorage = NSTextStorage(attributedString: self.attributedText!)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size: self.frame.size)
        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = self.numberOfLines
        textContainer.lineBreakMode = self.lineBreakMode
        layoutManager.addTextContainer(textContainer)
        
        let index = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return index
    }
}



