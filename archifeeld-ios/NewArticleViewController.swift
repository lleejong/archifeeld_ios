//
//  NewArticleViewController.swift
//  archifeeld-ios
//
//  Created by LLEEJONG on 2016. 8. 11..
//  Copyright © 2016년 archifeeld. All rights reserved.
//

import UIKit

class NewArticleViewController: UIViewController {

    
    @IBOutlet weak var contentField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addArticleBtn(sender: UIButton) {
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
