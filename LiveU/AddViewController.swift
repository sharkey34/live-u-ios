//
//  AddViewController.swift
//  LiveU
//
//  Created by Eric Sharkey on 9/10/18.
//  Copyright © 2018 Eric Sharkey. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController {

    
    @IBOutlet var textFieldCollection: [UITextField]!
    
    private var ref: DatabaseReference!
    private var date: Date?
    private var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref  = Database.database().reference()
        
        // setting up datePicker
        let date = Date()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = date
        
        // Setting date maximum
        let calendar = NSCalendar(calendarIdentifier: .gregorian)
        var components = DateComponents()
        components.year = +1
        datePicker.maximumDate = calendar?.date(byAdding: components, to: date, options: NSCalendar.Options(rawValue: 0))
        
        // Adding valueChanged function and the datePicker to the textFields inputView.
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        textFieldCollection[3].inputView = datePicker
        
        // Adding gradiant layer to teh view.
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.colors = [UIColor.white.cgColor, UIColor.lightGray.cgColor]
        gradiantLayer.frame = view.frame
        
        view.layer.insertSublayer(gradiantLayer, at: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   @objc func datePickerValueChanged(_ sender: UIDatePicker) {
    
    date = datePicker.date
    
    print(date!.description)
        
    }
    @IBAction func postButtonPressed(_ sender: UIButton) {
        
        
    }
}
