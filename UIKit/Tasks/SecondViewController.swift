// SecondViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Класс Вью Контроллер
final class SecondViewController: UIViewController {
    var player = AVAudioPlayer()
    let nameSongs = ["eminem", "korol", "queen", "viktor"]

    // MARK: - IBOutlets

    @IBOutlet private var playButtonOutlet: UIButton!
    @IBOutlet private var slider: UISlider!
    @IBOutlet var rewind: UISlider!

    // MARK: - IBAction

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
    @IBAction func nextSongButton(_ sender: Any) {}

    // предыдущая песня
    @IBAction func previousSongButton(_ sender: Any) {}

    // громкость
    @IBAction func sliderAction(_ sender: Any) {
        player.volume = slider.value
    }

    // перемотка песни
    @IBAction func rewindSong(_ sender: Any) {
        rewind.maximumValue = Float(player.duration)
//        if rewind == sender {
//            player.currentTime = TimeInterval
//        }
    }

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

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        slider.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi / 2))

        do {
            if let audioPath = Bundle.main.path(forResource: "eminem", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("Error")
        }
    }
}
