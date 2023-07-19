module "my_key_pair" {
    source = "github.com/rlaehdals/terraform-archive/key_pair"
    key_name = var.key_name
    path_to_public_key = file(var.path_to_public_key)
}