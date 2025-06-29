---
title: 'NixOS - guide for experienced Linux users'
date: 2025-05-30
description: 'A practical, advanced NixOS guide for power users and DevOps: covers reproducibility, declarative config, real workflows, pitfalls, flakes, and system management patterns.'
showtoc: true
---

## 0. Introduction

- Who is this guide for: distro-hoppers, power users, and DevOps professionals.
- What makes NixOS unique: reproducibility, declarative configs, immutability.
- Philosophy: Don't "set up" your system -- declare it.

### Who is this guide for?

This guide is tailored for experienced Linux users -- those who’ve distro-hopped across Debian, Arch, Gentoo, Fedora, and maybe even LFS. If you’re fluent in the shell, confident with `systemd`, and comfortable breaking and fixing your system, this guide is for you. Whether you’re a DevOps engineer seeking reproducible infrastructure, or a power user looking for a truly declarative desktop, welcome to NixOS.

### What This Guide Is *Not*

This guide is **not** a beginner-friendly walkthrough or a full documentation substitute. It does not aim to explain every Nix concept from first principles, nor does it attempt to cover every configuration keyword or security hardening path.

It deliberately avoids duplicating the [NixOS Manual](https://nixos.org/manual) or `man configuration.nix`. Instead, it focuses on **real-world workflows**, **non-obvious pitfalls**, and **practical patterns** that matter most to experienced Linux users transitioning into the NixOS model.

If you're looking for a step-by-step tutorial, exhaustive hardening checklists, or an academic exploration of the Nix language -- this is not that. This guide is designed to help you hit the ground running as a **power user or DevOps engineer** building reproducible systems with confidence.

### What makes NixOS unique?

NixOS isn’t just another distro -- it’s a **paradigm shift**. Its core concepts include:

- **Reproducibility**: Your entire system -- packages, config, and services -- can be expressed in code, versioned, and rebuilt anywhere.
- **Immutability**: Configs are compiled into immutable system generations. Manual drift is not just discouraged -- it’s overwritten.
- **Declarative Configuration**: Instead of “doing” things to your system, you *declare* how it should look, and NixOS makes it so.

Forget `apt install`, `pacman -Sy`, or `emerge --sync`. NixOS flips the table: no more procedural state -- just declarative truth.

### Philosophy: Don’t "set up" your system -- declare it.

In traditional Linux, you configure your system through actions: install this, modify that, tweak here, patch there. With NixOS, you instead write down your *intent*. The system builds itself to match.

This has deep implications:

- You can roll back *everything*, not just packages.
- You can replicate a working system from scratch on new hardware with a single Git pull.
- You can version-control your entire OS, not just your code.

If you're tired of config drift, “it worked on my machine” bugs, or fragile deployment scripts -- NixOS offers an escape hatch.

> This guide focuses on **practical shortcuts, real-world use cases, and traps to avoid**, not rephrasing the manual. Think of it as a travel guide, not a textbook.

---
## 1. Installing NixOS with Purpose

- Headless vs Desktop: choose installation goals early.
- Guided installer vs manual partitioning.
- UEFI caveats, encrypted disks, impermanence optional.
### Headless vs Desktop: choose installation goals early

NixOS serves well as both a minimal headless server and a fully featured desktop. But the installation approach -- and system layout -- depends on your target.

**Headless server?**
  - Minimal profile: no GUI, no `X11`, no `plasma5`.
  - Focus on SSH setup, disk layout, and remote access.
  - Strong candidate for using **flakes** early -- especially if planning Git-based deployments.

**Desktop?**
  - Choose your DE in `configuration.nix`: GNOME, KDE, sway, etc.
  - Pay attention to hardware support: audio, video, input devices.
  - May prefer `configuration.nix` to get started quickly, then migrate to flakes once stable.

**Tip**: Decide on your system *topology* and *workflow* before installing -- NixOS enforces consistency, so refactoring later is deeper than just “changing a package”.

### Guided installer vs manual partitioning

As of recent releases, NixOS offers a GUI **Calamares**-based installer. It’s ideal for newcomers, but:

- It's only available on some ISOs (usually GNOME/KDE ones).
- It skips many Nix-specific features -- no flake integration, no custom `configuration.nix`.

For experienced users, manual installation is usually better:

1. Partition and format with `fdisk`, `mkfs.ext4`, `mount`, `cryptsetup`, etc.
2. Mount root to `/mnt`, generate the base config with `nixos-generate-config`.
3. Start modifying `/mnt/etc/nixos/configuration.nix` or `/mnt/etc/nixos/flake.nix`.

**Note**: With NixOS, your installation media is a live environment -- treat it as a recovery shell or staging area for building your future system.

### UEFI caveats, encrypted disks, impermanence optional

- **UEFI**: Make sure `/boot` is mounted on an EFI system partition (`vfat`). Use `boot.loader.systemd-boot.enable = true;` or GRUB with `efiSupport = true;`.
- **Encrypted disks**: Use `boot.initrd.luks.devices` to unlock LUKS volumes during boot. For multiple disks or ZFS+LUKS, prefer modules like `disks.nix`.
- **Impermanence** (optional): If you want a throwaway system where state is not preserved (like `/etc`, `/var`, or `/home`), plan it now. See the `impermanence` module or use tmpfs for volatile mounts.

**Gotchas**:
- If you install without a bootloader and forget to configure it in Nix, it won’t magically “just work” -- declarative means nothing happens unless you declare it.
- If `/boot` is not a separate partition and you're using full-disk LUKS, systemd-boot may fail silently.

> Installing NixOS is like writing the prologue to your system's autobiography -- the choices you make now define how reproducible, extensible, and robust the system will be later.

---
## 2. Choosing Between `configuration.nix` and Flakes

- TL;DR: `configuration.nix` is fast to start, flakes are future-proof and portable.
- Headless servers: prefer flakes for GitOps-style workflows.
- Desktop systems: either works, flakes add version locking and flake-pinning.
- Hybrid: how to migrate later from configuration.nix to flakes.

### TL;DR

-  `configuration.nix`: easier to start with, well-supported, no extra tooling.
-  flakes: cleaner, reproducible, versioned; better for teams, automation, and CI.

**Recommendation**:

- Use `configuration.nix` if you're new to Nix or setting up a quick desktop.
- Use **flakes** if you're managing multiple systems, servers, or want Git-based declarative control from day one.

### Headless servers: prefer flakes for GitOps-style workflows

For servers, **flakes are the natural fit**:
- You can clone your config repo, `nixos-rebuild switch --flake .#hostname`, and you’re done.
- Pin exact versions of nixpkgs and packages → avoids surprises during upgrades.
- Easy to bootstrap headless boxes via SSH with `nixos-install --flake`.

Pro tip: Set up a repo structure like this:

```
my-nixos/  
├── flake.nix  
├── flake.lock  
├── hosts/  
│ ├── server-a/  
│ │ └── configuration.nix  
│ └── desktop-x/  
│ └── configuration.nix  
├── modules/  
└── overlays/
```

### Desktop systems: either works, flakes add version locking

A `configuration.nix` gets you up and running fast, especially with the generated template from `nixos-generate-config`.

Flakes give you:
  - Clean separation of concerns (`modules/`, `hosts/`, `homeManagerModules/`)
  - Pinning to exact package versions
  - Easier sharing of configurations across machines
  - Better integration with `home-manager` and `nix-darwin` (macOS)

Flakes are particularly useful for devs working across multiple environments and who want full control over their toolchain.

### Hybrid: how to migrate later from configuration.nix to flakes

Many users start with `configuration.nix` and later migrate to flakes -- this is totally valid.

Here's the gradual path:

1. Set up a Git repo and move `/etc/nixos` contents into it.
2. Add a basic `flake.nix` and `flake.lock` (you can copy from nixos templates or use `nix flake init`).
3. Wrap your `configuration.nix` in a flake output:

```nix
# flake.nix
{
  description = "My NixOS config";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.nixos-unstable.follows = "nixpkgs";

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.my-host = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/my-host/configuration.nix ];
    };
  };
}
```

4. Run rebuilds like so:

```sh
sudo nixos-rebuild switch --flake .#my-host
```

5. Add `nix.settings.experimental-features = [ "nix-command" "flakes" ];` to `/etc/nixos/configuration.nix` to unlock flake usage system-wide.
  

> Flakes aren’t mandatory -- but they unify config, enable better tooling (like `nix flake update`), and are increasingly the community default.

---
## 3. The NixOS Way: What's Different (and What Will Surprise You)

- No `apt install` or `pacman -S` – everything goes through declarative config.
- /etc is not for manual edits -- explain `/etc/nixos`, `/run/current-system`.
- `systemctl` still works -- but services are declared, not enabled manually.
- Global vs user environment: `environment.systemPackages` vs `home-manager`.

### No `apt install` or `pacman -S`: Everything is declarative (and that's a feature)

If you're used to doing `sudo apt install htop` or  `pacman -S neovim` - forget it.  In NixOS, installing software _system-wide_ means adding it to your configuration and rebuilding:

```nix
environment.systemPackages = with pkgs; [
  htop
  neovim
];
```

Then apply the change: `sudo nixos-rebuild switch`.  Why?
- You get a **reproducible state** -- no drift from ad-hoc installs.
- You can `git diff` system changes.
- You can **roll back** to any previous state (GRUB keeps generations).
    
For ephemeral tools or quick testing, use: `nix-shell -p <pkg>`  or with flakes: `nix run nixpkgs#htop`.

### `/etc` is not for manual edits

NixOS owns most of `/etc`. It’s not a freeform config space anymore. For example:
- Your system config lives in `/etc/nixos/configuration.nix` (or flake structure).
- Changes to `/etc/ssh/sshd_config` will be **overwritten** on next rebuild unless declared.

To inspect what your system is running, check:
- `/run/current-system` – current boot generation, symlinked from the store
- `/nix/store` – all your installed packages, system configs, and binaries
- `/nixos` (inside store paths) – your actual compiled system

_Think of `/etc/nixos` as the source of truth. Everything else is a build artifact._

### `systemctl` still works -- but services are declared, not enabled manually

You can still do `sudo systemctl start nginx`. But to enable `nginx` permanently:

```nix
services.nginx.enable = true;
```

Then: `sudo nixos-rebuild switch`.  Forget `systemctl enable` -- it won’t persist across generations unless it’s part of your config.  Same applies to:
- Network interfaces
- Firewall rules
- User accounts
- Locale, timezone, fonts

If you want it to be reproducible -- declare it.

### Global vs User Environment: `systemPackages` vs `home-manager`

There are two layers of package installation:
- **System-wide (`configuration.nix`)**
    - Accessible to all users
    - Requires `sudo nixos-rebuild switch`
- **User-scoped (`home-manager`)**
    - Defined per-user
    - Allows fine-grained, reproducible dotfile and CLI tool management
    - Can be integrated with flakes

Example (home-manager):

```nix
home.packages = with pkgs; [
  bat
  zoxide
];
```

Combine both:
- Put OS-level tools in `systemPackages`
- Put dotfiles, shells, and user tools in `home-manager`

_This dual-layer setup is powerful once you grasp the separation -- system for infra, home-manager for lifestyle._

> 🧭 NixOS is not hard -- it’s just different. Treat your system as a codebase, not a machine. You’re not administering -- you’re declaring intent.

---
## 4. Cheat Sheet: Everyday System Management
- `nixos-rebuild switch`, `nixos-rebuild boot`, `nixos-rebuild test`
- Rollback: `nixos-rebuild switch --rollback` and GRUB generations
- Services: `services.<name>.enable = true;`
- Secrets: how to manage them securely (git-crypt, sops-nix)
- Network config: declarative `networking.*` vs dynamic `nmcli`

### System Rebuilds

- `nixos-rebuild switch` -- apply configuration immediately and reload systemd.
- `nixos-rebuild boot` -- build config but activate it only on next boot.
- `nixos-rebuild test` -- apply temporarily without touching bootloader.

Use `--flake .#hostname` if using flakes.
### Rollbacks

- `nixos-rebuild switch --rollback` -- return to the previous configuration.
- At boot, GRUB lets you select previous generations if system becomes unbootable.
- Check active generation with `readlink /run/current-system`.
### Declaring Services

Instead of `systemctl enable`, declare in config:

```nix
services.openssh.enable = true;
services.nginx.enable = true;
````

To apply: `sudo nixos-rebuild switch`.

To override service behavior, use `services.<name>.extraConfig` or `systemd.services.<name>` blocks.

### Secrets Management

- Use `git-crypt` or `sops-nix` to encrypt secrets in version-controlled configs.
- `sops-nix` integrates well with flakes and provides per-host key access.
- Secrets can be injected at runtime via systemd environment files or `environment.etc`.
    
Example:

```nix
sops.secrets.my_secret = {
  owner = "nginx";
  path = "/etc/secret.env";
};
```

Then load via `systemd.services.nginx.serviceConfig.EnvironmentFile = "/etc/secret.env";`.

### Networking

- For static IPs or DNS: declare in `networking.interfaces` or `networking.nameservers`.
- For Wi-Fi and dynamic networks: enable `networking.networkmanager.enable = true;`.

Declarative setup:

```nix
networking.hostName = "my-nixos";
networking.useDHCP = false;
networking.interfaces.enp0s3.ipv4.addresses = [{
  address = "192.168.1.100";
  prefixLength = 24;
}];
```

For quick runtime changes: `nmcli device wifi connect ...` or `ip a`, but remember these are ephemeral.

### Useful Introspection

- List generations: `nix-env --list-generations --profile /nix/var/nix/profiles/system`
- Show current system config: `nixos-option`
- Debug builds: `nixos-rebuild build-vm` creates a VM of your system for testing
- Inspect config tree: `nixos-option services.sshd`, `nixos-option environment.systemPackages`

### Other Common Snippets

- Add fonts: `fonts.packages = with pkgs; [ noto-fonts-emoji ];`
- Enable firewall: `networking.firewall.enable = true;`
- Set timezone: `time.timeZone = "Europe/Moscow";`
- Create user: 

```nix
users.users.alice = { 
  isNormalUser = true; 
  extraGroups = [ "wheel" ]; 
};
```
    
NixOS is declarative at every level -- once declared, your system builds itself. Nothing happens unless explicitly stated.

---
## 5. Home Manager: User Space, Declarative Style
- Use it with or without flakes.
- Typical use cases: shell config, fonts, themes, CLI tools.
- Common traps: `$HOME` collisions, using `home.file.` vs `xdg.configFile`

### Usage Patterns

Home Manager lets you declare user-level configuration alongside system-level NixOS. It can be:

- Used without flakes (`home.nix` + `home-manager switch`).
- Integrated into flake outputs for per-host user configs.
- Run outside NixOS (e.g. on Debian, Arch) using `nix`.

Typical use cases:

- Managing shell (bash/zsh/fish), prompt (starship), aliases.
- Setting up dev tools (e.g. bat, fzf, zoxide).
- Fonts, GTK/QT themes, Xresources, keybindings.
- Configuring Neovim, VSCode, terminals, etc.

Minimal flake-based example:

```nix
{
  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ ./home.nix ];
      username = "user";
      homeDirectory = "/home/user";
    };
  };
}
````

