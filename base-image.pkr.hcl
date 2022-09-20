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
    ami_name = "base-image-${local.timestamp}"
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
        "echo Installing vim rc",
        "sleep 10",
        "curl https://raw.githubusercontent.com/linuxacademy/content-hashicorp-packer/master/env/vimrc -o ~/.vimrc",
    ]
}
}