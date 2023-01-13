#!/usr/bin/env bb
(ns install-manjaro 
  (:require [babashka.tasks :as b]
            [clojure.string :as str]))
(def pacman #{"git-delta" 
              "neovim" 
              "xcape" 
              "kitty" 
              "lazygit"
              "yadm"
              "zk"
              "zsh"})

(b/shell (format "sudo pacman -Syu %s" (str/join " " pacman)))

(b/shell "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"")