Then activate: `home-manager switch --flake .#user`.

### Common Traps and Solutions

- **$HOME collisions**: Home Manager manages `~/.config`, `~/.bashrc`, `~/.zshrc`, etc. Avoid manual edits -- they may be overwritten or ignored.
    
- **home.file vs xdg.configFile**:
    - Use `home.file."filename".text` to place arbitrary files (e.g. dotfiles).
    - Use `xdg.configFile."foo/bar".source = ./bar.conf;` for `$XDG_CONFIG_HOME` layouts.
        
- **System-wide vs user-level confusion**: Don’t mix `environment.systemPackages` and `home.packages` arbitrarily -- they serve different scopes.
    
- **Missing dependencies**: Many user tools still require extra `fonts`, `xdg.portal`, or `gtk` settings declared at the system level.
    
### Handy Declarations

Shell setup:

```nix
programs.zsh.enable = true;
programs.starship.enable = true;
programs.direnv.enable = true;
```

Dotfiles:

```nix
home.file.".editorconfig".text = ''
  root = true
  [*]
  indent_style = space
  indent_size = 2
'';
```

XDG configuration:

```nix
xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
```

To use Home Manager in non-flake mode:

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update
home-manager switch
```

But long-term, flake-based Home Manager is more composable and integrates better with system configs.

Home Manager is ideal for replicating user environments across machines, dotfile versioning, and clean separation of system and personal state.

---
## 6. Dev-Friendly Nix: Python, Go, Java, Node, and Friends

- Python virtualenvs vs `mkShell` + `buildInputs`
- Go modules with `buildGoModule`
- Java: managing multiple JDKs
- Node: nixpkgs vs `node2nix`
- Use `direnv` + `nix-shell` for fast per-project setups

### Python

Use `mkShell` to provide per-project virtual environments declaratively.

**flake.nix:**

```nix
devShells.default = pkgs.mkShell {
  buildInputs = [
    pkgs.python311
    pkgs.python311Packages.requests
    pkgs.python311Packages.black
  ];
  shellHook = ''
    export PYTHONPATH=.
  '';
};
```

- Avoid using `venv` -- just declare dependencies in `buildInputs`.
- For native packages (e.g. `psycopg2`), include `postgresql`, `libffi`, etc.
- If you need pip-only deps, use `pip2nix` or `poetry2nix`.

**Testing in shell:**

```sh
nix develop
python script.py
```

### Go

Use `buildGoModule` for reproducible builds, or `mkShell` for dev work.

**flake.nix:**

```nix
devShells.default = pkgs.mkShell {
  buildInputs = [ pkgs.go pkgs.gopls pkgs.gotools ];
};
```

**With buildGoModule (for packaging):**

```nix
buildGoModule {
  pname = "myapp";
  version = "0.1.0";
  src = ./.;
  vendorSha256 = null;
}
```

- Set `GO111MODULE=on` explicitly if needed.
- Use `vendorSha256` = `lib.fakeSha256` to get the actual hash error, then paste the real one.
    
### Java

Java setup can be declarative and version-controlled:

**flake.nix:**

```nix
devShells.default = pkgs.mkShell {
  buildInputs = [
    pkgs.openjdk17
    pkgs.maven
  ];
};
```

- Multiple JDKs: use `pkgs.jdk8`, `jdk17`, etc.
- You can pin Gradle/Maven versions instead of relying on global tools.
- Use `shellHook` to set `JAVA_HOME`.
    
**shellHook example:**

```nix
shellHook = ''
  export JAVA_HOME=${pkgs.openjdk17}
  export PATH=$JAVA_HOME/bin:$PATH
