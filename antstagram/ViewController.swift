//
//  ViewController.swift
//  antstagram
//
//  Created by Anthony Gilardi on 3/11/15.
//  Copyright (c) 2015 Anthony Gilardi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var pickedImage: UIImageView!
    
    @IBAction func pickImage(sender: AnyObject) {
    
        var image = UIImagePickerController();
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.Camera
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    @IBAction func createAlert(sender: AnyObject) {
        
        var alert = UIAlertController(title: "Hey There", message: "Are You Sure", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {
            action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func restore(sender: AnyObject) {
        activityIndicator.stopAnimating()
        //UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    
    @IBAction func pause(sender: AnyObject) {
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,50,50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        //UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("image selected")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        pickedImage.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
   
        
        
        var score = PFObject(className: "score")
        score.setObject("Rob", forKey: "name")
        score.setObject(34, forKey: "number")
        score.saveInBackgroundWithBlock{
            (sucess: Bool!, error: NSError!) -> Void in
            
            if sucess == true {
                println("score created with ID: \(score.objectId)")
            } else {
                println(error)
            }
            
        }
        
        println(score)
        
        var query = PFQuery(className: "score")
        query.getObjectInBackgroundWithId("yojxFVYVE5") {
            (score: PFObject!, error: NSError!) -> Void in
            
            if error == nil {
                //println("score created with ID: \(score.objectId)")
                //println(score.objectForKey("name"))
                
                score["name"] = "Robbert"
                score["number"] = 1123
                score.save()
                
            } else {
                println(error)
            }
            
        }
            */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

