//
//  ViewController.swift
//  DovizConverterApp
//
//  Created by Muhammed Selimhan gülsever on 19.01.2022.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var analbl: UILabel!
    @IBOutlet weak var textf1: UITextField!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var textf2: UITextField!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var textf3: UITextField!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var textf4: UITextField!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var textf5: UITextField!
    @IBOutlet weak var lbl5: UILabel!
    
    var pickerview1 = UIPickerView()
    var pickerview2 = UIPickerView()
    var pickerview3 = UIPickerView()
    var pickerview4 = UIPickerView()
    var pickerview5 = UIPickerView()
    
    
    private var dovizteklialma : DovizListViewModel!
    
    
    var isimalma = [String : Double] ()
    var isimler = [String] ()
    var kurlar = [Double] ()
    
    let urlll = URL(string: "http://data.fixer.io/api/latest?access_key=5fead88e169de9fed8d1374c87323243&format=1")!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        textf1.inputView = pickerview1
        textf2.inputView = pickerview2
        textf3.inputView = pickerview3
        textf4.inputView = pickerview4
        textf5.inputView = pickerview5
        
        
        pickerview1.delegate = self
        pickerview1.dataSource = self
        pickerview2.delegate = self
        pickerview2.dataSource = self
        pickerview3.delegate = self
        pickerview3.dataSource = self
        pickerview4.delegate = self
        pickerview4.dataSource = self
        pickerview5.delegate = self
        pickerview5.dataSource = self
        
        pickerview1.tag = 1
        pickerview2.tag = 2
        pickerview3.tag = 3
        pickerview4.tag = 4
        pickerview5.tag = 5
         
        getdata()
        
        
        
    }
    func getdata() {
        Webservice().downloadcurrencies(url: urlll) { (dovizs) in
            if let dovizs = dovizs {
                self.dovizteklialma = DovizListViewModel(dovizlistetutucu: dovizs )
                self.isimalma = self.dovizteklialma.rates
                self.isimler = [String](self.isimalma.keys)
                self.kurlar = [Double](self.isimalma.values)
                
            }
            
        }
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
         
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.dovizteklialma == nil ? 0 : self.isimler.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let deneme = self.isimler[row]
        
        
        return deneme
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        case 1: textf1.text = isimler[row]
            lbl1.text = String(kurlar[row])
            self.view.endEditing(true)
        case 2: textf2.text = isimler[row]
            lbl2.text = String(kurlar[row])
            self.view.endEditing(true)
        case 3: textf3.text = isimler[row]
            lbl3.text = String(kurlar[row])
            self.view.endEditing(true)
        case 4: textf4.text = isimler[row]
            lbl4.text = String(kurlar[row])
            self.view.endEditing(true)
        case 5: textf5.text = isimler[row]
            lbl5.text = String(kurlar[row])
            self.view.endEditing(true)
        default : return
            
        }
       
    }
}
