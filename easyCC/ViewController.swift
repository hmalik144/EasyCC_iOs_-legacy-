//
//  ViewController.swift
//  easyCC
//
//  Created by h_mal on 23/08/2018.
//  Copyright © 2018 h_mal. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{

    @IBOutlet weak var currencyChoiceOne: UITextField!
    @IBOutlet weak var inputOne: UITextField!
    @IBOutlet weak var currencyChoiceTwo: UITextField!
    @IBOutlet weak var inputTwo: UITextField!
    @IBOutlet weak var spinnerOne: UIPickerView!
    @IBOutlet weak var spinnerTwo: UIPickerView!
    
    var rateOne: String = ""
    var rateTwo: String = ""
    
    var exchangeRate: Double = 1
    
    var currencyList = ["AFN - Afghan Afghani","DZD - Algerian Dinar","AOA - Angolan Kwanza","ARS - Argentine Peso","AMD - Armenian Dram","AWG - Aruban Florin","AUD - Australian Dollar","AZN - Azerbaijani Manat","BSD - Bahamian Dollar","BHD - Bahraini Dinar","BDT - Bangladeshi Taka","BBD - Barbadian Dollar","BYR - Belarusian Ruble","BZD - Belize Dollar","BTN - Bhutanese Ngultrum","BTC - Bitcoin","BOB - Bolivian Boliviano","BAM - Bosnia And Herzegovina Konvertibilna Marka","BWP - Botswana Pula","BRL - Brazilian Real","GBP - British Pound","BND - Brunei Dollar","BGN - Bulgarian Lev","BIF - Burundi Franc","KHR - Cambodian Riel","CAD - Canadian Dollar","CVE - Cape Verdean Escudo","KYD - Cayman Islands Dollar","XAF - Central African CFA Franc","XPF - CFP Franc","CLP - Chilean Peso","CNY - Chinese Yuan","COP - Colombian Peso","KMF - Comorian Franc","CDF - Congolese Franc","CRC - Costa Rican Colon","HRK - Croatian Kuna","CUP - Cuban Peso","CZK - Czech Koruna","DKK - Danish Krone","DJF - Djiboutian Franc","DOP - Dominican Peso","XCD - East Caribbean Dollar","EGP - Egyptian Pound","ERN - Eritrean Nakfa","ETB - Ethiopian Birr","EUR - Euro","FKP - Falkland Islands Pound","FJD - Fijian Dollar","GMD - Gambian Dalasi","GEL - Georgian Lari","GHS - Ghanaian Cedi","GIP - Gibraltar Pound","GTQ - Guatemalan Quetzal","GNF - Guinean Franc","GYD - Guyanese Dollar","HTG - Haitian Gourde","HNL - Honduran Lempira","HKD - Hong Kong Dollar","HUF - Hungarian Forint","ISK - Icelandic Kruna","INR - Indian Rupee","IDR - Indonesian Rupiah","IRR - Iranian Rial","IQD - Iraqi Dinar","ILS - Israeli New Sheqel","JMD - Jamaican Dollar","JPY - Japanese Yen","JOD - Jordanian Dinar","KZT - Kazakhstani Tenge","KES - Kenyan Shilling","KWD - Kuwaiti Dinar","KGS - Kyrgyzstani Som","LAK - Lao Kip","LVL - Latvian Lats","LBP - Lebanese Lira","LSL - Lesotho Loti","LRD - Liberian Dollar","LYD - Libyan Dinar","MOP - Macanese Pataca","MKD - Macedonian Denar","MGA - Malagasy Ariary","MWK - Malawian Kwacha","MYR - Malaysian Ringgit","MVR - Maldivian Rufiyaa","MRO - Mauritanian Ouguiya","MUR - Mauritian Rupee","MXN - Mexican Peso","MDL - Moldovan Leu","MNT - Mongolian Tugrik","MAD - Moroccan Dirham","MZN - Mozambican Metical","MMK - Myanma Kyat","NAD - Namibian Dollar","NPR - Nepalese Rupee","ANG - Netherlands Antillean Gulden","TWD - New Taiwan Dollar","NZD - New Zealand Dollar","NIO - Nicaraguan Cordoba","NGN - Nigerian Naira","KPW - North Korean Won","NOK - Norwegian Krone","OMR - Omani Rial","TOP - Paanga","PKR - Pakistani Rupee","PAB - Panamanian Balboa","PGK - Papua New Guinean Kina","PYG - Paraguayan Guarani","PEN - Peruvian Nuevo Sol","PHP - Philippine Peso","PLN - Polish Zloty","QAR - Qatari Riyal","RON - Romanian Leu","RUB - Russian Ruble","RWF - Rwandan Franc","SHP - Saint Helena Pound","WST - Samoan Tala","STD - Sao Tome And Principe Dobra","SAR - Saudi Riyal","RSD - Serbian Dinar","SCR - Seychellois Rupee","SLL - Sierra Leonean Leone","SGD - Singapore Dollar","SBD - Solomon Islands Dollar","SOS - Somali Shilling","ZAR - South African Rand","KRW - South Korean Won","XDR - Special Drawing Rights","LKR - Sri Lankan Rupee","SDG - Sudanese Pound","SRD - Surinamese Dollar","SZL - Swazi Lilangeni","SEK - Swedish Krona","CHF - Swiss Franc","SYP - Syrian Pound","TJS - Tajikistani Somoni","TZS - Tanzanian Shilling","THB - Thai Baht","TTD - Trinidad and Tobago Dollar","TND - Tunisian Dinar","TRY - Turkish New Lira","TMT - Turkmenistan Manat","AED - UAE Dirham","UGX - Ugandan Shilling","UAH - Ukrainian Hryvnia","USD - United States Dollar","UYU - Uruguayan Peso","UZS - Uzbekistani Som","VUV - Vanuatu Vatu","VEF - Venezuelan Bolivar","VND - Vietnamese Dong","XOF - West African CFA Franc","YER - Yemeni Rial","ZMW - Zambian Kwacha"]

    
    var converstionRate:Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currencyChoiceOne.text = self.currencyList[1]
        self.currencyChoiceTwo.text = self.currencyList[1]
        
        self.spinnerOne.isHidden = true
        self.spinnerTwo.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldChangeListener(_ sender: Any) {
        let valueOne = Double(inputOne.text!)
        let valueTwo = (valueOne ?? 1)*exchangeRate
        self.inputTwo.text = String(describing: valueTwo)
    }
    
    @IBAction func textChangeListenerTwo(_ sender: Any) {
        let valueOne = Double(inputTwo.text!)
        let valueTwo = (valueOne ?? 1)*exchangeRate
        self.inputOne.text = String(valueTwo)
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return currencyList.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return currencyList[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (pickerView.tag == 1){
            self.currencyChoiceOne.text = self.currencyList[row]
            downloadData()
            self.spinnerOne.isHidden = true
        }else if(pickerView.tag == 2){
            self.currencyChoiceTwo.text = self.currencyList[row]
            downloadData()
            self.spinnerTwo.isHidden = true
        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.currencyChoiceOne {
            self.spinnerOne.isHidden = false
            //if you dont want the users to se the keyboard type:
            
            textField.endEditing(true)
        }else if textField == self.currencyChoiceTwo{
            self.spinnerTwo.isHidden = false
            
            textField.endEditing(true)
        }
        
    }
    
    func downloadData() {
        Alamofire.request(urlBuilder()).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String,Double> {
                self.exchangeRate = json["\(self.rateOne)_\(self.rateTwo)"]!
            }
        }
    }
    
    func urlBuilder() -> String{
        
        var url = "https://free.currencyconverterapi.com/api/v6/convert?q="
        
        rateOne = String(currencyChoiceOne.text!.characters.prefix(3))
        rateTwo = String(currencyChoiceTwo.text!.characters.prefix(3))
        
        url = url + rateOne + "_" + rateTwo + "&compact=ultra"
        
        print(url)
        
        return url
    }

}