'';
```

### Node.js

Use `node2nix` for full reproducibility, or `mkShell` for lightweight dev shells.

**flake.nix:**

```nix
devShells.default = pkgs.mkShell {
  buildInputs = [ pkgs.nodejs_20 pkgs.yarn ];
};
```

- Use `node2nix` to convert `package.json` + `lock` into Nix expressions.
- Alternative: `npmlock2nix` or `yarn2nix`.
- For quick testing: `nix-shell -p nodejs`
    
**node2nix example:**

```sh
npm install
node2nix -i package.json -l package-lock.json
```

This generates `node-packages.nix` you can import in your flake.

### Other Languages and Tools

- **Rust**: use `naersk` or `cargo2nix`
- **Haskell**: use `haskellPackages.callCabal2nix`
- **C/C++**: use `stdenv.mkDerivation`, include headers explicitly
- **.NET**: `dotnet-sdk`, with optional Mono

### Workflow Tips

- Use `direnv` + `nix-direnv` to auto-enter dev shells.
- Pin toolchains via flakes to avoid breakage across machines.
- Avoid global installs -- use ephemeral `nix run` or `devShells`.

**Example `.envrc`:**

```bash
use flake
```

Once enabled (`direnv allow`), this will auto-load your `devShell` on directory entry.

Nix enables language-agnostic, reproducible, per-project environments -- with zero global pollution.

---
## 7. Impermanence: Volatile Roots and Mutable Homes
- Making `/etc`, `/var`, or `/home` ephemeral
- Use cases: kiosks, shared machines, dev sandboxes
- Tools: `impermanence`, `tmpfs`, persistent declarative users

### Making `/etc`, `/var`, or `/home` ephemeral

NixOS makes it easy to treat parts of the system as **ephemeral** -- wiped on reboot, rebuilt from configuration.  You can mount:

- `/etc` as a tmpfs → no manual changes, only declarative ones.
- `/var` as volatile → logs and cache disappear at boot.
- `/home` as ephemeral → users get fresh home each time (useful in kiosks, testing, shared labs).

```nix
fileSystems."/etc" = {
  device = "none";
  fsType = "tmpfs";
  options = [ "size=64M" "mode=755" ];
};
````

