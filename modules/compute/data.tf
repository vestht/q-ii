data "template_file" "user_data_script" {
    template = file("scripts/init.sh")
}