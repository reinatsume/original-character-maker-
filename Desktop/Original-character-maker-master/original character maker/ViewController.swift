//
//  ViewController.swift
//  original character maker
//
//  Created by 金森彦磨呂 on 2016/01/13.
//  Copyright © 2016年 金森彦磨呂. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIActionSheetDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var noseImageView: UIImageView!
    @IBOutlet var eyeImageView: UIImageView!
    @IBOutlet var hairImageView: UIImageView!
    @IBOutlet var facelineImageView: UIImageView!
    @IBOutlet var part1Bt: UIButton!
    @IBOutlet var part2Bt: UIButton!
    @IBOutlet var part3Bt: UIButton!
    @IBOutlet var part4Bt: UIButton!
    @IBOutlet var myCollectionView : UICollectionView!
    @IBOutlet var myCollectionView2 : UICollectionView!
    
    
    var number: Int = 0
    
    var imageArray:[String] = []
    var buttonArray:[UIButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: "longPressGesture:")
        longPressGesture.minimumPressDuration = 1.0
        longPressGesture.allowableMovement = 150
        self.view.addGestureRecognizer(longPressGesture)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        imageArray = ["eye1.png", "eye2.png","eye3.png","eye4.png"]
        myCollectionView2.delegate = self
        myCollectionView2.dataSource = self
        buttonArray = [part1Bt, part2Bt, part3Bt, part4Bt]
    }
    
    //
    func longPressGesture(sender: UILongPressGestureRecognizer){
        if sender.state == UIGestureRecognizerState.Began {
            let sheet: UIActionSheet = UIActionSheet()
            sheet.delegate = self
            sheet.title = "画像を保存しますか？byながた"
            sheet.addButtonWithTitle("Cancel")
            sheet.addButtonWithTitle("画像を保存")
            sheet.cancelButtonIndex = 0
            sheet.showInView(self.view)
        }
    }
    
    //MARK: collectionViewの設定
    /*
    Cellが選択された際に呼び出される
    */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        switch number {
        case 1:
            let imageName = "eye" + String(indexPath.row + 1) + ".png"
            eyeImageView.image = UIImage(named: imageName)
        case 2:
            let imageName = "nose" + String(indexPath.row + 1) + ".png"
            noseImageView.image = UIImage(named: imageName)
        case 3:
            let imageName = "hair" + String(indexPath.row + 1) + ".png"
            hairImageView.image = UIImage(named: imageName)
        default:
            break
        }
        
        
    }
    
    /*
    Cellの総数を返す
    */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    /*
    Cellに値を設定する
    */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell",
            forIndexPath: indexPath)
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: imageArray[indexPath.row])
        
        
        return cell
    }
    
    func collectionView2(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonArray.count
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapEyeBt(){
        //ボタンの画像を切り替える
        //        part1Bt.setBackgroundImage(UIImage(named: "eye1.png"), forState: UIControlState.Normal)
        //        part2Bt.setBackgroundImage(UIImage(named: "eye2.png"), forState: UIControlState.Normal)
        //        part3Bt.setBackgroundImage(UIImage(named: "eye3.png"), forState: UIControlState.Normal)
        //        part4Bt.setBackgroundImage(UIImage(named: "eye4.png"), forState: UIControlState.Normal)
        imageArray = ["eye1.png", "eye2.png","eye3.png","eye4.png"]
        myCollectionView.reloadData()
        
        number = 1
        
    }
    @IBAction func tapNoseBt(){
        //ボタンの画像を切り替える
        //        part1Bt.setBackgroundImage(UIImage(named: "nose1.png"), forState: UIControlState.Normal)
        //        part2Bt.setBackgroundImage(UIImage(named: "nose2.png"), forState: UIControlState.Normal)
        //        part3Bt.setBackgroundImage(UIImage(named: "nose3.png"), forState: UIControlState.Normal)
        //        part4Bt.setBackgroundImage(UIImage(named: "nose4.png"), forState: UIControlState.Normal)
        imageArray = ["nose1.png", "nose2.png","nose3.png","nose4.png"]
        myCollectionView.reloadData()
        
        number = 2
        
    }
    @IBAction func tapHairBt(){
        //ボタンの画像を切り替える
        //        part1Bt.setBackgroundImage(UIImage(named: "hair1.png"), forState: UIControlState.Normal)
        //        part2Bt.setBackgroundImage(UIImage(named: "hair2.png"), forState: UIControlState.Normal)
        //        part3Bt.setBackgroundImage(UIImage(named: "hair3.png"), forState: UIControlState.Normal)
        //        part4Bt.setBackgroundImage(UIImage(named: "hair4.png"), forState: UIControlState.Normal)
        imageArray = ["hair1.png", "hair2.png","hair3.png","hair4.png"]
        myCollectionView.reloadData()
        
        number = 3
        
    }
    
    @IBAction func tapPart1Bt(sender: UIButton){
        
        
        switch number {
        case 1:
            let imageName = "eye" + String(sender.tag) + ".png"
            eyeImageView.image = UIImage(named: imageName)
        case 2:
            let imageName = "nose" + String(sender.tag) + ".png"
            noseImageView.image = UIImage(named: imageName)
        case 3:
            let imageName = "hair" + String(sender.tag) + ".png"
            hairImageView.image = UIImage(named: imageName)
        default:
            break
        }
        
        
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(288, 288), true,0)
            let imageArray: [UIImageView?] = [facelineImageView, noseImageView,hairImageView,eyeImageView]
            for item in imageArray{
                let image = item?.image
                image!.drawInRect(item!.frame)
            }
            var faceImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            UIImageWriteToSavedPhotosAlbum(faceImage, nil, nil, nil)
        }
        
    }
    
    //保存ボタンを押したら
    @IBAction func tapImageBt(){
        //ビットマップ形式のグラフィックスコンテキストの生成
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(288, 288), true,0)
        let imageArray: [UIImageView?] = [facelineImageView, noseImageView,hairImageView,eyeImageView]
        for item in imageArray{
            let image = item?.image
            image!.drawInRect(item!.frame)
        }
        var faceImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(faceImage, nil, nil, nil)
    }
    //    @IBAction func tapPart2Bt(){
    //        switch number {
    //        case 1:
    //            eyeImageView.image = UIImage(named: "eye2.png")
    //        case 2:
    //            noseImageView.image = UIImage(named: "nose2.png")
    //        case 3:
    //            hairImageView.image = UIImage(named: "hair2.png")
    //        default:
    //            break
    //        }
    
    //    }
    
    
    
    
}

