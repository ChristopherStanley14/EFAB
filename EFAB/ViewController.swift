//
//  ViewController.swift
//  EFAB
//
//  Created by Christopher Stanley on 10/31/16.
//  Copyright © 2016 Christopher Stanley. All rights reserved.
//

import UIKit
import Alamofire
import Freddy

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let test = Test()
        
        WebServices.shared.getObject(test) { (object, error) in
            if let object = object {
                print(object.description())
            } else {
                print (error ?? Constants.JSON.unknownError)
            }
        }
        
        // get many posts
        let getPostsTest = Test()
        getPostsTest.requestType = .getPost
        
        WebServices.shared.getObjects(getPostsTest) { (objects, error) in
            if let objects = objects {
                print("got \(objects.count) items")
            } else {
                print("get posts failed")
            }
        }
        
    }
}
