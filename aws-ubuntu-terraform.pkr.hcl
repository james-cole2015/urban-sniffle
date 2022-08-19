packer {
    required_plugins {
        amazon = {
            version = ">= 0.0.2"
            source = "github.com/hashicorp/amazon"
        }
    }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "ubuntu" {
    ami_name = "terraform-image-${local.timestamp}"
    instance_type = "t2.small" 
    region = "us-east-1" 
    source_ami_filter {
        filters = {
            name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
            root-device-type = "ebs" 
            virtualization-type = "hvm" 
        }
        most_recent = true 
        owners = ["099720109477"]
    }
    ssh_username = "ubuntu"
}

build {
    name = "learn-packer" 
    sources = [
        "source.amazon-ebs.ubuntu"
    ]

provisioner "shell" {
    inline = [
        "echo Installing Terraform",
        "sleep 30",
        "apt install curl unzip -y",
        "sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl",
        "curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -",
        "sudo apt-add-repository 'deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main' -y",
        "sudo apt-get update && sudo apt-get install terraform -y",
    ]
}
provisioner "shell" {
    inline = [
        "echo Installing AWS CLI",
        "sleep 30",
        "curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip",
        "unzip awscliv2.zip",
        "sudo ./aws/install",
    ]
}
provisioner "shell" {
    inline = [
        "echo Installing vim rc",
        "sleep 30",
        "curl https://raw.githubusercontent.com/linuxacademy/content-hashicorp-packer/master/env/vimrc -o ~/.vimrc",
    ]
}
}
