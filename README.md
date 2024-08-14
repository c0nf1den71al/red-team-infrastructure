<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<div align="center">
  <a href="#">
    <img src="#" alt="Logo" width="250" height="100">
  </a>
  <br /><br />
  <p align="center">
    Quickly Create Red Team Infrastucture.
    <br /><br />
    <a href="#"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="#">Network Diagram</a>
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
![Network Diagram](#)

Todo

Todo

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

This section lists any major frameworks/libraries used to make this project happen:

* AWS
* Terraform
* Ansible
* Tailscale
* Elastic 

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

Todo

### Prerequisites
1. Create SSH keys for Ansible:

```sh
mkdir keys
ssh-keygen -f ./keys/ansible
```

2. Install ansible and initialise AWS CLI

3. Install required ansible plugins:

```
ansible-galaxy collection install cloud.terraform
```

### Installation
1. Create `terraform.tfvars` and insert vars from `terraform.tfvars.example`.

2. Spin up infrastructure

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

Todo

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [ ] Documentation

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
