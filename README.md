# Godot Simple Coin Collector Game

This is a simple 2D top-down "coin collector" game built from scratch using the Godot 4 engine. My primary goal was to learn the fundamentals of the Godot engine, especially character movement and inter-node communication (signals).

---

What I Learned

The core Godot features I learned and implemented while completing this project:

* **Character Movement:** Wrote a physics-based movement system from scratch using `CharacterBody2D` and `move_and_slide()`.
* **Input:** Defined keyboard inputs (`W, A, S, D`) using the `InputMap`.
* **Collision Detection:** Used `Area2D` and the `body_entered` signal to detect when the player "collected" a coin.
* **Inter-Node Communication:** Created a **custom signal** (`coin_collected`) to notify the main scene when a coin was collected.
* **Game Manager:** Used the main scene script (`main.gd`) to count the total number of coins in the scene and track how many have been collected.
* **UI (User Interface):**
    * Created a "Win Screen" (`WinLabel`) using a `Label` node.
    * Paused the game upon winning using `get_tree().paused`.
* **Animation:**
    * Added a **code-free** bobbing animation to the "Win Screen" label using an `AnimationPlayer`.
    * Set the animation's `Process Mode` to `Always` to ensure it continues playing even when the game is paused.
* **Sound Effects:** Used `AudioStreamPlayer` to add a coin collection sound effect and background music that continues to play (`Always` mode) even when the game is paused.
* **Window Settings:** Customized the game window to be `Borderless`, and set a custom `Icon` and `Title`.

## Version Used

* **Godot Engine v4.1**
