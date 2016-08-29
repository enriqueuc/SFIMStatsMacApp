//
//  ViewController.swift
//  SFIMStats
//
//  Created by Enrique Ugalde on 25/08/16.
//  Copyright © 2016 Enrique Ugalde. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var lbl_inicio: NSTextField!
    @IBOutlet weak var lbl_paquetes: NSTextField!
    @IBOutlet weak var lbl_servicios: NSTextField!
    @IBOutlet weak var lbl_galeria: NSTextField!
    @IBOutlet weak var lbl_mapa: NSTextField!
    @IBOutlet weak var lbl_contacto: NSTextField!
    @IBOutlet weak var lbl_correos: NSTextField!
    @IBOutlet weak var lbl_actualizado: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        lbl_inicio.stringValue = ""
        lbl_paquetes.stringValue = ""
        lbl_servicios.stringValue = ""
        lbl_galeria.stringValue = ""
        lbl_mapa.stringValue = ""
        lbl_contacto.stringValue = ""
        lbl_correos.stringValue = ""
        obtenerParams()
    }
    
    func obtenerParams() {
        NSTimer.scheduledTimerWithTimeInterval(60*10, target: self, selector: #selector(ViewController.obtenerParams) , userInfo: nil, repeats: true)
        let todaysDate:NSDate = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM/yyyy "
        let DateInFormat:String = dateFormatter.stringFromDate(todaysDate)
        lbl_actualizado.stringValue = String(DateInFormat)
        
        if let url = NSURL(string: "") {
            let datos : NSData = NSData(contentsOfURL: url)!
            do {
                let contents = try NSJSONSerialization.JSONObjectWithData(datos, options: NSJSONReadingOptions.MutableLeaves)
                let dico1 = contents as! NSDictionary
                let dico2Stats = dico1["stats"]! as! NSArray
                let el0Dico2 = dico2Stats[0] as! NSDictionary
                lbl_inicio.stringValue = el0Dico2["inicio"] as! NSString as String
                lbl_paquetes.stringValue = el0Dico2["paquetes"] as! NSString as String
                lbl_servicios.stringValue = el0Dico2["servicios"] as! NSString as String
                lbl_galeria.stringValue = el0Dico2["galeria"] as! NSString as String
                lbl_mapa.stringValue = el0Dico2["mapa"] as! NSString as String
                lbl_contacto.stringValue = el0Dico2["contacto"] as! NSString as String
                lbl_correos.stringValue = el0Dico2["correos"] as! NSString as String
                print(contents)
            } catch {
                // contents could not be loaded
            }
        } else {
            print("Bad URL!")
        }
    }
    
    @IBAction func btn_actualizar(sender: AnyObject) {
        obtenerParams()
    }
    
    @IBAction func btn_copiar(sender: AnyObject) {
        let stringToCopy = "Inicio: \(lbl_inicio.stringValue), Paquetes: \(lbl_paquetes.stringValue), Servicios \(lbl_servicios.stringValue), Galería: \(lbl_galeria.stringValue), Mapa: \(lbl_mapa.stringValue), Contacto: \(lbl_contacto.stringValue), Correos: \(lbl_correos.stringValue)."
        let pasteboard = NSPasteboard.generalPasteboard()
        pasteboard.clearContents()
        pasteboard.setString(stringToCopy, forType: NSPasteboardTypeString)
    }

}

