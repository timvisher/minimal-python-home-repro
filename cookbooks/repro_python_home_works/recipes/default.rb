python_runtime 'foo' do
  version '3'
end

# apt_package 'python3.4-venv'

# directory "/home/ubuntu/.virtualenvs" do
#   user 'ubuntu'
#   group 'ubuntu'
# end

python_virtualenv "/home/ubuntu/.virtualenvs/testvenv" do
  user 'ubuntu'
  group 'ubuntu'
end

remote_directory "/home/ubuntu/test_python_project" do
  source 'test_python_project'
  user 'ubuntu'
  group 'ubuntu'
end

python_execute 'install test_python_project in dev mode' do
  command ['-m', 'pip', 'install', '-e', '.']
  user 'ubuntu'
  group 'ubuntu'
  cwd "/home/ubuntu/test_python_project"
  virtualenv "/home/ubuntu/.virtualenvs/testvenv"
  environment({
                'HOME' => '/home/ubuntu'
              })
end

python_package 'pylint'
python_package 'ipdb'
