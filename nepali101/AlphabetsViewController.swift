//
//  AphabetsViewController.swift
//  nepali101
//
//  Created by Sanjay Shrestha on 8/10/16.
//  Copyright © 2016 Dreams and Ideas. All rights reserved.
//

import UIKit

class AlphabetsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
   // let alphabets = [ConsonantsConstant.KA, ConsonantsConstant.KHA, ConsonantsConstant.GA]
    //"B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    
    var consonants = [Alphabet]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        //Confirming to delegate
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        //layout.itemSize = CGSize(width: screenWidth / 3, height: screenWidth / 3)
       // collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0

        
        
        parseJSON()
        
        // Do any additional setup after loading the view.
    }

    
    
    func parseJSON(){
        
        guard let path = NSBundle.mainBundle().pathForResource("Consonants", ofType: "json") else {
            print("Error finding file")
            return
        }
            do{
                let data = NSData(contentsOfFile: path)
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? NSDictionary //MutableContainers
                //print(jsonDictionary)
                {
                    let dataArray = jsonResult["Consonants"] as! NSArray
                    for item in dataArray{
                        let consonant = Alphabet(letter: "", sound: "", word: "", englishLetter: "", englishWord: "", image: "")
                        consonant.setValuesForKeysWithDictionary(item as! [String : AnyObject])
                        print(consonant.letter)
                        self.consonants.append(consonant)
                    }}
                
            } catch let error as NSError{
                print("Error: \n \(error)")
                return
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return consonants.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CustomCollectionViewCell
        cell.alphabetLabel.text = self.consonants[indexPath.row].letter

        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        print("didselectrowatindex")
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AlphabetPopUp") as! AlphabetPopUpViewController
        popOverVC.consonants = self.consonants
        popOverVC.indexPath = indexPath.row
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMoveToParentViewController(self)
    }
   /* func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.row == 0
        {
            return CGSize(width: screenWidth, height: screenWidth/3)
        }
        return CGSize(width: screenWidth/3, height: screenWidth/3);
        
    }*/
    

   


}

/*
class CustomViewFlowLayout : UICollectionViewFlowLayout {
    
    let cellSpacing:CGFloat = 10
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        if let attributes = super.layoutAttributesForElementsInRect(rect) {
            for (index, attribute) in attributes.enumerate() {
                if index == 0 { continue }
                let prevLayoutAttributes = attributes[index - 1]
                let origin = CGRectGetMaxX(prevLayoutAttributes.frame)
                if(origin + cellSpacing + attribute.frame.size.width < self.collectionViewContentSize().width) {
                    attribute.frame.origin.x = origin + cellSpacing
                }
            }
            return attributes
        }
        return nil
    }
} */

