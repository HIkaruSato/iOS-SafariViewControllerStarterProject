//
//  ViewController.swift
//  GettingStartedWithSafariViewController
//
//  Created by Jordan Morgan on 6/25/15.
//  Copyright © 2015 Jordan Morgan. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController
{
    private var urlString:String = "https://google.com"

    //MARK: Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Web Content Presenting
    @IBAction func openInSafari(sender: AnyObject)
    {
        //TODO: Open in native safari
        let url = NSURL(string: self.urlString)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func openWithSafariVC(sender: AnyObject)
    {
        //TODO: Open in safari view controller
//        let alert = UIAlertController(title: "", message: "entersReaderIfAvailableを選択してください。", preferredStyle: UIAlertControllerStyle.Alert)
//        alert.addAction(UIAlertAction(title: "true", style: UIAlertActionStyle.Default, handler: { (_) in
//            self.presentSFSafariViewController(true)
//        }))
//        alert.addAction(UIAlertAction(title: "false", style: UIAlertActionStyle.Default, handler: { (_) in
//            self.presentSFSafariViewController(false)
//        }))
//        self.presentViewController(alert, animated: true, completion: nil)
        self.presentSFSafariViewController(true)
    }
    
    func presentSFSafariViewController(entersReaderIfAvailable:Bool) {
        let svc = SFSafariViewController(URL: NSURL(string: self.urlString)!, entersReaderIfAvailable: entersReaderIfAvailable)
        self.presentViewController(svc, animated: entersReaderIfAvailable, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        //TODO: open in webview
        if let navVC = segue.destinationViewController as? UINavigationController
        {
            let cwvc = navVC.topViewController as! CustomWebViewController
            cwvc.urlString = self.urlString
        }
    }
}

