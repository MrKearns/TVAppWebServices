//
//  ViewController.swift
//  TVAppWebServices
//
//  Created by Jonathan Kearns on 2/27/23.
//

import UIKit
import PodcastAPI


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    // labels
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    
    
    //Images
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
   
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    var searchTerm = ""
    
    
    
// -------------- VIEW DID LOAD --------------
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.returnKeyType = .done
        searchBar.autocapitalizationType = .words
        searchBar.autocorrectionType = .yes
        searchTerm = searchBar.text ?? ""
        
       
        //aip key and client
        
        let apiKey = "7a72b08f9b114b2d9b611bb024719a9c"
        let client = PodcastAPI.Client(apiKey: apiKey, synchronousRequest: true)
       
        
        // search parameters
        
        var parameters: [String: String] = [:]
        parameters["q"] = "Comedy"
        parameters["sort_by_date"] = "0"
        parameters["type"] = "podcast"
        
        
        // ---- On Open will fetch 10 popular podcasts ----
        
        client.fetchBestPodcasts(parameters: parameters) { response in
            if let error = response.error {
                switch (error) {
                    
                case PodcastApiError.apiConnectionError:
                    print("Can't connect to Listen API server")
                case PodcastApiError.authenticationError:
                    print("wrong api key")
                default:
                    print("unknown error")
                }
            } else {
                
                // It's a SwiftyJSON object
                if let json = response.toJson() {
                    
                    for (index, _)in json["podcasts"].enumerated(){
//                        print(index)
//                        print("Title: \(json["podcasts"][index]["title"])")
//                        print("Image: \(json["podcasts"][index]["image"])")
                        
                    }
                    
                    // update labels and images
                    DispatchQueue.main.async {
                        self.displayLabel.text = "\(json["podcasts"][0]["title"])"
            
                        let urlTheFirst = URL(string: "\(json["podcasts"][0]["image"])")
                        let data = try? Data(contentsOf: urlTheFirst!)
                        if let imageData = data{
                            self.image.image = UIImage(data: imageData)
                        }
                        
                        self.label1.text = "\(json["podcasts"][1]["title"])"
                        let url1 = URL(string: "\(json["podcasts"][1]["image"])")
                        let data1 = try? Data(contentsOf: url1!)
                        if let imageData = data1{
                            self.image1.image = UIImage(data: imageData)
                        }
                        
                        self.label2.text = "\(json["podcasts"][2]["title"])"
                        let url2 = URL(string: "\(json["podcasts"][2]["image"])")
                        let data2 = try? Data(contentsOf: url2!)
                        if let imageData = data2{
                            self.image2.image = UIImage(data: imageData)
                        }
                        
                        self.label3.text = "\(json["podcasts"][3]["title"])"
                        let url3 = URL(string: "\(json["podcasts"][3]["image"])")
                        let data3 = try? Data(contentsOf: url3!)
                        if let imageData = data3{
                            self.image3.image = UIImage(data: imageData)
                        }
                        self.label4.text = "\(json["podcasts"][4]["title"])"
                        let url4 = URL(string: "\(json["podcasts"][4]["image"])")
                        let data4 = try? Data(contentsOf: url4!)
                        if let imageData = data4{
                            self.image4.image = UIImage(data: imageData)
                        }
                        
                        self.label5.text = "\(json["podcasts"][5]["title"])"
                        let url5 = URL(string: "\(json["podcasts"][5]["image"])")
                        let data5 = try? Data(contentsOf: url5!)
                        if let imageData = data5{
                            self.image5.image = UIImage(data: imageData)
                        }
                        
                        self.label6.text = "\(json["podcasts"][6]["title"])"
                        let url6 = URL(string: "\(json["podcasts"][6]["image"])")
                        if url6 == nil{
                            self.image6.image = UIImage(systemName: "play.rectangle")
                        } else{
                            let data6 = try? Data(contentsOf: url6!)
                            if let imageData = data6{
                                self.image6.image = UIImage(data: imageData)
                            }
                        }
        
                        self.label7.text = "\(json["podcasts"][7]["title"])"
                        let url7 = URL(string: "\(json["podcasts"][7]["image"])")
                        if url7 == nil{
                            self.image7.image = UIImage(systemName: "play.rectangle")
                        } else{
                            let data7 = try? Data(contentsOf: url6!)
                            if let imageData = data7{
                                self.image7.image = UIImage(data: imageData)
                            }
                        }
                        
                        self.label8.text = "\(json["podcasts"][8]["title"])"
                        let url8 = URL(string: "\(json["podcasts"][8]["image"])")
                        let data8 = try? Data(contentsOf: url8!)
                        if let imageData = data8{
                            self.image8.image = UIImage(data: imageData)
                        }
                        
                        self.label9.text = "\(json["podcasts"][9]["title"])"
                        let url9 = URL(string: "\(json["podcasts"][9]["image"])")
                        let data9 = try? Data(contentsOf: url9!)
                        if let imageData = data9{
                            self.image9.image = UIImage(data: imageData)
                        }
                    }
                }
            }
        }
    }
    
    
    // --------- SEARCH BUTTON TAPPED FUNC ---------
    @IBAction func searchTapped(){
        
        let apiKey = "7a72b08f9b114b2d9b611bb024719a9c"
        let client = PodcastAPI.Client(apiKey: apiKey, synchronousRequest: true)
        
        var parameters: [String: String] = [:]
        
        parameters["q"] = searchBar.text
        parameters["sort_by_date"] = "0"
        parameters["type"] = "podcast"
        
        client.search(parameters: parameters) { response in
            if let error = response.error {
                switch (error) {
                    
                case PodcastApiError.apiConnectionError:
                    print("Can't connect to Listen API server")
                case PodcastApiError.authenticationError:
                    print("wrong api key")
                default:
                    print("unknown error")
                }
            } else {
                // It's a SwiftyJSON object
                if let json = response.toJson() {
                    
                    for (index, _)in json["results"].enumerated(){
//                        print(index)
//                        print("Title: \(json["results"][index]["title_original"])")
//                        print("Image: \(json["results"][index]["image"])")
                        
                    }
                    
                    DispatchQueue.main.async {
                        self.displayLabel.text = "\(json["results"][0]["title_original"])"
            
                        let urlTheFirst = URL(string: "\(json["results"][0]["image"])")
                        if urlTheFirst == nil{
                            self.image.image = UIImage(systemName: "play.rectangle")
                        } else{
                            let data = try? Data(contentsOf: urlTheFirst!)
                            if let imageData = data{
                                self.image.image = UIImage(data: imageData)
                            }
                        }
                        
                        self.label1.text = "\(json["results"][1]["title_original"])"
                        let url1 = URL(string: "\(json["results"][1]["image"])")
                        if url1 == nil{
                            self.image1.image = UIImage(systemName: "play.rectangle")
                        } else{
                            let data1 = try? Data(contentsOf: url1!)
                            if let imageData = data1{
                                self.image1.image = UIImage(data: imageData)
                            }
                        }
                        
                        self.label2.text = "\(json["results"][2]["title_original"])"
                        let url2 = URL(string: "\(json["results"][2]["image"])")
                        if url2 == nil{
                            self.image2.image = UIImage(systemName: "play.rectangle")
                        } else{
                            let data2 = try? Data(contentsOf: url2!)
                            if let imageData = data2{
                                self.image2.image = UIImage(data: imageData)
                            }
                        }
                        
                        self.label3.text = "\(json["results"][3]["title_original"])"
                        let url3 = URL(string: "\(json["results"][3]["image"])")
                        if url3 == nil{
                            self.image3.image = UIImage(systemName: "play.rectangle")
                        } else{
                            let data3 = try? Data(contentsOf: url3!)
                            if let imageData = data3{
                                self.image3.image = UIImage(data: imageData)
                            }
                        }
                        
                        self.label4.text = "\(json["results"][4]["title_original"])"
                        let url4 = URL(string: "\(json["results"][4]["image"])")
                        if url4 == nil{
                            self.image4.image = UIImage(systemName: "play.rectangle")
                        } else{
                            let data4 = try? Data(contentsOf: url4!)
                            if let imageData = data4{
                                self.image4.image = UIImage(data: imageData)
                            }
                        }
                        
                        self.label5.text = "\(json["results"][5]["title_original"])"
                        let url5 = URL(string: "\(json["results"][5]["image"])")
                        if url5 == nil{
                            self.image5.image = UIImage(systemName: "play.rectangle")
                        } else{
                            let data5 = try? Data(contentsOf: url5!)
                            if let imageData = data5{
                                self.image5.image = UIImage(data: imageData)
                            }
                        }
                        
                        self.label6.text = "\(json["results"][6]["title_original"])"
                        let url6 = URL(string: "\(json["results"][6]["image"])")
                        if url6 == nil{
                            self.image6.image = UIImage(systemName: "play.rectangle")
                        } else{
                            let data6 = try? Data(contentsOf: url6!)
                            if let imageData = data6{
                                self.image6.image = UIImage(data: imageData)
                            }
                        }
        
                        self.label7.text = "\(json["results"][7]["title_original"])"
                        let url7 = URL(string: "\(json["results"][7]["image"])")
                        if url7 == nil{
                            self.image7.image = UIImage(systemName: "play.rectangle")
                        } else{
                            let data7 = try? Data(contentsOf: url7!)
                            if let imageData = data7{
                                self.image7.image = UIImage(data: imageData)
                            }
                        }
                        
                        self.label8.text = "\(json["results"][8]["title_original"])"
                        let url8 = URL(string: "\(json["results"][8]["image"])")
                        if url8 == nil{
                            self.image8.image = UIImage(systemName: "play.rectangle")
                        } else{
                            let data8 = try? Data(contentsOf: url8!)
                            if let imageData = data8{
                                self.image8.image = UIImage(data: imageData)
                            }
                        }
                        
                        self.label9.text = "\(json["results"][9]["title_original"])"
                        let url9 = URL(string: "\(json["results"][9]["image"])")
                        if url9 == nil{
                            self.image9.image = UIImage(systemName: "play.rectangle")
                        } else{
                            let data9 = try? Data(contentsOf: url9!)
                            if let imageData = data9{
                                self.image9.image = UIImage(data: imageData)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
// ---------- TEXT FIELD RETURN FUNC ----------
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        let text = searchBar.text
//        print("---------- \(text) ----------")
//
//        return true
//    }
        
}
        




