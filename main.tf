
module "lerncloud" {
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-maas"
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-multipass"
  #source     = "git::https://github.com/mc-b/terraform-lerncloud-aws"
  source     = "git::https://github.com/mc-b/terraform-lerncloud-azure"
  
  module     = "m239"
  description = "M239 - Internetserver in Betrieb nehmen"
    
  userdata    = "cloud-init.yaml"
  
    # VM Sizes  
  storage = 8
  memory =  2
  cores = 2
  #count = "24"
}