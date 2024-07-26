
source "yandex" "debian_docker" {
  disk_type           = "network-hdd"
  folder_id           = "b1gb5es4tqhi7j0ohvrq"
  image_description   = "my custom debian with docker"
  image_name          = "debian-11-manager"
  source_image_family = "debian-11"
  ssh_username        = "debian-11-manager"
  subnet_id           = "e9brfhk4mhgckvhppbsh"
  token               = "xxxxx"
  use_ipv4_nat        = true
  zone                = "ru-central1-a"
}

build {
  sources = ["source.yandex.debian_docker"]

  provisioner "shell" {
    inline = [<<EOF
        echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
        sudo apt-get install -y -q
        # Add Docker's official GPG key:
        sudo apt-get -y update
        sudo apt-get -y install ca-certificates curl gnupg
        sudo install -m 0755 -d /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        sudo chmod a+r /etc/apt/keyrings/docker.gpg

        # Add the repository to Apt sources:
        echo \
          "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
          $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
          sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        
        sudo apt-get -y update
        sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
        sudo apt-get install -y htop
        sudo apt-get install -y tmux
        EOF
    ]
  }
}