To preserve some files (e.g. machine-id, SSH host keys), use bind mounts with `persisted` path (see below).

### Use Cases

- **Kiosks**: stateless systems, no persistent user data.
- **Dev sandboxes**: test builds in a clean state.
- **Shared machines**: each reboot resets all local state.
- **Live environments**: ISO-style behavior with reproducible state.
### Tools: `impermanence`, `tmpfs`, and persistent overlays

**impermanence** (community module):

- Lets you declaratively define what should be _persistent_ and what should be _volatile_.
- Good fit with ZFS datasets, btrfs subvolumes, or bind mounts.

```nix
environment.persistence."/persist" = {
  directories = [ "/var/lib" "/etc/ssh" ];
  files = [ "/etc/machine-id" ];
};
```

This mounts `/persist/etc/ssh` onto `/etc/ssh` at boot.  You must ensure `/persist` exists and is on a persistent FS (e.g. separate partition).

### Managing users in a volatile system

Declare users normally in NixOS config:

```nix
users.users.kiosk = {
  isNormalUser = true;
  extraGroups = [ "networkmanager" ];
  home = "/home/kiosk";
};
```

If `/home` is tmpfs, this directory will vanish on reboot. You can recreate a skeleton home at login via `home-manager`, or preload with a `systemd` script.

