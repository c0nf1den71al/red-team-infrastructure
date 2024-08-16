<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<div align="center">
  <a href="#">
    <img src="/logo.png" alt="Logo" width="100" height="100">
  </a>
  <br /><br />
  <p align="center">
    Quickly Create Red Team Infrastucture.
    <br /><br />
    <a href="#"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="#getting-started">Quick Start</a>
    ·
    <a href="https://github.com/c0nf1den71al/red-team-infrastructure/issues">Report Bug</a>
    ·
    <a href="https://github.com/c0nf1den71al/red-team-infrastructure/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project
![Network Diagram](/network-diagram.png)

This repo aims to be a quick and easy way to spin up red team infrastucture. Whilst currently a work in progress, this project strives to provide a fully customisable, automated, approach to create infrastucture for red team engagements.

The base infrastructure includes the following: 
* VPN "jump box" exposing the internal subnet over [Tailscale](https://tailscale.com/).
* Short and long term C2 servers exposed over several (customisable) redirectors.
* [ELK](https://www.elastic.co/elastic-stack/) server providing full logging and metrics for the environment. 
<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

This section lists any major frameworks/libraries used to make this project happen:

* [AWS](https://aws.amazon.com)
* [Terraform](https://www.terraform.io)
* [Ansible](https://www.ansible.com)
* [Tailscale](https://tailscale.com)
* [Elastic](https://www.elastic.co/elastic-stack/)
* [Nginx](https://nginx.org/en/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<a name="getting-started"></a>
<!-- GETTING STARTED -->
## Getting Started

Note that the `install.sh` script is currently a work in progress, therefore, follow the steps below to get started. 

### Prerequisites
1. Create SSH keys for Ansible:

```sh
mkdir keys
ssh-keygen -f ./keys/ansible
```

2. Install [Ansible](https://www.ansible.com) and initialise [AWS CLI](https://aws.amazon.com/cli/)

3. Install required ansible plugins:

```
ansible-galaxy collection install cloud.terraform
```

### Installation
1. Create `terraform.tfvars` using `terraform.tfvars.example` as an example.

2. Spin up infrastructure with the following terraform commands

```sh
terraform init
terraform apply
```

3. Run Ansible

```sh
ansible-playbook -i inventory.yml -u ubuntu ansible/main.yml
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- USAGE EXAMPLES -->
## Usage

View final config and credentials:

```sh
terraform output -raw table
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

- [ ] Full Documentation
- [ ] Add more C2 Server
- [ ] Install script

See the [open issues](https://github.com/c0nf1den71al/red-team-infrastructure/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Jamie Pegg - contact@jamiepegg.com

Project Link: [https://github.com/c0nf1den71al/red-team-infrastructure](https://github.com/c0nf1den71al/red-team-infrastructure)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Todo

* Todo
* Todo
* Todo

<p align="right">(<a href="#readme-top">back to top</a>)</p>
