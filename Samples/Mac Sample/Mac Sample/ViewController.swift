//
//  ViewController.swift
//  Mac Sample
//
//  Created by Hal Mueller on 1/22/17.
//  Copyright © 2017 Hal Mueller. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, CTCManagerDelegate, CTCSerialDeviceDelegate {

	@IBOutlet weak var scanStopButton: NSButton!
	@IBOutlet weak var connectDisconnectButton: NSButton!
	@IBOutlet var devicesArrayController: NSArrayController!
	@IBOutlet var deviceOutput: NSTextView!
	@IBOutlet weak var deviceCommunicationsBox: NSBox!
	// see http://www.rockhoppertech.com/blog/swift-nstableview-and-nsarraycontroller/ for Bindings notes

	var manager = CTCManager()

	dynamic var knownDevices: [CTCSerialDevice] = []
	var isScanning: Bool = false
	var chosenDevice: CTCSerialDevice? = nil {
		didSet {
			if chosenDevice == nil {
				connectDisconnectButton.title = "Connect"
			}
			else {
				connectDisconnectButton.title = "Disconnect"
			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		manager.delegate = self
		self.knownDevices = []
		print(self.knownDevices)
		// Do any additional setup after loading the view.
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	@IBAction func startStopScanning(_ sender: Any) {
		print(#function)
		isScanning = !isScanning
		if isScanning {
			scanStopButton.title = "Stop Scanning"
			self.manager.startScanning()
		}
		else {
			scanStopButton.title = "Scan for TruConnects"
			self.manager.stopScanning()
		}
	}

	func connect(_ devices: Array<CTCSerialDevice>) {
		print(devices)
		if chosenDevice == nil {
			chosenDevice = devices.first
			if let device = chosenDevice {
				manager.connect(device: device)
			}
		}
		else {
			manager.disconnect(device: chosenDevice!)
			chosenDevice = nil
			connectDisconnectButton.title = "Connect"
		}
	}

	@IBAction func sendHello(_ sender: Any) {
		if let dest = chosenDevice {
			dest.send(string:"Hello world!")
		}
		else {
			NSBeep()
		}
	}

	@IBAction func sendGoodbye(_ sender: Any) {
		if let dest = chosenDevice {
			dest.send(string:"Hasta la vista, baby!")
		}
		else {
			NSBeep()
		}
	}
	
	@IBAction func setBaudRate(_ sender: NSPopUpButton) {
		if let dest = chosenDevice {
			print(dest, #function, sender.selectedItem?.title ?? "")
		}
		else {
			NSBeep()
		}
	}

	@IBAction func setDataSize(_ sender: NSPopUpButton) {
		if let dest = chosenDevice {
			print(dest, #function, sender.selectedItem?.title ?? "")
		}
		else {
			NSBeep()
		}
	}

	@IBAction func setParity(_ sender: NSPopUpButton) {
		if let dest = chosenDevice {
			print(dest, #function, sender.selectedItem?.title ?? "")
		}
		else {
			NSBeep()
		}
	}

	@IBAction func setStopBits(_ sender: NSPopUpButton) {
		if let dest = chosenDevice {
			print(dest, #function, sender.selectedItem?.title ?? "")
		}
		else {
			NSBeep()
		}
	}

	// MARK: - CTCSerialDeviceDelegate
	func device(_ device: CTCSerialDevice, didReceiveString string: String) {
		print(#function, string)
	}

	// MARK: - CTCManagerDelegate
	func manager(_ manager: CTCManager, didDiscoverDevice device: CTCSerialDevice) {
		print(#function, device)
		knownDevices.append(device)
	}

	@IBAction func quotePoe(_ sender: Any) {
		let theRaven = "Once upon a midnight dreary, while I pondered, weak and weary, Over many a quaint and curious volume of forgotten lore— While I nodded, nearly napping, suddenly there came a tapping, As of some one gently rapping, rapping at my chamber door. “’Tis some visitor,” I muttered, “tapping at my chamber door— Only this and nothing more.” Ah, distinctly I remember it was in the bleak December; And each separate dying ember wrought its ghost upon the floor. Eagerly I wished the morrow;—vainly I had sought to borrow From my books surcease of sorrow—sorrow for the lost Lenore— For the rare and radiant maiden whom the angels name Lenore— Nameless here for evermore. And the silken, sad, uncertain rustling of each purple curtain Thrilled me—filled me with fantastic terrors never felt before; So that now, to still the beating of my heart, I stood repeating “’Tis some visitor entreating entrance at my chamber door— Some late visitor entreating entrance at my chamber door;— This it is and nothing more.” Presently my soul grew stronger; hesitating then no longer, “Sir,” said I, “or Madam, truly your forgiveness I implore; But the fact is I was napping, and so gently you came rapping, And so faintly you came tapping, tapping at my chamber door, That I scarce was sure I heard you”—here I opened wide the door;— Darkness there and nothing more. Deep into that darkness peering, long I stood there wondering, fearing, Doubting, dreaming dreams no mortal ever dared to dream before; But the silence was unbroken, and the stillness gave no token, And the only word there spoken was the whispered word, “Lenore?” This I whispered, and an echo murmured back the word, “Lenore!”— Merely this and nothing more. Back into the chamber turning, all my soul within me burning, Soon again I heard a tapping somewhat louder than before. “Surely,” said I, “surely that is something at my window lattice; Let me see, then, what thereat is, and this mystery explore— Let my heart be still a moment and this mystery explore;— ’Tis the wind and nothing more!” Open here I flung the shutter, when, with many a flirt and flutter, In there stepped a stately Raven of the saintly days of yore; Not the least obeisance made he; not a minute stopped or stayed he; But, with mien of lord or lady, perched above my chamber door— Perched upon a bust of Pallas just above my chamber door— Perched, and sat, and nothing more. Then this ebony bird beguiling my sad fancy into smiling, By the grave and stern decorum of the countenance it wore, “Though thy crest be shorn and shaven, thou,” I said, “art sure no craven, Ghastly grim and ancient Raven wandering from the Nightly shore— Tell me what thy lordly name is on the Night’s Plutonian shore!” Quoth the Raven “Nevermore.” Much I marvelled this ungainly fowl to hear discourse so plainly, Though its answer little meaning—little relevancy bore; For we cannot help agreeing that no living human being Ever yet was blessed with seeing bird above his chamber door— Bird or beast upon the sculptured bust above his chamber door, With such name as “Nevermore.” But the Raven, sitting lonely on the placid bust, spoke only That one word, as if his soul in that one word he did outpour. Nothing farther then he uttered—not a feather then he fluttered— Till I scarcely more than muttered “Other friends have flown before— On the morrow he will leave me, as my Hopes have flown before.” Then the bird said “Nevermore.” Startled at the stillness broken by reply so aptly spoken, “Doubtless,” said I, “what it utters is its only stock and store Caught from some unhappy master whom unmerciful Disaster Followed fast and followed faster till his songs one burden bore— Till the dirges of his Hope that melancholy burden bore Of ‘Never—nevermore’.” But the Raven still beguiling all my fancy into smiling, Straight I wheeled a cushioned seat in front of bird, and bust and door; Then, upon the velvet sinking, I betook myself to linking Fancy unto fancy, thinking what this ominous bird of yore— What this grim, ungainly, ghastly, gaunt, and ominous bird of yore Meant in croaking “Nevermore.” This I sat engaged in guessing, but no syllable expressing To the fowl whose fiery eyes now burned into my bosom’s core; This and more I sat divining, with my head at ease reclining On the cushion’s velvet lining that the lamp-light gloated o’er, But whose velvet-violet lining with the lamp-light gloating o’er, She shall press, ah, nevermore! Then, methought, the air grew denser, perfumed from an unseen censer Swung by Seraphim whose foot-falls tinkled on the tufted floor. “Wretch,” I cried, “thy God hath lent thee—by these angels he hath sent thee Respite—respite and nepenthe from thy memories of Lenore; Quaff, oh quaff this kind nepenthe and forget this lost Lenore!” Quoth the Raven “Nevermore.” “Prophet!” said I, “thing of evil!—prophet still, if bird or devil!— Whether Tempter sent, or whether tempest tossed thee here ashore, Desolate yet all undaunted, on this desert land enchanted— On this home by Horror haunted—tell me truly, I implore— Is there—is there balm in Gilead?—tell me—tell me, I implore!” Quoth the Raven “Nevermore.” “Prophet!” said I, “thing of evil!—prophet still, if bird or devil! By that Heaven that bends above us—by that God we both adore— Tell this soul with sorrow laden if, within the distant Aidenn, It shall clasp a sainted maiden whom the angels name Lenore— Clasp a rare and radiant maiden whom the angels name Lenore.” Quoth the Raven “Nevermore.” “Be that word our sign of parting, bird or fiend!” I shrieked, upstarting— “Get thee back into the tempest and the Night’s Plutonian shore! Leave no black plume as a token of that lie thy soul hath spoken! Leave my loneliness unbroken!—quit the bust above my door! Take thy beak from out my heart, and take thy form from off my door!” Quoth the Raven “Nevermore.” And the Raven, never flitting, still is sitting, still is sitting On the pallid bust of Pallas just above my chamber door; And his eyes have all the seeming of a demon’s that is dreaming, And the lamp-light o’er him streaming throws his shadow on the floor; And my soul from out that shadow that lies floating on the floor Shall be lifted—nevermore!"
		if let dest = chosenDevice {
			dest.send(string:theRaven)
		}
	}
	@IBAction func quoteBulwerLitton(_ sender: Any) {
		let paulClifford = "It was a dark and stormy night; the rain fell in torrents, except at occasional intervals, when it was checked by a violent gust of wind which swept up the streets (for it is in London that our scene lies), rattling along the house-tops, and fiercely agitating the scanty flame of the lamps that struggled against the darkness. Through one of the obscurest quarters of London, and among haunts little loved by the gentlemen of the police, a man, evidently of the lowest orders, was wending his solitary way. He stopped twice or thrice at different shops and houses of a description correspondent with the appearance of the quartier in which they were situated, and tended inquiry for some article or another which did not seem easily to be met with. All the answers he received were couched in the negative; and as he turned from each door he muttered to himself, in no very elegant phraseology, his disappointment and discontent. At length, at one house, the landlord, a sturdy butcher, after rendering the same reply the inquirer had hitherto received, added, “But if this vill do as vell, Dummie, it is quite at your sarvice!” Pausing reflectively for a moment, Dummie responded that he thought the thing proffered might do as well; and thrusting it into his ample pocket, he strode away with as rapid a motion as the wind and the rain would allow. He soon came to a nest of low and dingy buildings, at the entrance to which, in half-effaced characters, was written “Thames Court.” Halting at the most conspicuous of these buildings, an inn or alehouse, through the half-closed windows of which blazed out in ruddy comfort the beams of the hospitable hearth, he knocked hastily at the door. He was admitted by a lady of a certain age, and endowed with a comely rotundity of face and person. “Hast got it, Dummie?” said she, quickly, as she closed the door on the guest. “Noa, noa! not exactly; but I thinks as ‘ow—” “Pish, you fool!” cried the woman, interrupting him peevishly. “Vy, it is no use desaving me. You knows you has only stepped from my boosing-ken to another, and you has not been arter the book at all. So there’s the poor cretur a raving and a dying, and you—” “Let I speak!” interrupted Dummie in his turn. “I tells you I vent first to Mother Bussblone’s, who, I knows, chops the whiners morning and evening to the young ladies, and I axes there for a Bible; and she says, says she, ‘I’ as only a “Companion to the Halter,” but you’ll get a Bible, I think, at Master Talkins’, the cobbler as preaches.’ So I goes to Master Talkins, and he says, says he, ‘I ‘as no call for the Bible,—‘cause vy? I ‘as a call vithout; but mayhap you’ll be a getting it at the butcher’s hover the vay,—‘cause vy? The butcher ‘ll be damned!’ So I goes hover the vay, and the butcher says, says he, ‘I ‘as not a Bible, but I ‘as a book of plays bound for all the vorld just like ‘un, and mayhap the poor cretur may n’t see the difference.’ So I takes the plays, Mrs. Margery, and here they be surely! And how’s poor Judy?” “Fearsome! she’ll not be over the night, I’m a thinking.” “Vell, I’ll track up the dancers!” So saying, Dummie ascended a doorless staircase, across the entrance of which a blanket, stretched angularly from the wall to the chimney, afforded a kind of screen; and presently he stood within a chamber which the dark and painful genius of Crabbe might have delighted to portray. The walls were whitewashed, and at sundry places strange figures and grotesque characters had been traced by some mirthful inmate, in such sable outline as the end of a smoked stick or the edge of a piece of charcoal is wont to produce. The wan and flickering light afforded by a farthing candle gave a sort of grimness and menace to these achievements of pictorial art, especially as they more than once received embellishments from portraits of Satan such as he is accustomed to be drawn. A low fire burned gloomily in the sooty grate, and on the hob hissed “the still small voice” of an iron kettle. On a round deal table were two vials, a cracked cup, a broken spoon of some dull metal, and upon two or three mutilated chairs were scattered various articles of female attire. On another table, placed below a high, narrow, shutterless casement (athwart which, instead of a curtain, a checked apron had been loosely hung, and now waved fitfully to and fro in the gusts of wind that made easy ingress through many a chink and cranny), were a looking-glass, sundry appliances of the toilet, a box of coarse rouge, a few ornaments of more show than value, and a watch, the regular and calm click of which produced that indescribably painful feeling which, we fear, many of our readers who have heard the sound in a sick-chamber can easily recall. A large tester-bed stood opposite to this table, and the looking-glass partially reflected curtains of a faded stripe, and ever and anon (as the position of the sufferer followed the restless emotion of a disordered mind) glimpses of the face of one on whom Death was rapidly hastening. Beside this bed now stood Dummie, a small, thin man dressed in a tattered plush jerkin, from which the rain-drops slowly dripped, and with a thin, yellow, cunning physiognomy grotesquely hideous in feature, but not positively villanous in expression. On the other side of the bed stood a little boy of about three years old, dressed as if belonging to the better classes, although the garb was somewhat tattered and discoloured. The poor child trembled violently, and evidently looked with a feeling of relief on the entrance of Dummie. And now there slowly, and with many a phthisical sigh, heaved towards the foot of the bed the heavy frame of the woman who had accosted Dummie below, and had followed him, haud passibus aequis, to the room of the sufferer; she stood with a bottle of medicine in her hand, shaking its contents up and down, and with a kindly yet timid compassion spread over a countenance crimsoned with habitual libations. This made the scene,—save that on a chair by the bedside lay a profusion of long, glossy, golden ringlets, which had been cut from the head of the sufferer when the fever had begun to mount upwards, but which, with a jealousy that portrayed the darling littleness of a vain heart, she had seized and insisted on retaining near her; and save that, by the fire, perfectly inattentive to the event about to take place within the chamber, and to which we of the biped race attach so awful an importance, lay a large gray cat, curled in a ball, and dozing with half-shut eyes, and ears that now and then denoted, by a gentle inflection, the jar of a louder or nearer sound than usual upon her lethargic senses. The dying woman did not at first attend to the entrance either of Dummie or the female at the foot of the bed, but she turned herself round towards the child, and grasping his arm fiercely, she drew him towards her, and gazed on his terrified features with a look in which exhaustion and an exceeding wanness of complexion were even horribly contrasted by the glare and energy of delirium. “If you are like him,” she muttered, “I will strangle you,—I will! Ay, tremble, you ought to tremble when your mother touches you, or when he is mentioned. You have his eyes, you have! Out with them, out,—the devil sits laughing in them! Oh, you weep, do you, little one? Well, now, be still, my love; be hushed! I would not harm thee! Harm—O God, he is my child after all!” And at these words she clasped the boy passionately to her breast, and burst into tears. “Coom, now, coom,” said Dummie, soothingly; “take the stuff, Judith, and then ve’ll talk over the hurchin!” The mother relaxed her grasp of the boy, and turning towards the speaker, gazed at him for some moments with a bewildered stare; at length she appeared slowly to remember him, and said, as she raised herself on one hand, and pointed the other towards him with an inquiring gesture,—“Thou hast brought the book?” Dummie answered by lifting up the book he had brought from the honest butcher’s. “Clear the room, then,” said the sufferer, with that air of mock command so common to the insane. “We would be alone!” Dummie winked at the good woman at the foot of the bed; and she (though generally no easy person to order or to persuade) left, without reluctance, the sick chamber. “If she be a going to pray,” murmured our landlady (for that office did the good matron hold), “I may indeed as well take myself off, for it’s not werry comfortable like to those who be old to hear all that ‘ere!” With this pious reflection, the hostess of the Mug,—so was the hostelry called,—heavily descended the creaking stairs. “Now, man,” said the sufferer, sternly, “swear that you will never reveal,—swear, I say! And by the great God whose angels are about this night, if ever you break the oath, I will come back and haunt you to your dying day!” Dummie’s face grew pale, for he was superstitiously affected by the vehemence and the language of the dying woman, and he answered, as he kissed the pretended Bible, that he swore to keep the secret, as much as he knew of it, which, she must be sensible, he said, was very little. As he spoke, the wind swept with a loud and sudden gust down the chimney, and shook the roof above them so violently as to loosen many of the crumbling tiles, which fell one after the other, with a crashing noise, on the pavement below. Dummie started in affright; and perhaps his conscience smote him for the trick he had played with regard to the false Bible. But the woman, whose excited and unstrung nerves led her astray from one subject to another with preternatural celerity, said, with an hysterical laugh, “See, Dummie, they come in state for me; give me the cap—yonder—and bring the looking-glass!” Dummie obeyed; and the woman, as she in a low tone uttered something about the unbecoming colour of the ribbons, adjusted the cap on her head, and then, saying in a regretful and petulant voice, “Why should they have cut off my hair? Such a disfigurement!” bade Dummie desire Mrs. Margery once more to ascend to her. Left alone with her child, the face of the wretched mother softened as she regarded him, and all the levities and all the vehemences—if we may use the word—which, in the turbulent commotion of her delirium, had been stirred upward to the surface of her mind, gradually now sank as death increased upon her, and a mother’s anxiety rose to the natural level from which it had been disturbed and abased. She took the child to her bosom, and clasping him in her arms, which grew weaker with every instant, she soothed him with the sort of chant which nurses sing over their untoward infants; but her voice was cracked and hollow, and as she felt it was so, the mother’s eyes filled with tears. Mrs. Margery now reentered; and turning towards the hostess with an impressive calmness of manner which astonished and awed the person she addressed, the dying woman pointed to the child and said,— “You have been kind to me, very kind, and may God bless you for it! I have found that those whom the world calls the worst are often the most human. But I am not going to thank you as I ought to do, but to ask of you a last and exceeding favour. Protect my child till he grows up. You have often said you loved him,—you are childless yourself,—and a morsel of bread and a shelter for the night, which is all I ask of you to give him, will not impoverish more legitimate claimants.” Poor Mrs. Margery, fairly sobbing, vowed she would be a mother to the child, and that she would endeavour to rear him honestly; though a public-house was not, she confessed, the best place for good examples. “Take him,” cried the mother, hoarsely, as her voice, failing her strength, rattled indistinctly, and almost died within her. “Take him, rear him as you will, as you can; any example, any roof, better than—” Here the words were inaudible. “And oh, may it be a curse and a—Give me the medicine; I am dying.” The hostess, alarmed, hastened to comply; but before she returned to the bedside, the sufferer was insensible,—nor did she again recover speech or motion. A low and rare moan only testified continued life, and within two hours that ceased, and the spirit was gone. At that time our good hostess was herself beyond the things of this outer world, having supported her spirits during the vigils of the night with so many little liquid stimulants that they finally sank into that torpor which generally succeeds excitement. Taking, perhaps, advantage of the opportunity which the insensibility of the hostess afforded him, Dummie, by the expiring ray of the candle that burned in the death-chamber, hastily opened a huge box (which was generally concealed under the bed, and contained the wardrobe of the deceased), and turned with irreverent hand over the linens and the silks, until quite at the bottom of the trunk he discovered some packets of letters; these he seized, and buried in the conveniences of his dress. He then, rising and replacing the box, cast a longing eye towards the watch on the toilet-table, which was of gold; but he withdrew his gaze, and with a querulous sigh observed to himself: “The old blowen kens of that, ‘od rat her! but, howsomever, I’ll take this: who knows but it may be of sarvice. Tannies to-day may be smash to-morrow!” [Meaning, what is of no value now may be precious hereafter.] and he laid his coarse hand on the golden and silky tresses we have described. “‘T is a rum business, and puzzles I; but mum’s the word for my own little colquarren [neck].” With this brief soliloquy Dummie descended the stairs and let himself out of the house."
		if let dest = chosenDevice {
			dest.send(string:paulClifford)
		}
	}
}

