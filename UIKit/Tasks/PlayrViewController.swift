// PlayrViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Класс
final class PlayrViewController: UIViewController {
    // MARK: - Public Properties

    var index = 0

    // MARK: - Private Properties

    private let albom: [Album] = [
        Album(song: "queen", image: "imageThree", nameSong: "we will rock you", nameArtist: "Eminem", time: "03:23"),
        Album(
            song: "eminem",
            image: "eminemSong",
            nameSong: "Lose Yourself",
            nameArtist: "Король и шут",
            time: "05:26"
        ),
        Album(song: "korol", image: "shut", nameSong: "Кукла колдуна", nameArtist: "Queen", time: "02:01"),
    ]
    private var timer: Timer?
    private var player = AVAudioPlayer()

    // MARK: - IBOutlets

    @IBOutlet var nameExecutor: UILabel!
    @IBOutlet var nameSong: UILabel!
    @IBOutlet var nameImage: UIImageView!
    @IBOutlet var soLabel: UILabel!
    @IBOutlet var favoriteButton: UISlider!
    @IBOutlet private var playButtonOutlet: UIButton!
    @IBOutlet private var slider: UISlider!
    @IBOutlet var rewind: UISlider!
    @IBOutlet var sound: UIButton!
    @IBOutlet var timeSong: UILabel!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupPlayer()
        timeSong.text = "00: 00"
        nameSong.textColor = .white
        nameExecutor.textColor = .white
    }

    // перемотка музыки
    private func setupPlayer() {
        nameExecutor.text = albom[index].nameArtist
        nameSong.text = albom[index].nameSong
        nameImage.image = UIImage(named: albom[index].image)
        favoriteButton.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        slider.transform = CGAffineTransformMakeRotation(CGFloat(-Double.pi / 2))
    }

    private func setup() {
        do {
            if let audioPath = Bundle.main.path(forResource: albom[index].song, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                favoriteButton.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }

        timer = Timer.scheduledTimer(
            timeInterval: 0.0001,
            target: self,
            selector: #selector(updateTimeSong),
            userInfo: nil,
            repeats: true
        )
    }

    // MARK: - IBAction

    // метод включения выключения музыки
    @IBAction private func playButton(_ sender: Any) {
        if playButtonOutlet.currentImage == UIImage(named: "play") {
            playButtonOutlet.setImage(UIImage(named: "stop"), for: .normal)
            player.play()

        } else {
            playButtonOutlet.setImage(UIImage(named: "play"), for: .normal)
            player.stop()
        }
    }

    // следующая песня
    @IBAction private func nextSongButton(_ sender: Any) {
        player.stop()
        if index < (albom.count - 1) {
            index += 1
            nameExecutor.text = albom[index].nameArtist
            nameSong.text = albom[index].nameSong
            nameImage.image = UIImage(named: albom[index].image)
        } else {
            index = 0
        }
        setup()
        player.play()
    }

    // предыдущая песня
    @IBAction func previousSongButton(_ sender: Any) {
        player.stop()
        if index != 0 {
            index -= 1
            nameExecutor.text = albom[index].nameArtist
            nameSong.text = albom[index].nameSong
            nameImage.image = UIImage(named: albom[index].image)
        } else {
            index = (albom.count - 1)
        }
        setup()
        player.play()
    }

    // громкость
    @IBAction func sliderAction(_ sender: Any) {
        if slider.value == 0 {
            sound.setImage(UIImage(named: "mute"), for: .normal)
        } else {
            sound.setImage(UIImage(named: "sound"), for: .normal)
        }
        player.volume = slider.value
    }

    // перемотка песни
    @IBAction func rewindSong(_ sender: Any) {
        rewind.maximumValue = Float(player.duration)
    }

    // Открытие алертконтроллера
    @IBAction func openPlaylistButton(_ sender: Any) {
        let playlistAlert = UIAlertController(
            title: "Упс",
            message: "Функционал в разработке :(",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ок", style: .cancel)

        playlistAlert.addAction(okAction)
        present(playlistAlert, animated: true)
    }

    // закрыть экран
    @IBAction private func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }

    // включить и выключить звук
    @IBAction func activateSound(_ sender: Any) {
        if sound.currentImage == UIImage(named: "sound") {
            sound.setImage(UIImage(named: "mute"), for: .normal)
            player.volume = 0
            slider.value = 0
        } else {
            sound.setImage(UIImage(named: "sound"), for: .normal)
            player.volume = 0.1
            slider.value = 0.1
        }
    }

    @objc private func updateTimeSong() {
        let time = Int(player.duration) - Int(player.currentTime)
        let minets = time / 60
        let second = time % 60
        timeSong.text = NSString(format: "-%02d:%02d", minets, second) as String
        rewind.value = Float(player.currentTime)
    }

    @objc private func changeSlider(sender: UISlider) {
        if sender == favoriteButton {
            player.currentTime = TimeInterval(sender.value)
        }
    }
}
