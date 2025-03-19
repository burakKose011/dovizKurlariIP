//
//  ViewController2.swift
//  DovizKurlari
//
//  Created by macbook on 3.07.2024.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var ABDdolar: UILabel!
    @IBOutlet weak var euro: UILabel!
    @IBOutlet weak var ingilizSterlin: UILabel!
    @IBOutlet weak var isvicreFrang: UILabel!
    @IBOutlet weak var japonYeni: UILabel!
    @IBOutlet weak var SAR: UILabel!
    @IBOutlet weak var norvecKron: UILabel!
    @IBOutlet weak var danimarkaKron: UILabel!
    @IBOutlet weak var avustralyaDolar: UILabel!
    @IBOutlet weak var kanadaDolar: UILabel!
    @IBOutlet weak var isvecKron: UILabel!
    @IBOutlet weak var ruble: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        doviz()
    }
    
    
    func doviz() {
        
        ////////////////////////// URL yi Oluşturup Veriyi Almak ////////////////////
        
        // 1.adım : Request & Session
        // 2.adım : Response & Data
        // 3.adım : Parsing & JSON Serialization
        
        let url = URL(string: "https://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c")   // buraya çekmek istediğimiz url yi yazacaz
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
            
            // bu kısımdan sonra info kısmına girip + ya basıp oradan (App Transport Security Settings) i seçip yanında bitişiğinde ok işaretini aşağı yönlendirip (App Transport Security Settings) bunun yanındaki + işaretinden (Allow Arbitrary Loads) ı seç ve NO olan text kısmına Yes yaz
            
            else {
                if data != nil {
                    
                    do{
                        
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                        // dictionary kullanarak verileri anahtar kelimeye göre çektik
                        
                        //ASYNC
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["result"] as? [String : Any] {
                                print("result")
                        /*
                                if let ABDdolar1 = rates["url deki gram altının anahtar ismi"] as? Double {
                                  
                                }
                                if let euro1 = rates["url deki gram altının anahtar ismi"] as? Double {
                                   
                                }
                                if let ingilizSterlin1 = rates["url deki gram altının anahtar ismi"] as? Double {
                                    
                                }
                                if let isvicreFrang1 = rates["url deki gram altının anahtar ismi"] as? Double {
                                    
                                }
                                if let japonYeni1 = rates["url deki gram altının anahtar ismi"] as? Double {
                                   
                                }
                                if let sar1 = rates["url deki gram altının anahtar ismi"] as? Double {
                                    
                                }
                                if let norvecKron1 = rates["url deki gram altının anahtar ismi"] as? Double {
                                    
                                }
                                if let danimarkaKron1 = rates["url deki gram altının anahtar ismi"] as? Double {
                                    
                                }
                                if let avustralyaDolar1 = rates["url deki gram altının anahtar ismi"] as? Double {
                                 
                                }
                                if let kanadaDolar1 = rates["url deki gram altının anahtar ismi"] as? Double {
                                    
                                }
                                if let isvecKron1 = rates["url deki gram altının anahtar ismi"] as? Double {
                                    
                                }
                                if let ruble1 = rates["url deki gram altının anahtar ismi"] as? Double {
                                    
                                }
                         */
                            }
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }
            task.resume()  // bu kod ile başlatıyoruz bu olmazsa bütün kod boşuna yoksa başlamaz
    }
}