Persistent user configs (e.g. browser profile) can be bound to `/persist/home/kiosk` if needed.

_Impermanence isn’t just about stateless systems -- it’s a mindset: if everything can be declared, then nothing has to be trusted._

---
## 8. Multimedia & Browsing: NixOS as a Daily Driver

- Hardware-accelerated video (VAAPI), audio (PipeWire vs PulseAudio)
- Browsers: Firefox with extensions in nix, Chromium with codecs
- Fonts, emoji, input methods: non-trivial but declarative

### Hardware-Accelerated Video (VAAPI)

Video decoding (e.g. in browsers, media players) often requires VAAPI.

1. Enable support via `hardware.opengl` and `vaapi` packages:

```nix
hardware.opengl.enable = true;
hardware.opengl.extraPackages = with pkgs; [
  intel-media-driver # for Intel iGPUs
  vaapiIntel
  vaapiVdpau
];
````

2. For AMD: include `mesa.drivers`.
3. For NVIDIA: VAAPI support is limited; use `nvidia-vaapi-driver` if using recent open kernel modules.

Check with `vainfo` inside a shell: `nix-shell -p libva-utils --run "vainfo"`
### Audio: PipeWire vs PulseAudio

Modern NixOS favors **PipeWire** as a unified backend for audio, video, and Bluetooth.

```nix
sound.enable = true;
hardware.pulseaudio.enable = false;
security.rtkit.enable = true;

