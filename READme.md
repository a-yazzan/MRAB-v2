# MRAB-v2

Alternative button layout for **ROG Ally and ROG Ally X running SteamOS**.

This version swaps the rear paddles with the Armoury Crate and Command Center buttons, allowing you to use proper Steam Deck-style button combinations (Guide + mouse, Quick Access Menu, etc.).

## Layout

| Physical Button       | Function                |
| :-------------------- | :---------------------- |
| **M1 (Left Paddle)**  | Guide (Steam button)    |
| **M2 (Right Paddle)** | Quick Access Menu (QAM) |
| **Command Center**    | Left Paddle             |
| **Armoury Crate**     | Right Paddle            |
| **Start / Select**    | Unchanged               |

## Installation & Uninstallation

**Install:**

```bash
curl -fsSL https://raw.githubusercontent.com/a-yazzan/MRAB-v2/main/install.sh | sudo bash
```

**Uninstall:**

```bash
curl -fsSL https://raw.githubusercontent.com/a-yazzan/MRAB-v2/main/uninstall.sh | sudo bash
```

## Notes

* Requires InputPlumber (included in modern SteamOS versions).
* Protected against SteamOS updates via the atomic-update whitelist.
* Compatible with the ROG Ally (RC71L) and ROG Ally X (RC72LA).

## Credits

Inspired by the original [MRAB](https://github.com/0Chencc/MRAB) by 0Chencc.
