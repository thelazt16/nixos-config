# ~~WIP or~~ **DROPPED** for now !!!

This repo is created to track my config and current opinion regarding whether I should keep migrating to NixOS or not. Does the time I spend learning Nix worth the outcome (which I still think it is but should I?). In case I decided to drop it now, I can just go back to this repo and figure out what I did and learn from that.

---

# NixOS Configuration

## Description

This repository contains my configuration files for NixOS, utilizing flakes and home-manager. NixOS is a Linux distribution that employs a declarative configuration model, enabling reproducible system setups. This project aims to document my journey and challenges while configuring NixOS as a potential daily driver.

## Table of Contents

- Description
- Basics of NixOS Configuration
  - Nix Store
  - Flakes
  - Home-Manager
  - Nix Options
- Pros and Cons
  - Pros
  - Cons
- To-Do

## Basics of NixOS Configuration

### Nix Store

The Nix Store is a central part of the Nix package manager. It stores all the packages and their dependencies in a unique, content-addressed manner, allowing multiple versions of packages to coexist peacefully. [More Information](https://nixos.org/manual/nix/stable/#chap-stores)

### Flakes

Flakes are a new way to define Nix packages and configurations. They aim to provide a more reproducible and composable system. Flakes include a `flake.nix` file which describes the inputs and outputs of your project. [More Information](https://nixos.wiki/wiki/Flakes)

### Home-Manager

Home-Manager is a tool to manage user-specific configurations using the Nix language. It allows you to define your home environment (dotfiles, applications, etc.) declaratively, and it integrates well with NixOS. [More Information](https://nix-community.github.io/home-manager/)

### Nix Options

NixOS options are used to configure various aspects of the system. They are defined in the `configuration.nix` file and cover a wide range of settings, from systemd services to hardware configurations. [More Information](https://nixos.org/manual/nixos/stable/#sec-configuration)

## Pros and Cons

### Pros

- **Reproducibility**: NixOS's declarative configuration ensures that the system state can be reproduced exactly.
- **Isolation**: Packages and dependencies are isolated, preventing version conflicts.
- **Flexibility**: The Nix language is very powerful and flexible, allowing for complex configurations.

### Cons

- **Complexity**: Setting up flakes and home-manager can be complex and time-consuming.
- **Symlinks**: Home-manager and Nix options often create symlinks for configuration files, meaning manual edits to these files will be overwritten by config generated by nix options or home-manager when you build your system or your home-manager.
- **Learning Curve**: The way NixOS handles packages and configurations requires a steep learning curve, especially for those new to Nix.
- **Bad Documentation**: NixOS's official documentation is difficult to read and often contradiction each other. Unlike the well-structured Arch Wiki, NixOS documentation is quite hard to navigate, lacking straightforward configuration guides and proper context on which files to edit. Additionally, many Nix packages have insufficient documentation, making it challenging to figure out what to put into the configuration options. For example, themes like `tokyo-night-gtk` lack clear documentation on their name or variant for home-manager options, causing headaches during setup.

## To-Do

- Improve understanding of Nix store and its implications for package management.
- Create a proper structure to make it easier to configure the system.
  - `hosts`: machine level configurations, TODO: add nix script which copy `hardware-configuration.nix` generated by NixOS.
  - `system`: system level configurations, all the packages and options which gonna be used by all user.
  - `user`: user level configurations which mostly gonna use `home-manager` options and packages so it will only available per user basis i.e. wm specific apps and settings.
  - [How to Start Adding Modularity to Your NixOS Config](https://www.youtube.com/watch?v=bV3hfalcSKs)
- Learn more of how options and flake work and use it to set up everything
  - [Custom Options and If-else Statements in Your NixOS Config](https://www.youtube.com/watch?v=Qull6TMQm4Q)
  - [Program a Modular Control Center for Your Config Using Special Args in NixOS Flakes](https://www.youtube.com/watch?v=H_Qct7TVB6o)
  - [Using Stable and Unstable At the Same Time on NixOS](https://www.youtube.com/watch?v=hlytf6Uxf4E)
- Add different options for bspwm (x11) and hyprland (wayland)
- Translating all my configurations to nix and home-manager options.

## Useful links

- [mynixos.com](https://mynixos.com/) useful to search for packages, nix or home-manager options
- [LibrePhoenix: NixOS Config Guides for Nerds and Other Cool People](https://www.youtube.com/playlist?list=PL_WcXIXdDWWpuypAEKzZF2b5PijTluxRG)
- [Vimjoyer: Nix tutorials](https://www.youtube.com/playlist?list=PLko9chwSoP-15ZtZxu64k_CuTzXrFpxPE)
- [No Boilerplate: NixOS: Everything Everywhere All at Once](https://www.youtube.com/watch?v=CwfKlX3rA6E)
- [Matthew Croughan: What Nix Can Do (Docker Can't) - SCaLE 20x](https://www.youtube.com/watch?v=6Le0IbPRzOE)
- [Jake Hamilton: NixOS Flake Tour](https://www.youtube.com/watch?v=ARjAsEJ9WVY) is what I want for my end game NixOS configuration.

### Probably what I should have done before going Nix
- [Zero to Nix](https://zero-to-nix.com/)
- [Guide to Nix](https://nixos.org/guides/nix-pills/)
- [Nix Starter Config](https://github.com/Misterio77/nix-starter-configs) is amazing to start adding modularity to your Nix's configuration.
