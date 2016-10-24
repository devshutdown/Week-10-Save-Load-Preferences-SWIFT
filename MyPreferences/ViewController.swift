//
//  ViewController.swift
//  MyPreferences
//
//  Created by Charles Konkol on 3/23/15.
//  Copyright (c) 2015 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBAction func btnClear(sender: AnyObject) {
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(nil, forKey: "username")
        defaults.setObject(nil, forKey: "password")
        defaults.setObject(nil, forKey: "color")
        
        defaults.synchronize()
        
        txtUsername.text = ""
        txtPassword.text = ""
        MyColors.selectRow(0,inComponent: 0, animated: true)
 txtUsername.becomeFirstResponder()
        
    }
    
    //color
    var selectedcolor:String!
    let pickerColor = ["Purple","Orange","Green", "Gray"]
    @IBAction func btnLoad(sender: UIButton) {
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let userNameNotNull = defaults.objectForKey("username") as? String {
            self.txtUsername.text = defaults.objectForKey("username") as? String
        }
        
        if let passwordIsNotNill = defaults.objectForKey("password") as? String {
            self.txtPassword.text = defaults.objectForKey("password") as? String
        }
        
        
        if let colorIsNotNill = defaults.objectForKey("color") as? String {
            var favoriteColorSelected = defaults.objectForKey("color") as! String
            let SelectedColor:Int = (pickerColor).indexOf(favoriteColorSelected)!
           
            if (favoriteColorSelected=="Purple")
            {
                self.view.backgroundColor = UIColor.purpleColor()
            }
            if (favoriteColorSelected=="Orange")
            {
                self.view.backgroundColor = UIColor.orangeColor()
            }
            if (favoriteColorSelected=="Green")
            {
                self.view.backgroundColor = UIColor.greenColor()
            }
            if (favoriteColorSelected=="Gray")
            {
                self.view.backgroundColor = UIColor.grayColor()
            }
            

            MyColors.selectRow(SelectedColor,inComponent: 0, animated: true)
        }
    }
    
    @IBOutlet weak var txtUsername: UITextField!

    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var MyColors: UIPickerView!
    
    
    @IBAction func btnSave(sender: UIButton) {
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(self.txtUsername.text, forKey: "username")
        defaults.setObject(self.txtPassword.text, forKey: "password")
        defaults.setObject(selectedcolor, forKey: "color")
      
        
        defaults.synchronize()
    }
    
    //Needed for picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerColor.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         selectedcolor=pickerColor[row]
        if (selectedcolor=="Purple")
        {
            self.view.backgroundColor = UIColor.purpleColor()
        }
        if (selectedcolor=="Orange")
        {
             self.view.backgroundColor = UIColor.orangeColor()
        }
        if (selectedcolor=="Green")
        {
             self.view.backgroundColor = UIColor.greenColor()
        }
        if (selectedcolor=="Gray")
        {
             self.view.backgroundColor = UIColor.grayColor()
        }
       
        return pickerColor[row]
       
    }
    //new method hiding keyboard
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches , withEvent: event)
    }
    //set delegate to all uitextfields
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

