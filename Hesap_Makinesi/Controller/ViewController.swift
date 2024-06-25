//
//  ViewController.swift
//  Hesap_Makinesi
//
//  Created by Ömer Yılmaz on 10.06.2024.
//

import UIKit

// Ana görünüm denetleyici sınıfı
class ViewController: UIViewController {

    // Ekranda gösterilen değeri tutan etiket
    @IBOutlet weak var displayLabel: UILabel!
    
    // Kullanıcının sayıyı yazmayı bitirip bitirmediğini belirten değişken
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            // Ekran etiketindeki metni Double türüne dönüştürmeye çalışır
            guard let number = Double(displayLabel.text!) else {
                fatalError("Ekran etiketi metni Double'a dönüştürülemiyor!!!")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    // Hesap makinesi işlemleri için düğme basıldığında çalışacak fonksiyon
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // Kullanıcının sayıyı yazmayı bitirdiğini belirtir
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcmethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcmethod) {
                displayValue = result
            }
        }
    }

    // Sayı düğmesine basıldığında çalışacak fonksiyon
    @IBAction func numButtonPressed(_ sender: UIButton) {
        // Basılan düğmenin başlığını alır
        if let numValue = sender.currentTitle {
            // Eğer kullanıcı yeni bir sayı yazmaya başladıysa
            if isFinishedTypingNumber {
                // Ekrandaki metni yeni sayı ile değiştirir
                displayLabel.text = numValue
                // Yazma işleminin devam ettiğini belirtir
                isFinishedTypingNumber = false
            } else {
                // Basılan düğme "." ise ve mevcut metin geçerli bir sayı ise
                if numValue == "." {
                    // Mevcut değerin tam sayı olup olmadığını kontrol eder
                    let isInt = floor(displayValue) == displayValue
                    // Eğer değer zaten ondalıklı ise başka bir "." eklemez
                    if !isInt {
                        return
                    }
                }
                // Ekrandaki metne yeni karakteri ekler
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