services.pipewire = {
  enable = true;
  audio.enable = true;
  pulse.enable = true;
  alsa.enable = true;
  jack.enable = true;
};
```

PulseAudio is still available as a fallback:

```nix
hardware.pulseaudio.enable = true;
```

Use `pavucontrol` (GUI) or `pw-cli`, `wpctl` for CLI inspection.
### Browsers: Firefox, Chromium, Extensions

**Firefox**:

```nix
programs.firefox = {
  enable = true;
  package = pkgs.firefox;
  preferences = {
    "media.ffmpeg.vaapi.enabled" = true;
  };
  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
    darkreader
  ];
};
```

**Chromium**:

```nix
programs.chromium = {
  enable = true;
  commandLineArgs = [ "--enable-features=VaapiVideoDecoder" ];
};
```

To play proprietary codecs (e.g. H.264), use `chromium.override { enableWideVine = true; }`.

### Fonts, Emoji, Input Methods

Declarative font setup:

```nix
fonts = {
  enableDefaultPackages = true;
  packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    font-awesome
    dejavu_fonts
  ];
  fontconfig.defaultFonts = {
    serif = [ "DejaVu Serif" ];
    sansSerif = [ "DejaVu Sans" ];
    monospace = [ "DejaVu Sans Mono" ];
  };
};
```

**Emoji support**: Ensure `noto-fonts-emoji` is included.

**Input methods (e.g. Japanese, Chinese)**:

```nix
i18n.inputMethod = {
  enabled = "fcitx5";
  fcitx5.addons = with pkgs; [ fcitx5-mozc ];
};
```

Fcitx5 integrates better with Wayland, supports multiple languages.

NixOS requires up-front setup for a polished desktop, but once declared, it’s reproducible and portable across machines -- no more tweaking per-device quirks.

---
## 9. Gaming, Flatpak, and Emulators

- Steam on NixOS: common pitfalls
- Using Flatpak on immutable systems (integration caveats)
- Retroarch, Dolphin, Wine setups
### Steam on NixOS: Common Pitfalls

To run Steam properly, you must enable `steam.enable` and ensure 32-bit libraries are included.

```nix
programs.steam = {
  enable = true;
  package = pkgs.steam.override {
    extraPkgs = pkgs: with pkgs; [
      libpng
      libpulseaudio
      libGL
      vaapiIntel
    ];
  };
};
hardware.opengl.driSupport32Bit = true;
````

Pitfalls:
- **Missing 32-bit OpenGL drivers** → enable `hardware.opengl.driSupport32Bit`.
- **Fonts rendering incorrectly** → add `fonts.fontconfig.enable = true;`
- **Steam runtime conflicts** → prefer native runtime (`steam.override { withPrimus = false; }`)

Use `steam-run` to test 32-bit compatibility: `steam-run glxinfo | grep "OpenGL"`.
### Using Flatpak on Immutable Systems

Flatpak integrates well even with immutable root systems like NixOS, but:
- Flatpak apps won’t see fonts, themes, and icons unless explicitly exported.
- Portals (`xdg-desktop-portal`) must be configured and running.

Enable Flatpak support:

```nix
services.flatpak.enable = true;
xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
};
```

Integration caveats:
- GTK/QT themes installed via NixOS won’t apply automatically inside Flatpaks.
- Consider installing matching themes inside Flatpak itself via `flatpak install`.

Use Flatpak when:
- You want access to proprietary/closed apps (e.g. Zoom, Spotify).
- You need sandboxing or easy cross-distro compatibility.

### Emulators: Retroarch, Dolphin, Wine

**Retroarch**:

```nix
programs.retroarch.enable = true;
```

Add cores manually:

```nix
environment.systemPackages = with pkgs; [
  libretro.nestopia
  libretro.snes9x
  libretro.genesis-plus-gx
];
```

Enable gamepad support via `udev` rules if needed.

**Dolphin**:

```nix
environment.systemPackages = with pkgs; [ dolphinEmu ];
```

Wayland users: launch with `QT_QPA_PLATFORM=xcb` for proper input handling.

**Wine (32-bit + 64-bit)**:

```nix
environment.systemPackages = with pkgs; [
  wineWowPackages.stable
  winetricks
];
```

To run `.exe` reliably:
- Enable `hardware.opengl.driSupport32Bit = true;`
- Include necessary libraries (e.g. `libvulkan`, `libGL`, `libpulse`) in both 64-bit and 32-bit versions.

Use `winecfg` to test prefix setup, and `winetricks` to install common redistributables.

Gaming on NixOS works well once dependencies are declared explicitly -- no surprises, no drift, no "why did this break after an update".

---
## 10. Fast Deployments and Containers: DevOps on NixOS

- `nixos-container`, `nspawn`, `systemd` units
- Docker vs Podman: rootless and rootful options
- NixOps vs deploy-rs vs morph: declarative remote deployments
- CI/CD ideas with flakes and GitHub Actions

### `nixos-container`, `nspawn`, `systemd` Units

NixOS includes native support for lightweight containers via `nixos-container`. Example: declarative NixOS container defined inline

