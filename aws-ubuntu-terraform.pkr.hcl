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
    source_ami = "ami-08d4ac5b634553e16"
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
        "sleep 10",
        "sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl unzip",
        "wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg"
        "gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint",
        "echo \"deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main\" | sudo tee /etc/apt/sources.list.d/hashicorp.list",
        "sudo apt update -y"
        "sudo apt-get install terraform -y"
    ]
}
provisioner "shell" {
    inline = [
        "echo Installing AWS CLI",
        "sleep 10",
        "curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip",
        "unzip awscliv2.zip",
        "sudo ./aws/install",
    ]
}
provisioner "shell" {
    inline = [
        "echo Installing vim rc",
        "sleep 10",
        "curl https://raw.githubusercontent.com/linuxacademy/content-hashicorp-packer/master/env/vimrc -o ~/.vimrc",
    ]
}
}
