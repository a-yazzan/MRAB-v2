# MRAB-v2

Alternative layout for **ROG Ally + SteamOS**.

This version swaps the rear paddles with the Armoury Crate / Command Center buttons so you can use proper Steam Deck-style holds (Guide + mouse, Quick Access, etc.).

## Layout

| Physical Button       | Function              |
|-----------------------|-----------------------|
| **M1 (Left Paddle)**  | Guide (Steam button) |
| **M2 (Right Paddle)** | Quick Access (QAM)   |
| **Command Center**    | Left Paddle          |
| **Armoury Crate**     | Right Paddle         |
| Start / Select        | Unchanged            |

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/a-yazzan/MRAB-v2/main/install.sh | sudo bash

## Uninstallation

```bash
curl -fsSL https://raw.githubusercontent.com/a-yazzan/MRAB-v2/main/uninstall.sh | sudo bash

Notes

Requires InputPlumber (included in modern SteamOS)
Protected against SteamOS updates via atomic-update whitelist
Compatible with ROG Ally (RC71L) and ROG Ally X (RC72LA)

Credits
Inspired by the original MRAB by 0Chencc.