```nix
containers.my-service = {
  autoStart = true;
  config = { config, pkgs, ... }: {
    services.nginx.enable = true;
  };
};
````

Manage with:

- `nixos-container list`
- `nixos-container start my-service`
- `nixos-container run my-service -- bash`

Alternative: use `systemd-nspawn` for container-like isolation with a shared kernel:

```sh
machinectl pull-raw https://nixos.org/... my-container.raw
systemd-nspawn -D /var/lib/machines/my-container
```

Use `systemd.services.<name>` to declare local daemons in isolation.

### Docker vs Podman: Rootless and Rootful Options

Docker:

```nix
virtualisation.docker.enable = true;
users.users.yourname.extraGroups = [ "docker" ];
```

Podman (rootless-friendly, systemd native):

```nix
virtualisation.podman = {
  enable = true;
  dockerCompat = true;
  defaultNetwork.settings.dns_enabled = true;
};
```

Use `podman generate systemd` to create persistent services.  

Prefer Podman for:

- Rootless workflows
- Running containers inside containers (CI)
- Better compatibility with `systemd`
    
### NixOps vs `deploy-rs` vs `morph`

All three are for **declarative remote deployment** of NixOS systems. Key differences:

| Tool          | Description                            | Pros                         | Cons                      |
| ------------- | -------------------------------------- | ---------------------------- | ------------------------- |
| **NixOps**    | Legacy tool from NixOS project         | Supports EC2, GCE, etc.      | Can be slow, unmaintained |
| **morph**     | Simple deploy tool for SSH + NixOS     | Lightweight, Git-friendly    | No flake support          |
| **deploy-rs** | Flake-native deploy tool (recommended) | Fast, pure, supports secrets | Requires flake structure  |

Recommended for new setups: **deploy-rs**.  Minimal `deploy.nix`:

```nix
{
  nodes.my-server = {
    hostname = "192.168.1.100";
    sshUser = "deploy";
    profiles.system = {
      path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.my-server;
    };
  };
}
```

Then: `deploy --remote-build`.
### CI/CD Ideas with Flakes and GitHub Actions

**Use GitHub Actions to:**

- Lint and build flake outputs
- Test derivations in ephemeral VMs or containers
- Deploy to remote servers via SSH

Example: `.github/workflows/check.yml`

```yaml
jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: cachix/install-nix-action@v20
        with:
          extra_nix_config: |
            experimental-features = nix-command flakes
      - run: nix flake check
```

Add `deploy` stage to push to remote server via `deploy-rs` or morph.

Use `Cachix` for binary cache acceleration.

```yaml
      - uses: cachix/cachix-action@v12
        with:
          name: your-cache
          authToken: ${{ secrets.CACHIX_AUTH_TOKEN }}
```

_NixOS makes reproducible infrastructure and container workflows first-class -- no more drift, no more snowflake servers, no more broken CI because “it worked locally”._

---
## 11. Advanced Patterns and Idioms

- Overlaying packages
- Pinning nixpkgs versions
- Writing custom derivations
- Caching with Cachix, setting up a private binary cache
- Testing changes with `nixos-rebuild test` and `nix develop`

### Overlaying Packages

Overlays allow you to override or extend packages in `nixpkgs` without forking the entire tree.  In a flake:

```nix
outputs = { nixpkgs, ... }: {
  overlays.default = final: prev: {
    my_htop = prev.htop.overrideAttrs (old: {
      name = "htop-custom";
      configureFlags = [ "--enable-unicorn-mode" ];
    });
  };

  nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      { nixpkgs.overlays = [ self.overlays.default ]; }
      ./configuration.nix
    ];
  };
};
````

Use `my_htop` anywhere instead of `pkgs.htop`.
### Pinning nixpkgs Versions

To avoid surprises from rolling updates, use fixed versions of `nixpkgs`:

```nix
inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
```

Or a specific commit:

```nix
inputs.nixpkgs.url = "github:NixOS/nixpkgs/4b57cdd0...";
```

Then run `nix flake update` to update the lockfile. This gives you repeatable, predictable builds.

### Writing Custom Derivations

Use `stdenv.mkDerivation` for simple packages:

```nix
{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "my-tool";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "me";
    repo = "my-tool";
    rev = "v1.0";
    sha256 = "sha256-...";
  };

  buildInputs = [ ];
  installPhase = ''
    mkdir -p $out/bin
    cp my-tool $out/bin/
  '';
}
```

Add to `overlay` or expose via a flake output.

Use `mkShell` for dev shells, `buildGoModule`, `buildPythonPackage`, etc. for language-specific builders.

### Caching with Cachix

**Cachix** lets you avoid recompilation by using a shared binary cache.  Set up with: `nix run nixpkgs#cachix use my-cache`.  For CI:

```yaml
- uses: cachix/cachix-action@v12
  with:
    name: my-cache
    authToken: ${{ secrets.CACHIX_AUTH_TOKEN }}
```

To set up your own binary cache:

