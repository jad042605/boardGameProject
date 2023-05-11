//
//  ViewController.swift
//  boardGameProject
//
//  Created by Jacob Davis on 3/3/23.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    var player = AVAudioPlayer()
    var player1 = AVAudioPlayer()
    var player2 = AVAudioPlayer()
    var player3 = AVAudioPlayer()
    var player4 = AVAudioPlayer()
    
    
    var cosmetology = [["Cosmetology","How many hours does a stylist need to get their cosmetology license?","1500"],["Cosmetology","True or False - To become a stylist, a person needs a college degree.","False."],["Cosmetology","Can a guy sign up for Cosmetology?","Yes."],["Cosmetology","True or False - A stylist can help a client build their self-esteem by helping the client feel good about themselves.","True."],["Cosmetology","What are the primary colors?","Red, yellow, blue."],["Cosmetology","Why is it important to understand the effect of color?","It impacts make-up, hair color, and nail color recommendations."],["Cosmetology","How often should your shears be sharpened?","Every 6 months or when they become dull."],["Cosmetology","What should healthy skin look like?","It should be moisturized and free from any cracks."],["Cosmetology","Can seniors go out on work placement during school?","Not until they earn their cosmetology license."],["Cosmetology","Do cosmetology students have to wear uniforms?","Yes."],["Cosmetology","Do cosmetology students only learn about beauty?","No, they also learn about anatomy, business, and electrical courses."],["Cosmetology","True or False - Cosmetology students do not have to be CPR certified?","False."],["Cosmetology","Which of the following items do not come in a cos. kit - blow dryer, straightener, clips, cape, brush and comb, and rollers.","Brush and comb."],["Cosmetology","Who are cosmetologists certified by?","The State Cosmetology Board that is in the state they live in."],["Cosmetology","Is all of the student's learning hands-on?","No, part of the lab time is devoted to the related classroom, which means notes and discussions."],["Cosmetology","Do cosmetology students have to be self-paced?","Yes, they must be disciplined enough to complete the work on their own."],["Cosmetology","Can a student have long nails when they are working?","Yes."],["Cosmetology","Does a cosmetologist perform nail services?","Yes, but only manicures."],["Cosmetology","Can a cosmetology student have piercings?","Yes, but not more than two."],["Cosmetology","Are cosmetology students allowed to do their own hair during lab?","Only if they have permission from their lab teacher. "],["Cosmetology","Do you only work on mannequins?","No, juniors are able to work on people at the end of the year; seniors work the entire year on people. "],["Cosmetology","True or False - During a student's senior year, they will learn make-up techniques.","True."],["Cosmetology","Are you allowed to wear any type of shoes with your uniform?","Only black LEATHER shoes are allowed."],["Cosmetology","Does hygiene matter in lab?","Yes, students must be presentable. You get employability points for being a professional."],["Cosmetology","What does a perm do?","It turns the client's hair curly."],["Cosmetology","How many coats of nail polish are applied to a client's nails?","Up to 3 coats."],["Cosmetology","Why is client consultation important?","It helps the stylist know what the client wants."],["Cosmetology","Why is learning about science so important?","To understand the makeup of skin, hair, and nails in order to effectively work on them."],["Cosmetology","What should a stylist do when dealing with an unhappy client?","Stay calm and professional."],["Cosmetology","How can the stylist avoid spreading infection?","Keep stations clean, and disinfect everything."],["Cosmetology","What should the stylist do if the client has an obvious irritation/ aberration on their scalp?","Stop the service and suggest the client sees a physician."],["Cosmetology","You cut your client’s hair too short on one side.","Move back 2 spaces."],["Cosmetology","You accidentally painted your dog’s nails instead of your own nails."," Move back 1 space."],["Cosmetology","You are supposed to perm your client’s hair and over-treat it causing it to fry."," Go back 3 spaces."],["Cosmetology","You mix the wrong colors together and turn your client’s hair purple."," Go back 2 spaces."],["Cosmetology","You are painting your client’s nails when you knock over the bottle of polish; it spills all over your client."," Go back 1 space."],["Cosmetology","You are supposed to open the salon. No one else has a key, and you forget yours at home."," Go back 3 spaces."],["Cosmetology","You are supposed to be creating the up-dos for a wedding; you forget your bobby pins and little rubber bands."," Go back 3 spaces."],["Cosmetology","You are washing your client’s hair and spill shampoo in his eyes."," Go back 1 space."],["Cosmetology","You are shaving the back of your client’s neck. You slip and shave one side too far."," Go back 1 space."],["Cosmetology","You are waxing your client’s eyebrows and accidentally wax too much of one brow."," Go back 1 space."]]
    
    var cardPosition = 0
    
    @IBOutlet weak var scissorName: UITextField!
    
    @IBOutlet weak var polishName: UITextField!
    
    @IBOutlet weak var computerName: UITextField!
    
    @IBOutlet weak var razorName: UITextField!
    
    @IBOutlet weak var cardField: UITextView!
    
    @IBOutlet weak var questionText: UITextView!
    

    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var answerText: UITextView!
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBOutlet weak var diceImage: UIImageView!
    
    @IBOutlet weak var answerOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImage.image = UIImage(named:"hairNormal")
        scissorName.isEnabled = false
        polishName.isEnabled = false
        computerName.isEnabled = false
        razorName.isEnabled = false
        answerOutlet.isHidden = true
        cosmetology.shuffle()
        print(cosmetology.count)
        backgroundSound()
        
    }
    @IBAction func aboutButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Editors", message:  "Jacob Davis ", preferredStyle: UIAlertController.Style.alert)
        
       
        
        let okAction = UIAlertAction(title: "Website", style: .default) {[self]
            (action: UIAlertAction!) in
            openUrl(urlString: "https://www.swcsdcareertech.com/cosmetology.html")
            print("ok")
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Cancel")
        });
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)


    }
    func openUrl(urlString:String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    func animate(){
        diceImage.animationImages = animatedImages(for: "")
        diceImage.animationDuration = 3.0
        diceImage.animationRepeatCount = 1
        diceImage.image = diceImage.animationImages?.randomElement()
        diceImage.startAnimating()
    }
    
    var images = [UIImage]()
    
    func animatedImages(for name: String) ->  [UIImage]{
        images.removeAll()
        for i in 1...6{
            let image = UIImage(named: "\(i)")!
            images.append(image)
          
        }
        return images
    }
    @IBAction func rollDiceBtn(_ sender: UIButton) {
        animate()
        diceRollSound()
    }
   
    
    
    
    
    func playCardSound(songName: String)  {
        //Customize the name "halo", an of type "mp3" for each file
        let path = Bundle.main.path(forResource: songName, ofType: "wav")!
        
        let url = URL (fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("There is issue with the audio")
        }
    }
    func answerClickedSound()  {
        
        let path = Bundle.main.path(forResource: "answerClicked", ofType: "wav")!
        
        let url = URL (fileURLWithPath: path)
        
        do {
            player1 = try AVAudioPlayer(contentsOf: url)
            player1.play()
        } catch {
            print("There is issue with the audio")
        }
    }
    func pieceMovedSound()  {
      
        let path = Bundle.main.path(forResource: "gamepieceMove", ofType: "wav")!
        
        let url = URL (fileURLWithPath: path)
        
        do {
            player2 = try AVAudioPlayer(contentsOf: url)
            player2.play()
        } catch {
            print("There is issue with the audio")
        }
    }
    func backgroundSound()  {
      
        let path = Bundle.main.path(forResource: "backgroundSound", ofType: "wav")!
        
        let url = URL (fileURLWithPath: path)
        
        do {
            player3 = try AVAudioPlayer(contentsOf: url)
            player3.play()
        } catch {
            print("There is issue with the audio")
        }
    }
    func diceRollSound()  {
      
        let path = Bundle.main.path(forResource: "diceRoll", ofType: "wav")!
        
        let url = URL (fileURLWithPath: path)
        
        do {
            player4 = try AVAudioPlayer(contentsOf: url)
            player4.play()
        } catch {
            print("There is issue with the audio")
        }
    }
    
    @IBAction func scissorTapped(_ sender: UITapGestureRecognizer) {
        scissorName.isEnabled = true
    }
    @IBAction func polishTapped(_ sender: UITapGestureRecognizer) {
        polishName.isEnabled = true
    }
    @IBAction func computerTapped(_ sender: UITapGestureRecognizer) {
        computerName.isEnabled = true
    }
    @IBAction func razorTapped(_ sender: UITapGestureRecognizer) {
        razorName.isEnabled = true
    }
    @IBAction func backGroundChange(_ sender: UISwitch) {
        if switchOutlet.isOn == true{
            player3.play()
        } else {
            player3.pause()
        }
    }
    @IBAction func scissorsMove(_ sender: UIPanGestureRecognizer) {
        pieceMovedSound()
        scissorName.isEnabled = false
        let translation = sender.translation(in: self.view)
        if let viewToDrag = sender.view {
            viewToDrag.center = CGPoint(x: viewToDrag.center.x + translation.x, y:viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x:0,y:0), in: viewToDrag)
        }
    }
    
    @IBAction func polishMove(_ sender: UIPanGestureRecognizer) {
        pieceMovedSound()
        polishName.isEnabled = false
        let translation = sender.translation(in: self.view)
        if let viewToDrag = sender.view {
            viewToDrag.center = CGPoint(x: viewToDrag.center.x + translation.x, y:viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x:0,y:0), in: viewToDrag)
        }
    }
    @IBAction func computerMove(_ sender: UIPanGestureRecognizer) {
        pieceMovedSound()
        computerName.isEnabled = false
        let translation = sender.translation(in: self.view)
        if let viewToDrag = sender.view {
            viewToDrag.center = CGPoint(x: viewToDrag.center.x + translation.x, y:viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x:0,y:0), in: viewToDrag)
        }
    }
    @IBAction func razorMove(_ sender: UIPanGestureRecognizer) {
        pieceMovedSound()
        razorName.isEnabled = false
        let translation = sender.translation(in: self.view)
        if let viewToDrag = sender.view {
            viewToDrag.center = CGPoint(x: viewToDrag.center.x + translation.x, y:viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x:0,y:0), in: viewToDrag)
        }
    }
    @IBAction func drawCard(_ sender: UIButton) {
        cardField.text = ("\(cosmetology[cardPosition][0])")
        questionText.text = ("\(cosmetology[cardPosition][1])")
        answerText.text = ("\(cosmetology[cardPosition][2])")
        answerText.isHidden = true
        answerOutlet.isHidden = false
//        playCardSound()
        playCardSound(songName: "flipcard")
        if  cardImage.image == UIImage(named:"hairNormal"){
            cardImage.image = UIImage(named:"hairTurn")
        } else{
            cardImage.image = UIImage(named:"hairNormal")
                
            }
       
        cardPosition += 1
        if cardPosition == 40 {
            cardPosition = 0
        }
       
    }
    @IBAction func answerTapped(_ sender: UIButton) {
        answerText.isHidden = false
        answerOutlet.isHidden = true
        answerClickedSound()
    }
    //    func cardFlip(){
//        let image = UIImage(named: "cardBack")
//        card.setImage(image, for: .normal)
//        UIView.transition(with: card, duration: 2, options: .transitionFlipFromRight, animations: nil, completion: nil)
//    }
    @IBAction func cardMove(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let viewToDrag = sender.view {
            viewToDrag.center = CGPoint(x: viewToDrag.center.x + translation.x, y:viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x:0,y:0), in: viewToDrag)
        }
    }
}


