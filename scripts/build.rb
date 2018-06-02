#!/usr/bin/ruby

def build(project)
  return "informe um projeto para fazer a build" unless project

  system("rm -rf #{project}/build")
  system("rm -rf #{project}/dev")

  system("tar -xf #{project}/build.tar.gz")
  system("rm #{project}/build.tar.gz")
  system("mv build #{project}/dev")
  system("mv #{project}/dev/unbundled #{project}/dev/build")

  system("sudo systemctl restart nginx")

end

project = ARGV[0]
p build(project)
