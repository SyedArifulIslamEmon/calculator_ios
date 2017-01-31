//
//  ViewController.swift
//  calculatorDevice
//
//  Created by Sierra 4 on 30/01/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number_on_screen:Double = 0
    var previous_number:Double = 0
    var performing_math = false
    var operation = 0
    var memory:Double = 0.0
    
    @IBOutlet weak var label: UILabel!
  
    
    @IBOutlet weak var result_view: UIView!
    
    
    
    @IBOutlet weak var btn_mc: UIButton!
    
    @IBOutlet weak var btn_mr: UIButton!
    
    @IBOutlet weak var btn_mplus: UIButton!
    
    @IBOutlet weak var btn_mminus: UIButton!
    
    @IBOutlet weak var btn_root: UIButton!
    
    @IBOutlet weak var btn_7: UIButton!
    
    @IBOutlet weak var btn_8: UIButton!
    
    
    @IBOutlet weak var btn_9: UIButton!
    
    @IBOutlet weak var btn_divide: UIButton!
    
    @IBOutlet weak var btn_percentage: UIButton!
    
    
    @IBOutlet weak var btn_4: UIButton!
    
    @IBOutlet weak var btn_5: UIButton!
    
    @IBOutlet weak var btn_6: UIButton!
    
    
    @IBOutlet weak var btn_product: UIButton!
    
    @IBOutlet weak var btn_1_by_x: UIButton!
    
    
    @IBOutlet weak var btn_1: UIButton!
    
    @IBOutlet weak var btn_2: UIButton!
    
    
    @IBOutlet weak var btn_3: UIButton!
    
    
    @IBOutlet weak var btn_subtract: UIButton!
    
    
    @IBOutlet weak var btn_equals: UIButton!
    
    @IBOutlet weak var btn_0: UIButton!
    
   
    
    @IBOutlet weak var btn_dot: UIButton!
    

    @IBOutlet weak var btn_add_subtact: UIButton!
    
    @IBOutlet weak var btn_add: UIButton!
    
    
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performing_math == true{
        
            label.text = String(sender.tag-1)
            number_on_screen = Double(label.text!)!
            performing_math = false
        }
        else{
        
            label.text = label.text! + String(sender.tag-1)
            number_on_screen = Double(label.text!)!
        
        }
        
    }
    
    
    
    
    @IBAction func dot_number(_ sender: UIButton) {
        if label.text!.contains("."){
            return
        }
        
        let value2 = label.text
        let value1 = "."
        label.text = value2! + value1
    }
    
    
    
    @IBAction func operations(_ sender: UIButton) {
        if label.text != "" && sender.tag != 12 && sender.tag != 22 {
        
        previous_number = Double(label.text!)!
            if sender.tag == 11 {
                
                label.text = "."
                
            }
            if sender.tag == 16 {
            
                label.text = "_/"
            
            }
            else if sender.tag == 17 {
                
                label.text = "/"
                
            }

            else if sender.tag == 18 {
                
                label.text = "%"
                
            }

            else if sender.tag == 19 {
                
                label.text = "*"
                
            }

            else if sender.tag == 20 {
                
                label.text = "1/"
                
            }

            else if sender.tag == 21 {
                
                label.text = "-"
                
            }

            
            else if sender.tag == 24 {
                
                label.text = "+"
                
            }

            operation = sender.tag
            performing_math = true
        }
            
        
        else if sender.tag == 13 {
            
            label.text = String( memory )
            
        }
            
            
            
        else if sender.tag == 14 {
            
            memory = memory + number_on_screen
            
            label.text = String( memory )
            
            if operation == 15 {
                
                memory = memory - number_on_screen
                
                label.text = String( memory )
                
            }
            else if operation == 14 {
                
                label.text = String( memory )
                
            }
            
        }
        else if sender.tag == 15 {
            
            memory = memory - number_on_screen
            
            label.text = String( memory )
            
            if operation == 14 {
                
                memory = memory + number_on_screen
                
                label.text = String( memory )
                
            }
            else if operation == 13 {
                
                label.text = String( memory )
                
            }

        }

        else if sender.tag == 22{
            
           
        
            
            if operation == 16 {
                
                label.text = String( pow(number_on_screen, (1 / previous_number)))
                
            }
            else if operation == 17 {
                
                label.text = String(previous_number / number_on_screen)
            }
            
            else if operation == 18 {
                
                label.text = String((number_on_screen / 100))
                
            }
            
            else if operation == 19 {
                
                label.text = String(previous_number * number_on_screen)
                
            }
            
            else if operation == 20 {
                
                label.text = String(1 / number_on_screen)
            }
            
            else if operation == 21 {
                
                label.text = String(previous_number - number_on_screen)
                
            }
            
            else if operation == 23 {
                
                label.text = String(-( previous_number))
            }

            
            else if operation == 24 {
                
                label.text = String(previous_number + number_on_screen)
                
            }

        }
        
        
        else if sender.tag == 12{
        
            label.text = ""
            previous_number = 0
            number_on_screen = 0
            operation = 0
            memory = 0
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.result_view.layer.cornerRadius=8
        self.result_view.layer.masksToBounds=true
        self.result_view.layer.borderColor=UIColor.gray.cgColor
        self.result_view.layer.borderWidth=3
            
        self.btn_mc.layer.cornerRadius=8
        self.btn_mc.layer.masksToBounds=true
        self.btn_mc.layer.borderColor=UIColor.yellow.cgColor
        self.btn_mc.layer.borderWidth=1
        
        self.btn_mr.layer.cornerRadius=8
        self.btn_mr.layer.masksToBounds=true
        self.btn_mr.layer.borderColor=UIColor.yellow.cgColor
        self.btn_mr.layer.borderWidth=1

        self.btn_mplus.layer.cornerRadius=8
        self.btn_mplus.layer.masksToBounds=true
        self.btn_mplus.layer.borderColor=UIColor.yellow.cgColor
        self.btn_mplus.layer.borderWidth=1
        
        self.btn_mminus.layer.cornerRadius=8
        self.btn_mminus.layer.masksToBounds=true
        self.btn_mminus.layer.borderColor=UIColor.yellow.cgColor
        self.btn_mminus.layer.borderWidth=1

        self.btn_root.layer.cornerRadius=8
        self.btn_root.layer.masksToBounds=true
        self.btn_root.layer.borderColor=UIColor.green.cgColor
        self.btn_root.layer.borderWidth=1

        self.btn_7.layer.cornerRadius=8
        self.btn_7.layer.masksToBounds=true
        self.btn_7.layer.borderColor=UIColor.blue.cgColor
        self.btn_7.layer.borderWidth=1

        self.btn_8.layer.cornerRadius=8
        self.btn_8.layer.masksToBounds=true
        self.btn_8.layer.borderColor=UIColor.blue.cgColor
        self.btn_8.layer.borderWidth=1

        self.btn_9.layer.cornerRadius=8
        self.btn_9.layer.masksToBounds=true
        self.btn_9.layer.borderColor=UIColor.blue.cgColor
        self.btn_9.layer.borderWidth=1

        self.btn_divide.layer.cornerRadius=8
        self.btn_divide.layer.masksToBounds=true
        self.btn_divide.layer.borderColor=UIColor.green.cgColor
        self.btn_divide.layer.borderWidth=1

        self.btn_percentage.layer.cornerRadius=8
        self.btn_percentage.layer.masksToBounds=true
        self.btn_percentage.layer.borderColor=UIColor.green.cgColor
        self.btn_percentage.layer.borderWidth=1


        self.btn_4.layer.cornerRadius=8
        self.btn_4.layer.masksToBounds=true
        self.btn_4.layer.borderColor=UIColor.blue.cgColor
        self.btn_4.layer.borderWidth=1


        self.btn_5.layer.cornerRadius=8
        self.btn_5.layer.masksToBounds=true
        self.btn_5.layer.borderColor=UIColor.blue.cgColor
        self.btn_5.layer.borderWidth=1

        self.btn_6.layer.cornerRadius=8
        self.btn_6.layer.masksToBounds=true
        self.btn_6.layer.borderColor=UIColor.blue.cgColor
        self.btn_6.layer.borderWidth=1

        self.btn_product.layer.cornerRadius=8
        self.btn_product.layer.masksToBounds=true
        self.btn_product.layer.borderColor=UIColor.green.cgColor
        self.btn_product.layer.borderWidth=1

        self.btn_1_by_x.layer.cornerRadius=8
        self.btn_1_by_x.layer.masksToBounds=true
        self.btn_1_by_x.layer.borderColor=UIColor.green.cgColor
        self.btn_1_by_x.layer.borderWidth=1

        self.btn_1.layer.cornerRadius=8
        self.btn_1.layer.masksToBounds=true
        self.btn_1.layer.borderColor=UIColor.blue.cgColor
        self.btn_1.layer.borderWidth=1

        self.btn_2.layer.cornerRadius=8
        self.btn_2.layer.masksToBounds=true
        self.btn_2.layer.borderColor=UIColor.blue.cgColor
        self.btn_2.layer.borderWidth=1

        self.btn_3.layer.cornerRadius=8
        self.btn_3.layer.masksToBounds=true
        self.btn_3.layer.borderColor=UIColor.blue.cgColor
        self.btn_3.layer.borderWidth=1

        self.btn_subtract.layer.cornerRadius=8
        self.btn_subtract.layer.masksToBounds=true
        self.btn_subtract.layer.borderColor=UIColor.green.cgColor
        self.btn_subtract.layer.borderWidth=1
        
        self.btn_equals.layer.cornerRadius=8
        self.btn_equals.layer.masksToBounds=true
        self.btn_equals.layer.borderColor=UIColor.green.cgColor
        self.btn_equals.layer.borderWidth=1
        
        self.btn_0.layer.cornerRadius=8
        self.btn_0.layer.masksToBounds=true
        self.btn_0.layer.borderColor=UIColor.blue.cgColor
        self.btn_0.layer.borderWidth=1
        
        self.btn_dot.layer.cornerRadius=8
        self.btn_dot.layer.masksToBounds=true
        self.btn_dot.layer.borderColor=UIColor.blue.cgColor
        self.btn_dot.layer.borderWidth=1
        
        self.btn_add_subtact.layer.cornerRadius=8
        self.btn_add_subtact.layer.masksToBounds=true
        self.btn_add_subtact.layer.borderColor=UIColor.green.cgColor
        self.btn_add_subtact.layer.borderWidth=1
        
        self.btn_add.layer.cornerRadius=8
        self.btn_add.layer.masksToBounds=true
        self.btn_add.layer.borderColor=UIColor.green.cgColor
        self.btn_add.layer.borderWidth=1

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }


}