- Use `nix-serve` or `attic`
- Push builds with `nix copy --to`
- Secure with substituter keys

### Testing Changes with `nixos-rebuild test` and `nix develop`

- `nixos-rebuild test`: applies config temporarily -- no bootloader update, no persistence
- `nixos-rebuild dry-activate`: shows what would change
- `nixos-rebuild build-vm`: spin up a test VM with your config
    

For per-project dev environments:

```nix
devShells.default = pkgs.mkShell {
  buildInputs = [ pkgs.python311 pkgs.poetry ];
};
```

Run via `nix develop`.

Switch environments instantly without polluting the global system.

_Once you understand overlays, pinning, and caching, you gain full control over the build graph of your system -- like a compiler for infrastructure._

---
## 12. Appendix: Troubleshooting and Survival Mode

- If boot breaks: use live ISO + `nixos-enter`
- Debugging rebuild failures
- Dirty state: how to clean `~/.cache/nix`, `.nix-profile`, `/nix/store`
- Updating flake inputs with `nix flake update`

### If Boot Breaks: Use Live ISO + `nixos-enter`

1. Boot from NixOS live ISO (same architecture as installed system).
2. Mount your root filesystem:

```sh
mount /dev/sdXn /mnt
mount /dev/sdXb /mnt/boot # if separate
````

3. Access system with: `nixos-enter --root /mnt`.  You now have an environment with full access to the broken system's config, nix store, and tools.  Fix, edit, and rebuild: `nixos-rebuild switch`.  If `/etc/nixos/configuration.nix` is corrupted or missing, regenerate it with `nixos-generate-config`.

### Debugging Rebuild Failures

Use: `nixos-rebuild switch --show-trace`. Add `--verbose` or `--keep-failed` to inspect build outputs. 

Common causes:

- Package renamed or removed in new nixpkgs revision.
- Syntax error or incorrect option (check `nixos-option`).
- Missing inputs or overlays in a flake.

Test build without applying: `nixos-rebuild build`.  Then inspect the result in `./result`.

### Cleaning Dirty State

Clear user profile bloat:

```sh
nix-env --delete-generations old
nix-collect-garbage -d
```

Clear flake registry and cache:

```sh
nix registry list
nix flake show
```

Purge all unused paths:

```sh
sudo nix-store --gc
sudo nix-store --verify --check-contents --repair
```

Clear user caches:

```sh
rm -rf ~/.cache/nix
rm -rf ~/.config/nixpkgs
rm -rf ~/.nix-profile
```

Note: `/nix/store` is append-only and garbage-collected, never manually remove paths inside.

### Updating Flake Inputs

To bump all inputs: `nix flake update`.
To view inputs: `nix flake metadata`.
To upgrade specific input: `nix flake lock --update-input nixpkgs`.
To inspect lockfile: `less flake.lock`
After update, test with: `nixos-rebuild test --flake .#myhost`

_NixOS can always be recovered -- because your system is code, not state. A broken machine is just one `rebuild` away from being whole again._

---
## 13. Final Notes and Learning Path

- Where to go next: channels, matrix chats, GitHub issues
- Recommended repositories and flakes to study
- Keeping the system clean, documented, and portable

### Recommended Repositories and Flakes to Study

| Name              | Description                              |
| ----------------- | ---------------------------------------- |
| `nixpkgs`         | https://github.com/NixOS/nixpkgs         |
| `nixpkgs-wayland` | Wayland-specific packages and configs    |
| `nix-darwin`      | macOS module system for Nix (like NixOS) |
| `home-manager`    | User-level config system                 |
| `nix-colors`      | Theme abstraction layer (GTK/QT/TTY)     |
| `nixvim`          | Declarative Neovim setup via flakes      |
| `devshell`        | Prebuilt dev shells with sane defaults   |
| `deploy-rs`       | Git-based remote deployment tool         |

Search GitHub for: `topic:nixos language:nix flake`.  Look for clean flake structures, modular configs, and tested patterns.

### Keeping the System Clean, Documented, and Portable

- **Use flakes** to pin versions and describe inputs precisely.
- **Write modules** for repeated logic (e.g. ssh hardening, dev tools).
- **Separate concerns**: system config, user config, secrets.
- **Commit your configs**: your `configuration.nix` is your new `/etc`.
    
Good practices:

- `nix flake update && nix flake lock` before every upgrade.
- `nix fmt` or `alejandra` to autoformat.
- Keep generated `.drv` paths and outputs out of Git.
- Avoid mutable installs (`nix-env`) unless for quick testing.

> NixOS isn’t about knowing everything -- it’s about knowing _what you’ve declared_.
> 
> It lets you write your system once, track it in Git, and reapply it anywhere -- from a Raspberry Pi to a cloud instance. Whether for one laptop or a global fleet, the principles remain the same: clarity, reproducibility, trust in code over state.

The journey doesn’t end -- it just gets more declarative.
